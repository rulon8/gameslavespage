class PostsController < ApplicationController
    #before_action :find_post, only: [:edit, :update, :show, :delete]
        @titulo
        @descripcion
        @cuerpo
        @categorias
        @etiquetas
        @imagen
        @image
        @nombreimagen = ""
        @descripimagen = ""
        
        def index
            @posts = Post.all
            
                        

            @titulo = "lol"
            @users = User.all
        end
        
        def new
            @post = Post.new
            @user = User.new
            @nombre = "Crear Post"


        end
        
        def create
            @post = Post.new
            #@post[:title] = params[:post][:title]
            #@post[:description] = params[:post][:description]
            #@game[:information] = params[:game][:information]
            #@game[:requirements] = params[:game][:requirements]
            #@game.save
            #redirect_to "/users/creaTemp" and return
        end

    
end
