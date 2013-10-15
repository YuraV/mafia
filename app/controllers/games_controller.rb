class GamesController < ApplicationController

  helper_method :sort_column, :sort_direction

  before_filter :game_find, except: [:create, :new, :index, :best_player]
  before_filter :user_scoped, except: [:index]
  before_filter :appointment_scoped, only: [:best_player, :show]

  respond_to :html

  def index
    @games = Game.order(sort_column + ' ' + sort_direction).paginate(page: params[:page], per_page: 10).search(params[:search])
    respond_with do |format|
      format.html {
          render :partial => 'games/games_table' if request.xhr?
      }
    end
  end

  def show
    @used_ids = (@game.appointments.pluck(:user_id)) + [@game.manager.user_id]

  end

  def new
    @game = Game.new
    render "games/new", layout: false
  end

  def create
    @game = Game.create(params[:game])
    respond_with @game
  end

  def edit

  end

  def best_player
    @game = Game.find(params[:game_id])
    @best_player = @game.appointments.pluck(:user_id)
    render 'games/best_player', layout: false
  end

  def update

    @game.update_attributes(params[:game])
    @game.appointments.each do |a|
      a.set_score!
      a.won!
    end
    respond_with @game
  end

  def destroy
    @game.destroy
    redirect_to games_path
  end

  private

  def game_find
    @game = Game.find(params[:id])
  end

  def user_scoped
    @users = User.scoped
  end

  def appointment_scoped
    @appointments = Appointment.scoped
  end

  def sort_column
    Game.column_names.include?(params[:sort_column]) ? params[:sort_column] : 'created_at'
  end

  def sort_direction

    %w[asc desc].include?(params[:sort_direction]) ? params[:sort_direction]: 'asc'
  end


end
