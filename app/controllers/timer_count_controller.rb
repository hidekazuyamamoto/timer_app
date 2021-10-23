class TimerCountController < ApplicationController
  def new
    @timer_title = TimerTitle.find(params[:timer_title_id])
    @timer_count = TimeCount.new
    @history = TimeCount.where(timer_title_id: params[:timer_title_id])
    time_calc(@history)
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
  def time_calc(history)
    @history_time = []
    history.each do |history|
      hour = (history.time/(60*60)).floor.to_s
      history.time %= 60*60
      min = ("0" + (history.time/(60)).floor.to_s).slice(-2,2)
      history.time %= 60
      sec = ("0" + history.time.floor.to_s).slice(-2,2)
      timer = hour +":"+min+":"+sec
      @history_time.push(timer)
    end
  end
end
