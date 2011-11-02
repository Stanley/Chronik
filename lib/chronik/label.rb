if RUBY_PLATFORM =~ /java/
  class String
    require 'java'
    def downcase
      to_java_string.to_lower_case
    end
  end
end

module Chronik
  # The class of days.
  class Label
    def initialize(text)
      if text =~ /\s-\s/
        @range = text.split(' - ').map{|word| word.downcase.to_sym}
        @tokens = []
      else
        @tokens = text.split(/[\s,]+/).map{|word| word.downcase.to_sym} - SUGAR
      end
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
      if @range
        first = WEEKDAYS.find {|key,val| key.include? @range.first }.last.first
        last = WEEKDAYS.find {|key,val| key.include? @range.last }.last.last
        return (first..last).to_a
      else
        output = []
        @tokens.each do |token|
          WEEKDAYS.each_pair do |labels,wdays|
            output.concat(wdays) and break if labels.include?(token)
          end
        end
        output
      end
    end
  end
end
