# frozen_string_literal: true

require('stripe')
require('dry/monads/result')
require('dry/matcher/result_matcher')

class StripeService
  include Dry::Monads::Result::Mixin
  include Dry::Matcher.for(:call, with: Dry::Matcher::ResultMatcher)

  attr_reader :package, :user

  def initialize(user, package = nil)
    @package = package
    @user = user
    Stripe.api_key = 'pk_live_ZMJmXZiucoxOzPR7FYEy9JCB'
  end

  def process_payment(amount)
    charge = Stripe::Charge.create(
      amount: (amount * 100).to_i,
      description: payment_description,
      customer: user.stripe_id,
      currency: 'USD'
    )
    Success(charge: charge)
  rescue StandardError => e
    Failure(message: e.message)
  end

  def create_stripe_user(token, type = "user")
    return unless user.stripe_id.nil?
    
    begin
      stripe_user = Stripe::Customer.create({
                                              name: type,
                                              email: user.email,
                                              source: token
                                            })
      user.update(stripe_id: stripe_user.id)
      Success(user: user)
    rescue StandardError => e
      Failure(message: e.message)
    end
  end

  def change_card(token)
    cards = Stripe::Customer.list_sources(
      user.stripe_id,
      { object: 'card', limit: 1 }
    )
    card = cards.data.first
    Stripe::Customer.delete_source(
      user.stripe_id,
      card.id
    )
    new_card = Stripe::Customer.create_source(
      customer.stripe_id,
      { source: token }
    )

    Success(card: new_card)
  rescue StandardError => e
    Failure(message: e.message)
  end

  def payment_description
    package ? "Package - (#{package.name})" : "Order Confirmation"
  end

  def card_information
    return if user.stripe_id.nil?

    begin
      cards = Stripe::Customer.list_sources(
        user.stripe_id,
        { object: 'card', limit: 1 }
      )
      Success(card: cards.data.first)
    rescue StandardError => e
      Failure(message: e.message)
    end
  end
end
