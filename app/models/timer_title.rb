class TimerTitle < ApplicationRecord
  belongs_to :user
  has_many :time_counts
end
