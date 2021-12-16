# frozen_string_literal: true

class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable,
         :trackable

  attr_accessor :confirm_url, :recover_url

  enum user_type: {
    customer: 0,
    artist: 1
  }

  has_one :profile
  has_many :artworks
  has_many :exhibitions
  has_many :subscriptions
  after_create :assign_default_role

  def assign_default_role
    add_role(user_type) if roles.blank?
  end

  def assign_artist_role
    add_role(:artist)
  end

  def artist?
    has_role(:artist)
  end

  # Disable confirmation
  def confirmation_required?
    false
  end
end
