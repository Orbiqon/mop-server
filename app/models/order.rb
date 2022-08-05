class Order < ApplicationRecord
  has_many :order_items
  accepts_nested_attributes_for :order_items
  
  belongs_to :user
  
  # after_create :send_mail
  
  # def send_mail
  #   OrderMailer.completed_order(id).deliver
  # end
end
