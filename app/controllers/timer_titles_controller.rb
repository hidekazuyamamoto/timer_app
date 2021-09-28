class TimerTitlesController < ApplicationController
  def new
    @timer_title = TimerTitle.new
  end
  def create
    @timer_title = TimerTitle.new(params_timer_title)
    if @timer_title.save
      redirect_to timer_path(current_user.id)
    else
      render :new
    end
  end

  private

  def params_timer_title
    params.require(:timer_title).permit(:timer_title).merge(user_id: current_user.id)
  end
end
