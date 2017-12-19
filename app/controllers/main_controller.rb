class MainController < ApplicationController
    def main
        if user_signed_in? && current_user[:username] == nil
           redirect_to usuario_path() 
        end
        @pictures = Picture.where(in_front_page: true).order(created_at: :desc).limit(4)
        @posts = Post.order(created_at: :desc).limit(3)
    end
    
    def about
    end
    
    def in_development
      @posts = Post.all
    end
    
    def usuario
    end
    
    def guardar_usuario
       @usuario = current_user
       @usuario[:username] = params[:username]
       @usuario.save
       redirect_to root_path
    end
    
    def not_found
    end
end
