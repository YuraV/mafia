class AppointmentsController < ApplicationController

  respond_to :html, :json

  def create
    @game = Game.find(params[:game_id])
    @appointment = @game.appointments.build(params[:appointment])
    @appointment.save
    respond_with @game, @appointment, :location => game_path(@game)
  end

  def show

  end

  def destroy
    @game = Game.find(params[:game_id])
    @appointment = @game.appointments.find(params[:id])
    @appointment.destroy
    respond_with @game, @appointment, :location => game_path(@game)
  end

  def destroy_all
    @game = Game.find(params[:game_id])
    @appointments = @game.appointments.all.map(&:destroy)
    respond_with @game, @appointment, :location => game_path(@game)
  end

end