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
        #@currentUser = User.first
        @numPag = 1;
        
        def index
            @posts = Post.all
            #@posts = Post.limit(1*@numPag).order(desc).limit(1)
            #@posts = Post.listing(params[:page])            
            #@posts = Post.listing(params[:page]).per(1).order(created_at: :desc)
            #@titulo = "lol"
            #@users = User.all
        end
        
        def new
            @post = Post.new
            #@user = User.new
            @nombre = "Crear Post"

        end
        
        def create
            @post = Post.new
            user = User.where(username: "Dratad")
            #t = Time.now
            @post[:title] = params[:post][:title]
            @post[:date] = DateTime.now.strftime('%Y-%m-%d %H:%M:%S')#DateTime.now.to_formatted_s(:db)#.strftime('%Y-%m-%d %H:%M:%S')
            @post[:description] = params[:post][:description]
            @post[:user_id] = user[0][:id] #User.first.
            #@game[:information] = params[:game][:information]
            #@game[:requirements] = params[:game][:requirements]
            @post.save
            #redirect_to "/users/creaTemp" and return
        end
        
        def show
            @post = Post.find(params[:id])
        end

    
end
