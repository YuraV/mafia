class ScoresController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    @score = Appointment.where(user_id: @user.id).count()
    
  end


end
