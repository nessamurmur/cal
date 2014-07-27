class Year

  CELL = "  "
  CELL_GUTTER = " "
  MONTH_GUTTER = "  "
  MONTHS = [nil, "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
  MONTH_CELL_COUNT = 41

  attr_reader :days
  attr_accessor :month_count

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
    @month_count = 0
    output = header
    output << build_quarter("January", "February", "March")
    # output << build_quarter("April", "May", "June")
    # output << build_quarter("July", "August", "September")
    # output << build_quarter("October", "November", "December")
  end

  def build_quarter(month_1, month_2, month_3)
    @quarter = ""
    @quarter << build_months_title_line(month_1, month_2, month_3)
    @quarter << build_weeknames_line
    build_line(0..6)
    build_line(7..13)
    build_line(14..20)
    build_line(21..27)
    build_line(28..34)
    build_line(35..41)
  end

  def build_line(range)
    push_nil_to_end_of_months
    build_line_array(range)
    strip_month_day_indexes(range)
    convert_line_to_string
    @quarter << @line
  end

  def push_nil_to_end_of_months
    self.days.collect!.with_index do |i, index|
      @days[index].fill([nil, nil], (@days[index].length)..MONTH_CELL_COUNT)
    end
  end

  def build_line_array(range)
    # puts @month_count.inspect
    @line_array = []
    @line_array << @days[@month_count][range]
    @line_array << @days[@month_count + 1][range]
    # puts @month_count.inspect
    @line_array << @days[@month_count + 2][range]
  end

  def strip_month_day_indexes(range)
    temp = []
    @line_array.flatten!(1)
    @line_array.collect do |i|
      temp << i[0]
    end
    if range.to_s != "0..6"
      x = temp.rindex { |v| v.class == Fixnum }
      temp.collect!.with_index do |i, index|
        if index > x && i.nil?
          i = ""
        else
          i
        end
      end
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
      if (index == 0 || index == 1 || index == 2 || index == 3 || index == 4 || index == 5 || index == 7 || index == 8 || index == 9 || index == 10 || index == 11 || index == 12 || index == 14 || index == 15 || index == 16 || index == 17 || index == 18 || index == 19)
        unless i == ""
          @line << CELL_GUTTER.dup
        end
      elsif index == 6 || index == 13
        unless i == ""
          @line << MONTH_GUTTER.dup
        end
      elsif index == 20
        @line.rstrip!
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

# @days[0].fill([nil, nil], (@days[0].length)..MONTH_CELL_COUNT)
# @days[1].fill([nil, nil], (@days[1].length)..MONTH_CELL_COUNT)
# @days[2].fill([nil, nil], (@days[2].length)..MONTH_CELL_COUNT)
# @days[3].fill([nil, nil], (@days[3].length)..MONTH_CELL_COUNT)
# @days[4].fill([nil, nil], (@days[4].length)..MONTH_CELL_COUNT)
# @days[5].fill([nil, nil], (@days[5].length)..MONTH_CELL_COUNT)
# @days[6].fill([nil, nil], (@days[6].length)..MONTH_CELL_COUNT)
# @days[7].fill([nil, nil], (@days[7].length)..MONTH_CELL_COUNT)
# @days[8].fill([nil, nil], (@days[8].length)..MONTH_CELL_COUNT)
# @days[9].fill([nil, nil], (@days[9].length)..MONTH_CELL_COUNT)
# @days[10].fill([nil, nil], (@days[10].length)..MONTH_CELL_COUNT)
# @days[11].fill([nil, nil], (@days[11].length)..MONTH_CELL_COUNT)
