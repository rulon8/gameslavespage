class ContactController < ApplicationController
    before_action :authenticate_user!
    def contact
      
    end
    
    def enviar
      name = params[:name]
      email = params[:email]
      subject = params[:subject]
      message = params[:message]
      tosend = "admin@gameslavesteam.com"
      #GuestMailer.enviar(name, email, subject, message)
      mail(:to => tosend, :subject => params[:subject], :text => params[:message] )
      redirect_to action: "contact"  
    end
end
