class ZellersCongruence
  def self.calculate(month, year)

    if month == 1 || month == 2
      month += 12
      year -= 1
    end

    answer = (1 + (((month + 1) * 26) / 10).floor + year + (year/4).floor + 6 * (year/100).floor + (year/400).floor) % 7
    answer

  end
end
