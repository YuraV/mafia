class ScoresController < ApplicationController
  def index
    @users_count = Appointment.where(user_id: '1').count()
  end

  def show
    #@users = User.scoped
    @user = User.find(params[:id])
    @score = Appointment.where(user_id: @user.id).count()
  end


end
