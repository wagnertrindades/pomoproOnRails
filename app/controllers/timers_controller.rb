class TimersController < ApplicationController
    
    def index
        @user = current_user
        #@timers = @user.timer.where(created_at: (Time.now.at_beginning_of_day)..Time.now.at_end_of_day)
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
            
            respond_to do |format|
                format.html { redirect_to user_timers_path }
                format.js # render timers/create.js.erb
            end
        else
            flash[:error] = "Problema em concluir timer."
            render user_timers_path
        end

    end

end
