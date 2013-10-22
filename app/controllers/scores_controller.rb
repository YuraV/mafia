class ScoresController < ApplicationController
  helper_method :sort_column, :sort_direction

  respond_to :html

  def index
    @users = User.order(sort_column + ' ' + sort_direction).paginate(page: params[:page], per_page: 5).search(params[:search])

    respond_with do |format|
      format.html {
        render :partial => 'scores/scores_table' if request.xhr?
      }
    end


  end

  def show
    @user = User.find(params[:id])
    @score = Appointment.where(user_id: @user.id).count()
  end

  private

  def sort_column
    User.column_names.include?(params[:sort_column]) ? params[:sort_column] : 'created_at'
  end

  def sort_direction
    %w[asc desc].include?(params[:sort_direction]) ? params[:sort_direction] : 'asc'
  end

  def pagination_items
    binding.pry
    %w[10 20].include? params[:per_page] ? params[:per_page] : 5
  end

end
