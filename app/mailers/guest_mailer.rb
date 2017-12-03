class GuestMailer < ApplicationMailer
  
  def enviar
    @name = name
    @email = email
    @subject = subject
    @message = message
    mail(from: 'support@gameslaves.com', to: 'giancalonghi@hotmail.com', subject: @subject)
  end
  
end
