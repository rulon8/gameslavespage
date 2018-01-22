class GamesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  def index
    @games = Game.where.not(id: 6).order(id: :desc)
    @total = Game.count
  end

  def show
    @game = Game.where(name: params[:id]).first
    @pictures = Picture.where("game_id" => @game.id)
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new
    @game[:name] = params[:game][:name]
    @game[:description] = params[:game][:description]
    @game[:information] = params[:game][:information]
    @game[:features] = params[:game][:features]
    @game[:requirements] = params[:game][:requirements]
    @game.save
    redirect_to action: "index"
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    @game[:name] = params[:game][:name]
    @game[:description] = params[:game][:description]
    @game[:information] = params[:game][:information]
    @game[:features] = params[:game][:features]
    @game[:requirements] = params[:game][:requirements]
    @game.save
    redirect_to "/game/" + @game[:name]
  end

  def destroy
    @game = Game.find(params[:id])
    @pictures = Picture.where("game_id" => @game.id)
    if @game[:id] == 6
      redirect_to action: "index"
    else
      if !@pictures.empty?
        @pictures.each do |pic|
          pic.destroy
        end
      end
      @game.destroy
      redirect_to action: "index"
    end
  end
  
end
