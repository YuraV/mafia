class GamesController < ApplicationController

  before_filter :game_find, except: [:create, :new, :index]

  def index
    @games = Game.all
  end

  def show

  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  private

  def game_find
    @game = Game.find(params[:id])
  end
end