require_relative 'year.rb'

class Calendar
  Months = [nil, "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

  attr_reader :month, :year

  def initialize (month, year)
    @month = month.to_i
    @year = year.to_i

    unless (1..12).include?(@month)
      raise ArgumentError, "Enter a month number between 1-12"
    end
    unless (1800..3000).include?(@year)
      raise ArgumentError, "Enter a year number between 1800 - 3000"
    end
  end

  def create_month_header
    header = "#{Months[month.to_i]}"
  end

  def month_year_header
    banner = (create_month_header + " #{year}").center(20).rstrip
  end

  def leap_year?
    if year % 400 == 0
      true
    elsif year % 100 == 0
      false
    elsif year % 4 == 0
      true
    else
      false
    end
  end

  def month_days
    case month
    when 4, 6, 9, 11
      30
    when 1, 3, 5, 7, 8, 10, 12
      31
    when leap_year? && 2
      29
    else
      28
    end
  end

  def first_day_spot
    m = month
    y = year
    m = (m += 6) % 12
    y = y + (m / 12)
      (1 + (((m + 1) * 26) / 10) + y + (y/4).floor + 6 * (y/100).floor + (y/400).floor) % 7
  end

  def format_days_array
    all_days=(1..month_days).to_a
    first_day_spot.times do
      all_days.unshift( "  " )
    end
    (42-(first_day_spot + month_days)).times do
    all_days << " "
    end
    all_days = all_days.each_slice(7).to_a
    all_days.each do |week_array|
        week_array.collect! { |date| date.to_s.rjust(2) }
        week_array.join(" ")
    end
  end

  def print_month_calendar
    puts month_year_header
    puts "Su Mo Tu We Th Fr Sa"
    a=0
    6.times do
    puts format_days_array[a].join(" ")
    a+=1
    end
  end
end
