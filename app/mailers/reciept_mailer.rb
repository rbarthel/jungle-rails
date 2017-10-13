class RecieptMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def email_receipt(user, order, line_items)
    @user = user
    @order = order
    @line_items = line_items
    mail(to: @user.email, subject: "Receipt for order ##{ @order.id } at Jungle")
  end
end
