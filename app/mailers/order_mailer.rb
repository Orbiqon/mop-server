class OrderMailer < ApplicationMailer
  def completed_order(id)
    byebug
    @order = Order.find_by(id: id)
    mail(to: "yasiramjad77@gmail.com", subject: "Order Submited")
    # mail(to: @order.user.email, subject: "Order Submited")
  end
end
