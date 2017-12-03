class PostsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
        @@etiqueta  = ["Arte", "Jugabilidad"]
        @@categoria = ["MOBA","Shooter"]
        def index
            @posts = Post.page(params[:page]).per(3)
        end
        
        def new
            @post = Post.new
            @etiquetas = @@etiqueta
            @categorias = @@categoria
            @nombre = "Crear Post"
        end
        
        def create
            @etiqTem = Array.new
            @categTem = Array.new
            @post = Post.new
            @post[:title] = params[:post][:title]
            @post[:date] = DateTime.now.strftime('%Y-%m-%d %H:%M:%S')
            @post[:description] = params[:post][:description]
            @post[:user_id] = current_user[:id]
            params.each do |a| 
                if @@etiqueta.include? a
                    @etiqTem.push(a)
                end
                if @@categoria.include? a
                    @categTem.push(a)
                end 
            end
            @post[:categories] = @categTem
            @post[:tags] = @etiqTem
            @post.save
            flash[:notice] = "Post Creado!"
            redirect_to action: "index"
        end
        
        def show
            @post = Post.find(params[:id])
        end
        
        def destroy
            @post = Post.find(params[:id])
            @post.destroy
            redirect_to action: "index"
        end
    
end
