class UsersController < ApplicationController
  load_and_authorize_resource
  helper_method :sort_column, :sort_direction
  before_filter :user_scoped
  respond_to :html


  def index
    @users = User.order(sort_column + ' ' + sort_direction).paginate(page: params[:page], per_page: 10).search(params[:search])
    respond_with do |format|
      format.html {
        render :partial => 'users/table' if request.xhr?
      }
    end
  end

  def show

  end

  def edit

  end

  def update
    @user.update_attributes(params[:user])
    redirect_to users_path
  end

  def new

  end

  def create
    @user = User.create(params[:user])
    binding.pry
    redirect_to users_path
  end

  def destroy
    @user.destroy
    redirect_to users_path
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
