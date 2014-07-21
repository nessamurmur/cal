require_relative '../lib/month'

RSpec.describe Month do

  context ".header" do
    it "matches cal for December 2013" do
      month = Month.new(12, 2013)
      month.header.should == "   December 2013"
    end
    it "matches cal for July 1901" do
      month = Month.new(07, 1901)
      month.header.should == "     July 1901"
    end
  end

  context ".name" do
    it "translates January" do
      Month.new(1, 2012).name.should == "January"
    end
    it "translates February" do
      Month.new(2, 2012).name.should == "February"
    end
    it "translates March" do
      Month.new(3, 2012).name.should == "March"
    end
    it "translates April" do
      Month.new(4, 2012).name.should == "April"
    end
    it "translates May" do
      Month.new(5, 2012).name.should == "May"
    end
    it "translates June" do
      Month.new(6, 2012).name.should == "June"
    end
    it "translates July" do
      Month.new(7, 2012).name.should == "July"
    end
    it "translates August" do
      Month.new(8, 2012).name.should == "August"
    end
    it "translates September" do
      Month.new(9, 2012).name.should == "September"
    end
    it "translates October" do
      Month.new(10, 2012).name.should == "October"
    end
    it "translates November" do
      Month.new(11, 2012).name.should == "November"
    end
    it "translates December" do
      Month.new(12, 2012).name.should == "December"
    end
  end

  context ".length" do
    it "should return the correct length" do
      Month.new(3, 2012).length.should == 31
    end
    it "should return the correct length" do
      Month.new(1, 1900).length.should == 31
    end
    it "should return the correct length" do
      Month.new(2, 1903).length.should == 28
    end
    it "should return the correct length" do
      Month.new(2, 1905).length.should == 28
    end
    it "should return the correct length" do
      Month.new(2, 2004).length.should == 29
    end
    it "should return the correct length" do
      Month.new(2, 2080).length.should == 29
    end
    it "should return the correct length" do
      Month.new(6, 2100).length.should == 30
    end
    it "should return the correct length" do
      Month.new(3, 2902).length.should == 31
    end
    it "should return the correct length" do
      Month.new(6, 2904).length.should == 30
    end
    it "should return the correct length" do
      Month.new(2, 2000).length.should == 29
    end
  end

  context ".build_first_week" do
    it "should return a first week starting on Saturday" do
      
    end
    it "should return a first week starting on Sunday" do

    end
    it "should return a first week starting on Monday" do

    end
    it "should return a first week starting on Tuesday" do

    end
    it "should return a first week starting on Wednesday" do

    end
    it "should return a first week starting on Thursday" do

    end
    it "should return a first week starting on Friday" do

    end
  end

end
