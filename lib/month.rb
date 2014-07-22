require_relative './zellers_congruence'
require_relative './year'

class Month

  MONTHS = [nil, "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

  def initialize(month, year)
    @month = month
    @year = year
  end

  def to_s
    output = header
    output << "\nSu Mo Tu We Th Fr Sa\n"
    output << self.build_month
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

    days_list = (1..self.length).to_a
    days_index_list_count = days_index_list.count
    days_list_count = days_list.count
    if days_index_list_count > days_list_count
      diff = days_index_list_count - days_list_count
      diff.times do
        days_list.unshift(nil)
      end
    end

    days = days_list.zip(days_index_list)

    month_string = ""
    @carriage_count = 0

    days.collect do |num, i|
      cell = ""

      if num == nil
        cell << "  "
      elsif num.class == Fixnum
        cell << "#{num}".rjust(2)
      end

      if (i + 1) % 7 != 0
        unless i == (days_index_list_count - 1)
          cell << " "
        end
      elsif (i + 1) % 7 == 0
        cell << "\n"
        @carriage_count += 1
      end

      month_string << cell

    end

    if @carriage_count < 6
      until @carriage_count == 6
        month_string << "\n"
        @carriage_count += 1
      end
    end

    month_string

  end

end
