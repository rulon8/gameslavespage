class ContactController < ApplicationController
    before_action :authenticate_user!
    def contact
      
    end
    
    def enviar
      @name = params[:name]
      @email = params[:email]
      @subject = params[:subject]
      @message = params[:message]
      #GuestMailer.enviar(name, email, subject, message)
      mail(to: "admin@gameslavesteam.com") do |format|
        format.html { render layout: 'enviar' }
        format.text
      end
      redirect_to action: "contact"  
    end
end
