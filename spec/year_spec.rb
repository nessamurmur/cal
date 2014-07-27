require_relative '../lib/year'

RSpec.describe Year do

  context(".leap_year?") do

    it "returns false for 1900" do
      result = Year.leap_year?(1900)
      result.should == false
    end

    it "returns false for 2100" do
      result = Year.leap_year?(2100)
      result.should == false
    end

    it "returns true for 1996" do
      result = Year.leap_year?(1996)
      result.should == true
    end

    it "returns true for 2000" do
      result = Year.leap_year?(2000)
      result.should == true
    end

    it "returns flase for 2010" do
      result = Year.leap_year?(2010)
      result.should == false
    end

    it "returns true for 2012" do
      result = Year.leap_year?(2012)
      result.should == true
    end

    it "returns false for 2200" do
      result = Year.leap_year?(2200)
      result.should == false
    end

    it "returns true for 2400" do
      result = Year.leap_year?(2400)
      result.should == true
    end

  end

  context "#header" do
    it "matches cal for 1901" do
      month = Year.new(1901)
      month.send(:header).should == "                             1901\n\n"
    end
    it "matches cal for 2014" do
      month = Year.new(2014)
      month.send(:header).should == "                             2014\n\n"
    end
    it "matches cal for 3000" do
      month = Year.new(3000)
      month.send(:header).should == "                             3000\n\n"
    end
  end

  context "#build_months_title_line" do
    it "matches the first month title line, January, February, March" do
      year = Year.new(1900)
      output = year.build_months_title_line("January", "February", "March")
      actual = "      January               February               March\n"
      output.should == actual
    end
    it "matches the second month title line, April, May, June" do
      year = Year.new(2000)
      output = year.build_months_title_line("April", "May", "June")
      actual = "       April                  May                   June\n"
      output.should == actual
    end
    it "matches the third month title line, July, August, September" do
      year = Year.new(2342)
      output = year.build_months_title_line("July", "August", "September")
      actual = "        July                 August              September\n"
      output.should == actual
    end
    it "matches the fourth month title line, October, November, December" do
      year = Year.new(1932)
      output = year.build_months_title_line("October", "November", "December")
      actual = "      October               November              December\n"
      output.should == actual
    end
  end

  # context "#build_days_array" do
  #   it "matches the accumulation of new month instances" do
  #     january = Month.new(1, 2000).days
  #     february = Month.new(2, 2000).days
  #     march = Month.new(3, 2000).days
  #     april = Month.new(4, 2000).days
  #     may = Month.new(5, 2000).days
  #     june = Month.new(6, 2000).days
  #     july = Month.new(7, 2000).days
  #     august = Month.new(8, 2000).days
  #     september = Month.new(9, 2000).days
  #     october = Month.new(10, 2000).days
  #     november = Month.new(11, 2000).days
  #     december = Month.new(12, 2000).days
  #
  #     year = Year.new(2000).days
  #
  #     actual = [january, february, march, april, may, june, july, august, september, october, november, december]
  #     year.should == actual
  #   end
  # end

  context "#build_weeknames_line" do
    it "should build a string of weeknames three times" do
      year = Year.new(2014).build_weeknames_line
      actual = "Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa\n"
      year.should == actual
    end
  end

  # context "#build_first_line" do
  #   it "should build an array of the first three month's days" do
  #     year = Year.new(2014).build_first_line
  #     actual = [
  #                [[nil, 0], [nil, 1], [nil, 2], [1, 3], [2, 4], [3, 5], [4, 6]],
  #                [[nil, 0], [nil, 1], [nil, 2], [nil, 3], [nil, 4], [nil, 5], [1, 6]],
  #                [[nil, 0], [nil, 1], [nil, 2], [nil, 3], [nil, 4], [nil, 5], [1, 6]]
  #              ]
  #     year.should == actual
  #   end
  # end

  # context "#build_first_line" do
  #   it "should print the first line of first three months of year" do
  #     year = Year.new(2014).build_first_line
  #     actual = "          1  2  3  4                     1                     1"
  #     year.should == actual
  #   end
  # end

end
