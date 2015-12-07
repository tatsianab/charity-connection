class UserMailer < ApplicationMailer
   default from: 'businesscharityconnect@gmail.com'

  def order_email(user,cart_items)
      @cart_items = cart_items
      @user = user
      @url  = 'http://www.gmail.com'
      mail(to: @user.email, subject: 'Confirmation order')
  end

  def order_business(businessmy,user)
    @businessmy = businessmy
    @user = user
    @url  = 'http://www.gmail.com'
    mail(to: @businessmy.email, subject: 'Notification')
  end

end