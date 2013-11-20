class PlayersController < ApplicationController

  before_filter :find_game
  respond_to :html, :js

  def create
    Rails.logger.info params
    @player = @game.players.build(params[:player])
    @player.save
    respond_with @game, @player, :location => game_path(@game)
  end

  def create_bunch
    @game.update_attributes(players_attributes: params.fetch(:player_data, []))
    render nothing: true
  end

  def show

  end

  def destroy
    @player = @game.players.find(params[:id])
    @player.destroy
    respond_with @game, @player, :location => game_path(@game)
  end

  def destroy_all
    @players = @game.players.all.map(&:destroy)
    respond_with @game, @player, :location => game_path(@game)
  end

  def set_role
    Rails.logger.info params
    @player = @game.players(params[:player])
    #render 'players/role', layout: false
  end

  def put_roles
    @game.update_attributes(params.fetch(:game, {}))
    @game.players.each do |appointment|
      appointment.set_team!
    end

    respond_with(@game, @player) do |format|
      format.html { render partial: 'games/drop_zone' if request.xhr? }
    end
  end

  def get_remarks
    @player = @game.players(params[:player])
  end

  def put_remarks
    @game.update_attributes(params.fetch(:game, {}))
    respond_with(@game, @player) do |format|
      format.html { render partial: 'games/display_remarks' if request.xhr? }
    end

  end

  private

  def find_game
    @game = Game.find(params[:game_id])
  end

end
