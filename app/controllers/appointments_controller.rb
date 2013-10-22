class AppointmentsController < ApplicationController

  before_filter :find_game
  respond_to :html, :js

  def create
    Rails.logger.info params
    @appointment = @game.appointments.build(params[:appointment])
    @appointment.save
    respond_with @game, @appointment, :location => game_path(@game)
  end

  def create_bunch
    @game.update_attributes(appointments_attributes: params.fetch(:appointment_data, []))
    render nothing: true
  end

  def show

  end

  def destroy
    @appointment = @game.appointments.find(params[:id])
    @appointment.destroy
    respond_with @game, @appointment, :location => game_path(@game)
  end

  def destroy_all
    @appointments = @game.appointments.all.map(&:destroy)
    respond_with @game, @appointment, :location => game_path(@game)
  end

  def set_role
    Rails.logger.info params
    @appointment = @game.appointments(params[:appointment])
    #render 'appointments/role', layout: false
  end

  def put_roles
    @game.update_attributes(params.fetch(:game, {}))
    @game.appointments.each do |appointment|
      appointment.set_team!
    end

    respond_with(@game, @appointment) do |format|
      format.html { render partial: 'games/drop_zone' if request.xhr? }
    end
  end

  def get_remarks
    @appointment = @game.appointments(params[:appointment])
  end

  def put_remarks
    @game.update_attributes(params.fetch(:game, {}))
    respond_with(@game, @appointment) do |format|
      format.html { render partial: 'games/display_remarks' if request.xhr? }
      format.html { render partial: 'games/drop_zone' }
    end

  end

  private

  def find_game
    @game = Game.find(params[:game_id])
  end

end
