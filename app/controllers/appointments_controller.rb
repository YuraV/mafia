class AppointmentsController < ApplicationController

  respond_to :html, :json

  def create
    @game = Game.find(params[:game_id])
    @appointment = @game.appointments.build(params[:appointment])
    @appointment.save
    respond_with @game, @appointment
  end

  def show

  end
end