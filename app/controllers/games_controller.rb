class GamesController < ApplicationController

  before_filter :game_find, except: [:create, :new, :index]
  before_filter :user_scoped, except: [:index, :show]

  respond_to :html

  def index
    @games = Game.all
  end

  def show
    @appointments = Appointment.scoped
   
  end

  def new
    @game = Game.new
    render "games/new", layout: false
  end

  def create
    @game = Game.create(params[:game])
    respond_with @game
  end

  def edit

  end

  def update
    @game.update_attributes(params[:game])
    respond_with @game
  end

  def destroy
    @game.destroy
    redirect_to games_path
  end


  private

  def game_find
    @game = Game.find(params[:id])
  end

  def user_scoped
    @users = User.scoped
  end
end