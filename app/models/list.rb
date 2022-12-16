class List < ApplicationRecord
  belongs_to :anniversary

  # def next_day
  #   anniversary = Anniversary.find[:id]
  #   next_day = anniversary.anniversary_date.next_day(0)
  #   puts next_day
  # end
end
