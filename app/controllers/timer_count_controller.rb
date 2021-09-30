class TimerCountController < ApplicationController
  def new
    @timer_title = TimerTitle.find(params[:timer_title_id])
    @timer_count = TimeCount.new
  end
  def create
    @timer_title = TimerTitle.find(params[:timer_title_id])
    @timer_count = TimeCount.create(params_timer_count)
    redirect_to timer_path(current_user.id)
  end

  private
  def params_timer_count
    params.permit(:time).merge(timer_title_id: @timer_title.id)
  end
end
