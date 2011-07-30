require 'unicode'

module Chronik
  #
  class Label
    def initialize(text)
      @tokens = text.split.map{|word| Unicode.downcase(word).to_sym} - SUGAR
    end
    
    # Returns
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

    # Returns
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
