require 'date'

class Range
end

class Date
  def daily(other)
    (self..other).map { |d| Date.new(d.year, d.month, d.day) }.uniq
  end
end
