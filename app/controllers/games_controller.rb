class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
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
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
