class Year

  CELL = "  "
  CELL_GUTTER = " "
  MONTH_GUTTER = "  "
  MONTHS = [nil, "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

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
    # build_first_line
    build_line(0..6)
    build_line(7..13)
    build_line(14..20)
    build_line(21..27)
    build_line(28..34)
    build_line(35..41)
    # build_line
    # @quarter << @line
  end

  def build_line(range)
    push_nil_to_end_of_months
    build_line_array(range)
    strip_month_day_indexes
    convert_line_to_string
    @quarter << @line
  end

  def push_nil_to_end_of_months
    @days[0].fill([nil, nil], (@days[0].length)..41)
    @days[1].fill([nil, nil], (@days[1].length)..41)
    @days[2].fill([nil, nil], (@days[2].length)..41)
  end

  def build_line_array(range)
    # range = 0..6
    @line_array = []
    @line_array << @days[0][range]
    @line_array << @days[1][range]
    @line_array << @days[2][range]
  end

  def strip_month_day_indexes
    temp = []
    @line_array.flatten!(1)
    @line_array.collect do |i|
      temp << i[0]
    end
    @line_array = temp
  end

  def convert_line_to_string
    @line = ""
    @line_array.each_with_index do |i, index|
      if i.nil?
        @line << CELL.dup
      elsif i.class == Fixnum
        @line << "#{i}".rjust(2)
      end
      if index == 0 || index == 1 || index == 2 || index == 3 || index == 4 || index == 5 || index == 7 || index == 8 || index == 9 || index == 10 || index == 11 || index == 12 || index == 14 || index == 15 || index == 16 || index == 17 || index == 18 || index == 19
        @line << CELL_GUTTER.dup
      elsif index == 6 || index == 13
        @line << MONTH_GUTTER.dup
      elsif index == 20
        @line << "\n"
      end
    end
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
