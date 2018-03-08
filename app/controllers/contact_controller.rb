class ContactController < ApplicationController
    before_action :authenticate_user!
    default :from => "admin@gameslavesteam.com"
    def contact
      
    end
    
    def enviar
      @name = params[:name]
      @email = params[:email]
      @subject = params[:subject]
      @message = params[:message]
      @tosend = "admin@gameslavesteam.com"
      #GuestMailer.enviar(name, email, subject, message)
      mail(:to => tosend, :subject => params[:subject], :text => params[:message] )
      #correo(@name, @email, @subject, @message, @tosend).deliver
      redirect_to action: "contact"  
    end
    
    def correo(name, email, subject, message, tosend)
      @name = name
      @email = email
      @subject = subject
      @message = message
      @tosend = tosend
      mail(:to => tosend, :subject => @subject, :text => @message )
    end
end
