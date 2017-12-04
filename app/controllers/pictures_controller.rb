class PicturesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  def index
    @pictures = Picture.page(params[:page]).per(5)
  end
    
  def new
    @picture = Picture.new
    @pictures = Picture.all
    @games = Game.where.not(id: 6)
    @post_ids = []
    @pictures.each do |pic|
      @post_ids.insert(0, pic.post_id) if !@post_ids.include?(pic.post_id)
    end
    @ps = Post.where.not(id: 5)
    @posts = []
    @ps.each do |pos|
      @posts.insert(0, [pos.title, pos.id]) if !@post_ids.include?(pos.id)
    end
  end
  
  def create
    @picture = Picture.new
    file = params[:picture][:image]
    File.open(Rails.root.join('app', 'assets', 'images', file.original_filename), 'wb') do |f|
      f.write(file.read)
    end
    @picture[:name] = params[:picture][:name]
    @picture[:description] = params[:picture][:description]
    @picture[:image] = file.original_filename
    @picture[:in_front_page] = params[:picture][:in_front_page]
    if params[:g_id].empty?
      @picture[:game_id] = 6  #Game 6 esta oculto
    else
      @picture[:game_id] = params[:g_id]
    end
    if params[:p_id].empty?
      @picture[:post_id] = 5  #Post 5 esta oculto
    else
      @picture[:post_id] = params[:p_id]
    end
    @picture.save
    redirect_to action: "index"
  end
  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to action: "index"
  end
end
