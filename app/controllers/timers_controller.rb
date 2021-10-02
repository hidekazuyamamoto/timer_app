class TimersController < ApplicationController
  def index
  end
  def show
    @timer_title = TimerTitle.where(user_id: current_user.id)
    time_calc(@timer_title)
  end
  private

  def time_calc(timer_title)
    @time_count = []
    timer_title.each do |timer_title|
      if time_count_id =TimeCount.where(timer_title_id: timer_title.id).exists?
        time_count_id =TimeCount.where(timer_title_id: timer_title.id) 
        time_count = time_count_id.sum(:time)
        hour = (time_count/(60*60)).floor.to_s
        time_count %= 60*60
        min = ("0" + (time_count/(60)).floor.to_s).slice(-2,2)
        time_count %= 60
        sec = ("0" + time_count.floor.to_s).slice(-2,2)
        timer = hour +":"+min+":"+sec
        @time_count.push(timer)
      else
        @time_count.push("0:00:00")
      end
    end
  end
end
