class PostsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
        @@etiqueta  = ["Art", "Gameplay","General", "Development", "Contests"]
        @@categoria = ["MOBA","Shooter", "News", "Hack/Slash", "SportsGame"]
        @@etiquetaOculta = ["Waifu Hunter (o)"] #NOTA: Se usa (o) para indicar en el código que no se muestra a los usuarios
        def index
            if params[:filtro]
                @posts = Post.where("id != 5 and ('" + params[:filtro] + "' = ANY (categories) or '" + params[:filtro] + "' = ANY (tags))").order(sticky: :asc, created_at: :desc).page(params[:page]).per(3)
            else
                @posts = Post.where.not(id: 5).order(sticky: :asc, created_at: :desc).page(params[:page]).per(3)
            end
            @filtros = @@etiqueta + @@categoria
        end
        
        def new
            @post = Post.new
            @etiquetas = @@etiqueta
            @categorias = @@categoria
            @etiquetasOcultas = @@etiquetaOculta
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
            @post[:sticky] = params[:post][:sticky]
            params.each do |a| 
                if @@etiqueta.include? a
                    @etiqTem.push(a)
                end
                if @@etiquetaOculta.include? a
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
            @first_post = Post.where.not(id: 5).order(created_at: :asc).limit(1)
            @last_post = Post.where.not(id: 5).order(created_at: :desc).limit(1)
            if @post == @first_post[0]
               @primero = true 
            end
            if @post == @last_post[0]
               @ultimo = true 
            end
        end
        
        def edit
            @post = Post.find(params[:id])
            @etiquetas = @@etiqueta
            @categorias = @@categoria
            @etiquetasOcultas = @@etiquetaOculta
            @nombre = "Editar Post"
        end
        
        def update
            @etiqTem = Array.new
            @categTem = Array.new
            @post = Post.find(params[:id])
            @post[:title] = params[:post][:title]
            @post[:description] = params[:post][:description]
            @post[:user_id] = current_user[:id]
            @post[:sticky] = params[:post][:sticky]
            params.each do |a| 
                if @@etiqueta.include? a
                    @etiqTem.push(a)
                end
                if @@etiquetaOculta.include? a
                    @etiqTem.push(a)
                end
                if @@categoria.include? a
                    @categTem.push(a)
                end 
            end
            @post[:categories] = @categTem
            @post[:tags] = @etiqTem
            @post.save
            flash[:notice] = "Post Modificado!"
            redirect_to action: "index"
        end
        
        def destroy
            @post = Post.find(params[:id])
            @pictures = Picture.where("post_id" => @post.id)
            if @post[:id] == 5
                redirect_to action: "index"
            else
                if !@pictures.empty?
                    @pictures[0].destroy
                end
                @post.destroy
                flash[:notice] = "Post Borrado!"
                redirect_to action: "index"
            end
        end
    
end
