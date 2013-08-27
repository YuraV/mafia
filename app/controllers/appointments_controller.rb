class AppointmentsController < ApplicationController

  respond_to :html, :json

  def create
    @game = Game.find(params[:game_id])
    @appointment = @game.appointments.build(params[:appointment])
    @appointment.save
    puts "++++++++++++++++++++++++++++++++"
    puts @game.appointments.count
    if @game.appointments.count == 10
      redirect_to games_path
    else
      respond_with @game, @appointment
    end 
    
  end

  def show

  end

  def destroy
    @game = Game.find(params[:game_id])
    @appointment = @game.appointments.find(params[:id])
    @appointment.destroy
    respond_with @game, @appointment, :location => game_path(@game)
  end
end