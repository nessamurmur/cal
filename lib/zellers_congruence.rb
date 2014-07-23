class ZellersCongruence

  def self.calculate(month, year)
    if month == 1 || month == 2
      month += 12
      year -= 1
    end
    first_day_index = (1 + ((13 * (month + 1)) / 5).floor + (year % 100) + ((year % 100)/4).floor + ((year/100)/4).floor - (2 * (year/100))) % 7
    first_day_index
  end

end
