module Chronik
  class << self
    private

    def easter(year)
      c = year/100
      n = year-19*(year/19)
      k = (c-17)/25 
      i = c-c/4-(c-k)/3+19*n+15
      i = i-30*(i/30) 
      i = i-(i/28)*(1-(i/28)*(29/(i+1))*((21-n)/11)) 
      j = year+year/4+i+2-c+c/4 
      j = j-7*(j/7) 
      l = i-j 
      month = 3+(l+40)/44 
      day = l+28-31*(month/4) 

      Date.new year, month, day
    end

    def easter_dates(holidays=[0])
      lambda do |range|
        (range.first.year..range.last.year).map do |year|
          holidays.map{|offset| easter(year) + offset}
        end.flatten.grep(range)
      end
    end

    def fixed_dates(month, day)
      lambda do |range|
        (range.first.year..range.last.year).map do |year|
          Date.new(year, month, day)
        end.grep(range)
      end
    end
  end

  HOLIDAYS = {
    [:wielkanoc, :wielkanocy] => easter_dates(0..1),
    [:sylwester, :sylwestra] => fixed_dates(31,12)
  }

  WEEKDAYS = {
    [:powszedni, :powszednie] => (1..5).to_a,
    [:weekend, :weekendy] => [0,6],
    [:sobota, :soboty] => [6],
    [:niedziela, :niedziele] => [0]
  }

end
