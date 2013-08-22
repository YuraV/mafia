class GamesController < ApplicationController

  before_filter :game_find, except: [:create, :new, :index]

  respond_to :html

  def index
    @games = Game.all
  end

  def show

  end

  def new
    @users = User.scoped
    @game = Game.new
  end

  def create
    @game = Game.new(params[:game])
    @game.save
    respond_with @game
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