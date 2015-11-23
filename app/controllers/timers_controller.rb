class TimersController < ApplicationController
    
    def index
        @user = current_user
        @timers = @user.timer.all
        @timer = current_user.timer.new
    end

    def create
        @timer = current_user.timer.new(:status => params[:status], :user_id => params[:user_id])

        if @timer.save
            flash[:success] = "Pomodoro Concluido"
            redirect_to root_path
        else
            flash[:error] = "Problema em concluir Pomodoro."
            render :index
        end
    end

end
