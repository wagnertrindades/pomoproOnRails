class TimersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @timers = @user.timer.where(created_at: (Time.now.at_beginning_of_day)..Time.now.at_end_of_day)
    #@timers = @user.timer.all
    @timer = current_user.timer.new
  end

  def create
    @timer = current_user.timer.new(:status => params[:status], :user_id => params[:user_id])

    if @timer.save
      respond_to do |format|
        format.html { redirect_to user_timers_path }
        format.js # render timers/create.js.erb
      end
    else
      flash[:error] = "Problema em concluir timer."
      redirect_to user_timers_path
    end
  end

end
