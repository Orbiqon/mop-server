# frozen_string_literal: true

class SubscriptionMailer < ApplicationMailer
  def subscription_created(subscription_id)
    @subscription = Subscription.includes(:user).find_by(id: subscription_id)
    mail(to: @subscription.user.email, subject: 'Subscribed Successfully')
  end

  def subscription_expired(subscription_id)
    @subscription = Subscription.includes(:user).find_by(id: subscription_id)
    mail(to: @subscription.user.email, subject: 'Subscription Expired')
  end
end
