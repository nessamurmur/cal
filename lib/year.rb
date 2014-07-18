class Year

  def self.leap_year?(year)
    @year = year
    if @year % 4 == 0
      unless @year % 100 == 0 && @year % 400 != 0
        return true
      end
    end
    false
  end

end
