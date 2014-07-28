class Year

  def initialize(year)
    @year = year
  end

  def create_year_header
    banner="#{@year}".center(64).rstrip + "\n"
  end

    def format_months_rows
    month_rows = []
    (1..12).each do |month|
        cal=Calendar.new(month, @year)
        month_rows << cal.create_month_header.center(20)
        month_rows << "  "
      end
      month_rows=month_rows.each_slice(6).to_a
  end

  def weekdays_rows
    week = "Su Mo Tu We Th Fr Sa"
    day_row = week + "  " + week + "  " + week + "\n"
    day_row
  end

  def weeks_blocks
    year_months=[]
    (1..12).each do |month|
      cal=Calendar.new(month, @year)
      year_months << cal.format_days_array
    end
    year_months
  end

  def print_year_calendar
    puts create_year_header
    a, b, c = 0, 0, 0
    4.times do
    puts format_months_rows[c].join() + "\n"
    puts weekdays_rows
    c += 1
        6.times do
        puts weeks_blocks[a][b].join(" ") + "  " + weeks_blocks[a+1][b].join(" ") + "  " + weeks_blocks[a+2][b].join(" ") + "\n"
        b += 1
        end
      a+=3
      b = 0
    end
  end
end
