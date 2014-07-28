require_relative 'calendar'

if ARGV[1].nil?
  year = ARGV[0].to_i
  calendar = Year.new(year)
  calendar.print_year_calendar
else
  month = ARGV[0].to_i
  year = ARGV[1].to_i
  calendar = Calendar.new(month, year)
  calendar.print_month_calendar
end
