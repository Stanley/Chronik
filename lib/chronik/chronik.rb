#!/usr/bin/env ruby
# encoding: utf-8

module Chronik
  class << self

    private

    # The Easter Sunday in the given year
    #
    # year - [integer]
    #
    # Returns Date
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

    # Defines dates relative to Easter.
    #
    # holidays - [Integer] or [Range]: offset in regard to Easter.
    #
    # Returns Proc.
    def easter_dates(holidays=0)
      holidays = [holidays] unless holidays.respond_to?(:map)
      dates(lambda{|year| holidays.map{|offset| easter(year) + offset} })
    end

    # Defines one day of a year without specifying the year itself.
    #
    # month - [Integer]
    # day   - [Integer]
    #
    # Returns Proc.
    def fixed_dates(month, day)
      dates(lambda{|year| Date.new(year, month, day) })
    end

    # Defines an infinite number of days, which can be retrieved by calling
    # a block, returned by this method, with time range as an argument.
    #
    # days - [Proc]: calling it with a year should return a Date instance.
    #
    # Returns Proc.
    def dates(days)
      lambda do |range|
        (range.first.year..range.last.year).map do |year|
          days.call(year)
        end.flatten.grep(range)
      end
    end
  end

  SUGAR = [:dni, :i, :w]

  ALL_HOLIDAYS = [:'święta', :wolne]

  HOLIDAYS = {
    [:wielkanoc, :wielkanocy] => easter_dates(0..1),
    [:wielkanocny] => easter_dates(1),
    [:sylwester, :sylwestra] => fixed_dates(12,31)
  }

  WEEKDAYS = {
    [:*, :'tydzień'] => (0..6).to_a,
    [:powszedni, :powszednie, :robocze] => (1..5).to_a,
    [:weekend, :weekendy] => [0,6],
    [:sobota, :soboty] => [6],
    [:niedziela, :niedziele] => [0],
    [:'pon.'] => [1],
    [:'czw.'] => [4],
    [:'piątek', :'piątki', :'pt./sob.'] => [5],
    [:sobota, :soboty, :'sob./św.'] => [6]
  }

end
