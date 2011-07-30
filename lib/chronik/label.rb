require 'unicode'

module Chronik
  # The class of days.
  class Label
    def initialize(text)
      @tokens = text.split.map{|word| Unicode.downcase(word).to_sym} - SUGAR
    end
    
    # Special days which are represented by this label. Those are probably one
    # in a year holidays like Christmas.
    #
    # range - [Range]:
    #
    # Returns an Array of Dates.
    def holidays(range=(Date.today..Date.today.next_month))
      output = []
      @tokens.each do |token|
        if ALL_HOLIDAYS.include?(token)
          return HOLIDAYS.values.map do |dates|
            dates.call(range)
          end.flatten.uniq
        end
        HOLIDAYS.each_pair do |labels,dates|
          if labels.include?(token)
            output.concat(dates.call(range))
          end
        end
      end
      output
    end

    # Day(s) of a week (Sunday is 0). Also range of days, like weekend.
    #
    # Returns an Array of Integers.
    def weekdays
      @tokens.each do |token|
        WEEKDAYS.each_pair do |labels,wdays|
          return wdays if labels.include?(token)
        end
      end
      []
    end
  end
end
