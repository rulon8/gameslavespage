class GamesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  def index
    @games = Game.all.order(id: :desc)
    @total = Game.count
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new
    @game[:name] = params[:game][:name]
    @game[:description] = params[:game][:description]
    @game[:information] = params[:game][:information]
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
    @game[:requirements] = params[:game][:requirements]
    @game.save
    redirect_to action: "show"
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to action: "index"
  end
end
