class GuestMailer < ApplicationMailer
  
  def enviar
    @name = name
    @email = email
    @subject = subject
    @message = message
    mail(from: 'gameslavesteam@gmail.com', to: 'giancalonghi@hotmail.com', subject: 'New message from contact form')
  end
  
end
