class PostsController < ApplicationController
    #before_action :find_post, only: [:edit, :update, :show, :delete]
        @titulo
        @descripcion
        @cuerpo
        @imagen
        @image
        @nombreimagen = ""
        @descripimagen = ""
        #@currentUser = User.first

        
        def index
            @posts = Post.page(params[:page]).per(3)
            #@posts = Post.limit(1*@numPag).order(desc).limit(1)
            #@posts = Post.listing(params[:page])            
            #@posts = Post.listing(params[:page]).per(1).order(created_at: :desc)
            #@titulo = "lol"
            #@users = User.all
            #Post.count                     #=> 1000
            #@postss = Post.limit(2); @postss.count     #=> 5
            #@postss.page(1).per(20).size         #=> 20
            #@postss.page(1).per(20).total_count
            #@postss = Post.order(:id).page params[:page]
        end
        
        def new
            @post = Post.new
            #@user = User.new
            @etiquetas = Array["Arte", "Jugabilidad"]
            @categorias = Array["MOBA","Shooter"]
            @nombre = "Crear Post"

        end
        
        def create
            @etiqTem = Array.new
            @categTem = Array.new
            @post = Post.new
            #user = User.where(username: "Dratad")
            #t = Time.now
            @post[:title] = params[:post][:title]
            @post[:date] = DateTime.now.strftime('%Y-%m-%d %H:%M:%S')#DateTime.now.to_formatted_s(:db)#.strftime('%Y-%m-%d %H:%M:%S')
            @post[:description] = params[:post][:description]
            @post[:user_id] = current_user[:id] #user[0][:id] #User.first.
            if params.include? "Arte"
                etiqTem.push("Arte")
            end
            if params.include? "MOBA"
                etiqTem.push("MOBA")
            end
            #@game[:information] = params[:game][:information]
            #@game[:requirements] = params[:game][:requirements]
            @post.save
            #redirect_to "/users/creaTemp" and return
        end
        
        def show
            @post = Post.find(params[:id])
        end

    
end
