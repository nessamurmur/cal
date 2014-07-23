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

  # context "#build_january_february_march_title_line" do
  #   it "matches January February March with spaces" do
  #     year = Year.new(1900)
  #     actual = "      January               February               March\n"
  #     year.send(:build_january_february_march_title_line).should == actual
  #   end
  # end


  context "#build_days_array" do
    it "matches the accumulation of new month instances" do
      january = Month.new(1, 2000).days
      february = Month.new(2, 2000).days
      march = Month.new(3, 2000).days
      april = Month.new(4, 2000).days
      may = Month.new(5, 2000).days
      june = Month.new(6, 2000).days
      july = Month.new(7, 2000).days
      august = Month.new(8, 2000).days
      september = Month.new(9, 2000).days
      october = Month.new(10, 2000).days
      november = Month.new(11, 2000).days
      december = Month.new(12, 2000).days

      year = Year.new(2000).days

      actual = [january, february, march, april, may, june, july, august, september, october, november, december]
      year.should == actual
    end
  end

end
