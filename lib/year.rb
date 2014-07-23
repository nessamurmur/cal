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
    @year = year
    self.build_days_array
  end

  def to_s
    output = header
    output << self.build_year
  end

  def build_year
    # self.build_days_array
    self.build_months_title_line("January", "February", "March")
    self.build_weeknames_line
    # self.build_january_february_march_days_array
    # self.build_weeknames_line
    # self.build_year_array
  end

  def build_months_title_line(month_1, month_2, month_3)
    gutter = MONTH_GUTTER.dup
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
    weeknames_line << weeknames
    weeknames_line << gutter
    weeknames_line << weeknames
    weeknames_line << gutter
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
