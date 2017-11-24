class PostsController < ApplicationController
    before_action :find_post, only: [:edit, :update, :show, :delete]
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
        end
        
        def new
            @post = Post.new
            @nombre = "Crear Post"

        end
        
        def create
            #@post = Post.new
            #if @post.save(post_params)
              #  flash[:notice] = "Successfully created post!"
            #    redirect_to post_path(@post)
           # else
            #    flash[:alert] = "Error creating new post!"
            #    render :new
          #  end
        end

    
end
