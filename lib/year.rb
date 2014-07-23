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
    self.build_january_february_march_title_line
    self.build_weeknames_line
    # self.build_january_february_march_days_array
    # self.build_weeknames_line
    # self.build_year_array
  end

  def build_january_february_march_days_array

  end

  def build_january_february_march_title_line
    gutter = MONTH_GUTTER.dup
    title_line = ""
    title_line << "January".center(20)
    title_line << gutter
    title_line << "February".center(20)
    title_line << gutter
    title_line << "March".center(20).rstrip
    title_line << "\n"
  end

  def build_april_may_june_title_line
    gutter = MONTH_GUTTER.dup
    title_line = ""
    title_line << "April".center(20)
    title_line << gutter
    title_line << "May".center(20)
    title_line << gutter
    title_line << "June".center(20).rstrip
    title_line << "\n"
  end

  def build_july_august_september_line
    gutter = MONTH_GUTTER.dup
    title_line = ""
    title_line << "July".center(20)
    title_line << gutter
    title_line << "August".center(20)
    title_line << gutter
    title_line << "September".center(20).rstrip
    title_line << "\n"
  end

  def build_october_november_december_line
    gutter = MONTH_GUTTER.dup
    title_line = ""
    title_line << "October".center(20)
    title_line << gutter
    title_line << "November".center(20)
    title_line << gutter
    title_line << "December".center(20).rstrip
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
