class RoundsController < ApplicationController

  before_filter :find_game

  def index

  end

  def new

    @round = Round.new
    @players = @game.appointments.pluck(:user_id)
  end

  def create
    Rails.logger.info params
    @game.rounds.create(params[:round])
  end

  def show

  end


private

  def find_game
    @game = Game.find(params[:game_id])
  end

end
