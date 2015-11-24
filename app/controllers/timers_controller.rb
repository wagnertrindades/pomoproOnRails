class TimersController < ApplicationController
    
    def index
        @user = current_user
        @timers = @user.timer.all
        @timer = current_user.timer.new
    end

    def create
        @timer = current_user.timer.new(:status => params[:status], :user_id => params[:user_id])


        if @timer.save
            if @timer.status == "pomo"
                flash[:success] = "Pomodoro Concluido"
            elsif @timer.status == "break"
                flash[:success] = "Break Concluido"
            else
                flash[:success] = "Long Break Concluido"
            end
            
            redirect_to user_timers_path
        else
            flash[:error] = "Problema em concluir timer."
            render user_timers_path
        end

    end

end
