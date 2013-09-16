class AppointmentsController < ApplicationController

  respond_to :html, :json

  def create
    @game = Game.find(params[:game_id])
    Rails.logger.info params
    @appointment = @game.appointments.build(params[:appointment])
    @appointment.save
    respond_with @game, @appointment, :location => game_path(@game)
  end

  def create_bunch
    @game = Game.find(params[:game_id])
    @game.update_attributes(appointments_attributes: params.fetch(:appointment_data, []))
    render nothing: true
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

  def set_role
    @game = Game.find(params[:game_id])
    Rails.logger.info params
    @appointment = @game.appointments(params[:appointment])
    render 'appointments/role', layout: false
  end

  def put_roles
    @game = Game.find(params[:game_id])
    @game.update_attributes(params.fetch(:game, {}))
    respond_with @game, @appointment, location: game_path(@game)
  end

end