class GuestMailer < ApplicationMailer
  
  def enviar(name, email, subject, message)
    @name = name
    @email = email
    @subject = subject
    @message = message
    mail(to:'gameslavesteam@gmail.com', subject: 'Contacto')
  end
  
end
