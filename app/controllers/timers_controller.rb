class TimersController < ApplicationController
  def index
  end
  def show
    @timer_title = TimerTitle.where(user_id: current_user.id)
  end
end
