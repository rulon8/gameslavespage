class ContactController < ApplicationController
    before_action :authenticate_user!
    #default :from => "admin@gameslavesteam.com"
    def contact
      
    end
    
    def enviar
      name = params[:name]
      email = params[:email]
      subject = params[:subject]
      message = params[:message]
      GuestMailer.enviar(name, email, subject, message).deliver
      #GuestMailer.enviar(name, email, subject, message).deliver
      #mail(:to => tosend, :subject => params[:subject], :text => params[:message] )
      #correo(@name, @email, @subject, @message, @tosend).deliver
      redirect_to root_path  
    end
end
