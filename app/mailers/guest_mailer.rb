require 'pry'
class GuestMailer < ApplicationMailer
  default :from => "demo.botree@gmail.com"

  def send_setup_details(entity)
    @entity = entity
    email = entity[:email]
    mail(to: email, :subject => "New account setup")
  end
end
