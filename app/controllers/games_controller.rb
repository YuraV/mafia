class GamesController < ApplicationController

  before_filter :game_find, except: [:create, :new, :index]
  before_filter :user_scoped, except: [:index]

  respond_to :html

  def index
    @games = Game.all
  end

  def show
    @appointments = Appointment.scoped
    @used_ids = @game.appointments.pluck(:user_id)
    #@used_ids = ' ' if @used_ids == nil
    #Rails.logger.info User.where("id  not in (?) ", @used_ids).pluck(:id)
    #Rails.logger.info @used_ids
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