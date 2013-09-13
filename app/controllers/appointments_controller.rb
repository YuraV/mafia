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
    game = Game.find(params[:game_id])
    params.fetch(:appointment_data, []).each do |_, data|
      game.appointments.create(data)
    end

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

  #def edit
  #  @game = Game.find(params[:game_id])
  #  @appointment = @game.appointments.build(params[:appointment])
  #  render 'appointments/role', layout: false
  #end

  #def update
  #  @game = Game.find(params[:game_id])
  #  @appointments = @game.appointments.find(params[:id])
  #  #@appointment = @game.appointments(params[:appointment])
  #  @game.appointments.build.update_attributes(params[:appointment])
  #  respond_with @game, @appointment, :location => game_path(@game)
  #end

end