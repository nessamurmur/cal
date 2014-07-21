require_relative './zellers_congruence'
require_relative './year'

class Month

  MONTHS = [nil, "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

  def initialize(month, year)
    @month = month
    @year = year
  end

  def header
    "#{name} #{@year}".center(20).rstrip # automatically searches for method in class named name
  end

  def name
    MONTHS[@month]
  end

  def length
    length = 30 + (@month + (@month/8).floor) % 2
    if @month == 2
      if Year.leap_year?(@year)
        length -= 1
      else
        length -= 2
      end
    end
    length
  end

  def build_month
    starting_day_index = ZellersCongruence.calculate(@month, @year)

    starting_day_index -= 1
    if starting_day_index == -1
      starting_day_index = 6
    end

    days_index_list = (0..(starting_day_index + self.length - 1)).to_a
    "days_index_list is..." + days_index_list.inspect

    days_list = (1..self.length).to_a
    days_index_list_count = days_index_list.count
    days_list_count = days_list.count
    if days_index_list_count > days_list_count
      diff = days_index_list_count - days_list_count
      diff.times do
        days_list.unshift(nil)
      end
    end
    "days_list is..." + days_list.inspect

    days = days_list.zip(days_index_list)
    "days is.." + days.inspect


  end

  def to_s
    output = header
    output << "\nSu Mo Tu We Th Fr Sa\n"
    output << build_month
  end

end


#     output << <<EOS
#                    1
#  2  3  4  5  6  7  8
#  9 10 11 12 13 14 15
# 16 17 18 19 20 21 22
# 23 24 25 26 27 28 29
# 30 31
# EOS

# DAYS = ["Saturday", "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
# MONTH_LINE = [ [cell], [gutter], [cell], [gutter], [cell], [gutter], [cell], [gutter], [cell], [gutter], [cell], [gutter], [cell] ]
# MONTH_LINE = cell[0] + gutter[0] + cell[1] + gutter[1] + cell[2] + gutter[2] + cell[3] + gutter[3] + cell[4] + gutter[4] + cell[5]
# MONTH_LINE = [cell + gutter + cell + gutter + cell + gutter + cell + gutter + cell + gutter + cell + gutter + cell]


# arrayed_index = [starting_day_index]
# copied_array_index = arrayed_index.dup
#
# if copied_array_index[0] == 0
#   arrayed_index[0] = 6
# elsif copied_array_index[0] == (1..5)
#   arrayed_index[0] -= 1
# end
#
# copied_index = arrayed_index[0].to_i


# if starting_day_index == 0
#   starting_day_index = 6
# elsif starting_day_index == (1..5)
#   starting_day_index -= 1
# end

# CELL = "  "
# CELL_LENGTH = 3
# GUTTER = " "
# MONTH_LINE = [CELL, GUTTER, CELL, GUTTER, CELL, GUTTER, CELL, GUTTER, CELL, GUTTER, CELL, GUTTER, CELL]

# def copy_month_line
#   month_line = MONTH_LINE.dup
  # "month_line is..." + month_line.inspect
# end


# 1.upto(self.length) do
#   month_line << month_line[starting_day_index += 1]
# end

# month_line[starting_day_index] = 1

# "month_line is..." + month_line.inspect


# month_line << first_line_entries.each { |x| month_line[x] }
# "month_line is..." + month_line.inspect

# empty_line_list = self.copy_month_line
#
# cell_list = empty_line_list.collect { |x| x % 2 == 1 }

# merged_cells = cell_list.zip(first_line_entries)

# cell_list[index] =

# line = merged_cells
# line << copied
# Month.create_line
# starting_day = days[starting_day_index]
# p "this is..." + line.to_s # starting_day_index.to_s # @month_line[starting_day_index]


# month_days = (starting_day_index..self.length).collect { |x| x }
# "month_days is..." + month_days.inspect


# merged = days_list.collect { |num, i| num[i] }
# merged = days_list.flatten

# "merged is..." + merged.inspect

# first_line_entries = (starting_day_index..6).collect { |x| x }
# "first_line_entries is..." + first_line_entries.inspect

# month_line = []


# days.unshift nil_prep


# days_index_list = (starting_day_index..(starting_day_index + self.length - 1)).to_a
# if starting_day_index > 0
#   nil_prep = (0...starting_day_index).collect {|x| x = nil}
#   days_index_list = days_index_list.unshift nil_prep
#   days_index_list.flatten!
# end

# if starting_day_index > 0
#   nil_prep = (0...starting_day_index).collect {|x| x = nil}
#   days_index_list = days_index_list.unshift nil_prep
#   days_index_list.flatten!
# end
# days_index_list_count = days_index_list.count
