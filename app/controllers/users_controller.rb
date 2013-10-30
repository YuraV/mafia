class UsersController < ApplicationController
  load_and_authorize_resource
  helper_method :sort_column, :sort_direction
  before_filter :user_scoped
  respond_to :html


  def index
    @users = User.order(sort_column + ' ' + sort_direction).paginate(page: params[:page], per_page: 3).search(params[:search])
    respond_with do |format|
      format.html {
        render :partial => 'users/table' if request.xhr?
      }
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
  end


  private


  def user_scoped
    @users = User.scoped
  end

  def sort_column
    User.column_names.include?(params[:sort_column]) ? params[:sort_column] : 'created_at'
  end

  def sort_direction

    %w[asc desc].include?(params[:sort_direction]) ? params[:sort_direction] : 'asc'
  end
end
