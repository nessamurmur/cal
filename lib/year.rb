class Year

  # CELL = "  "
  MONTH_GUTTER = "  "

  attr_reader :days

  def self.leap_year?(year)
    @year = year
    if @year % 4 == 0
      unless @year % 100 == 0 && @year % 400 != 0
        return true
      end
    end
    false
  end

  def initialize(year)
    unless (1800..3000).include? year
      raise ArgumentError, "cal: year #{year} is not in range 1800..3000"
    end
    @year = year
    build_days_array
  end

  def to_s
    output = header
    output << build_first_quarter
  end

  def build_first_quarter
    @quarter = ""
    @quarter << build_months_title_line("January", "February", "March")
    @quarter << build_weeknames_line
    @quarter << build_first_line
  end

  def build_first_line
    build_first_line_array
    convert_line_to_string
  end

  def build_first_line_array
    range = 0..6
    @line_array = []
    @line_array << @days[0][range]
    @line_array << @days[1][range]
    @line_array << @days[2][range]
  end

  def convert_line_to_string
    temp = []
    @line_array.flatten!(1)
    @line_array.collect do |i|
      temp << i[0]
    end
    @line_array = temp
    @line_array.inspect
  end

  def build_months_title_line(month_1, month_2, month_3)
    gutter = "  "
    title_line = ""
    title_line << month_1.center(20)
    title_line << gutter
    title_line << month_2.center(20)
    title_line << gutter
    title_line << month_3.center(20).rstrip
    title_line << "\n"
  end

  def build_weeknames_line
    gutter = MONTH_GUTTER.dup
    weeknames_line = ""
    weeknames = "Su Mo Tu We Th Fr Sa"
    2.times do
      weeknames_line << weeknames
      weeknames_line << gutter
    end
    weeknames_line << weeknames
    weeknames_line << "\n"
  end

  def build_days_array
    @days = []
    12.times do |i|
      i += 1
      @days << Month.new(i, @year).days
    end
    @days
  end

 private

  def header
    "#{@year}".rjust(33) + "\n\n" # or rstrip(64)
  end

end
