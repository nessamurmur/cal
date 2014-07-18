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

end
