class TimersController < ApplicationController
    
    def index
        @user = current_user
        @timers = @user.timer.all
        @timer = current_user.timer.new

        @pomos, @breaks, @long_breaks = [], [], []
        @timers.each do |timer|
            @pomos << timer if timer.status == "pomo"
            @breaks << timer if timer.status == "break"
            @long_breaks << timer if timer.status == "long_break"
        end
    end

    def create
        @timer = current_user.timer.new(:status => params[:status], :user_id => params[:user_id])

        if @timer.save
            flash[:success] = "Pomodoro Concluido"
            redirect_to user_timers_path
        else
            flash[:error] = "Problema em concluir Pomodoro."
            render user_timers_path
        end
    end

end
