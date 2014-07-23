require_relative '../lib/month'

RSpec.describe Month do

  context "#header" do
    it "matches cal for December 2013" do
      month = Month.new(12, 2013)
      month.header.should == "   December 2013"
    end
    it "matches cal for July 1901" do
      month = Month.new(07, 1901)
      month.header.should == "     July 1901"
    end
  end

  context "#name" do
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

  context "#length" do
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

  context "#index_days_in_month" do
    it "should create an array of the month grid's indexes" do
      month = Month.new(1, 1900)
      actual = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31]
      month.send(:index_days_in_month).should == actual
    end
    it "should create an array of the month grid's indexes" do
      month = Month.new(1, 1901)
      actual = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32]
      month.send(:index_days_in_month).should == actual
    end
    it "should create an array of the month grid's indexes" do
      month = Month.new(2, 2014)
      actual = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33]
      month.send(:index_days_in_month).should == actual
    end
    it "should create an array of the month grid's indexes" do
      month = Month.new(2, 2999)
      actual = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32]
      month.send(:index_days_in_month).should == actual
    end
  end

  context "#list_days_in_month" do
    it "should create an array of the month's days" do
      month = Month.new(2, 1988)
      month.send(:list_days_in_month).should == (1..29).to_a
    end
    it "should create an array of the month's days" do
      month = Month.new(2, 2100)
      month.send(:list_days_in_month).should == (1..28).to_a
    end
  end

  context "#build_days_array" do
    it "should create a 2D array of the month's days" do
      month = Month.new(2, 1900)
      actual = [[nil, 0], [nil, 1], [nil, 2], [nil, 3], [1, 4], [2, 5], [3, 6], [4, 7], [5, 8], [6, 9], [7, 10], [8, 11], [9, 12], [10, 13], [11, 14], [12, 15], [13, 16], [14, 17], [15, 18], [16, 19], [17, 20], [18, 21], [19, 22], [20, 23], [21, 24], [22, 25], [23, 26], [24, 27], [25, 28], [26, 29], [27, 30], [28, 31]]
      month.build_days_array.should == actual
    end
    it "should create a 2D array of the month's days" do
      month = Month.new(2, 2100)
      actual = [[nil, 0], [1, 1], [2, 2], [3, 3], [4, 4], [5, 5], [6, 6], [7, 7], [8, 8], [9, 9], [10, 10], [11, 11], [12, 12], [13, 13], [14, 14], [15, 15], [16, 16], [17, 17], [18, 18], [19, 19], [20, 20], [21, 21], [22, 22], [23, 23], [24, 24], [25, 25], [26, 26], [27, 27], [28, 28]]
      month.build_days_array.should == actual
    end
    it "should create a 2D array of the month's days" do
      month = Month.new(1, 2400)
      actual = [[nil, 0], [nil, 1], [nil, 2], [nil, 3], [nil, 4], [nil, 5], [1, 6], [2, 7], [3, 8], [4, 9], [5, 10], [6, 11], [7, 12], [8, 13], [9, 14], [10, 15], [11, 16], [12, 17], [13, 18], [14, 19], [15, 20], [16, 21], [17, 22], [18, 23], [19, 24], [20, 25], [21, 26], [22, 27], [23, 28], [24, 29], [25, 30], [26, 31], [27, 32], [28, 33], [29, 34], [30, 35], [31, 36]]
      month.build_days_array.should == actual
    end
    it "should create a 2D array of the month's days" do
      month = Month.new(2, 3000)
      actual = [[nil, 0], [nil, 1], [nil, 2], [nil, 3], [nil, 4], [nil, 5], [1, 6], [2, 7], [3, 8], [4, 9], [5, 10], [6, 11], [7, 12], [8, 13], [9, 14], [10, 15], [11, 16], [12, 17], [13, 18], [14, 19], [15, 20], [16, 21], [17, 22], [18, 23], [19, 24], [20, 25], [21, 26], [22, 27], [23, 28], [24, 29], [25, 30], [26, 31], [27, 32], [28, 33]]
      month.build_days_array.should == actual
    end
    it "should create a 2D array of the month's days" do
      month = Month.new(7, 2014)
      actual = [[nil, 0], [nil, 1], [1, 2], [2, 3], [3, 4], [4, 5], [5, 6], [6, 7], [7, 8], [8, 9], [9, 10], [10, 11], [11, 12], [12, 13], [13, 14], [14, 15], [15, 16], [16, 17], [17, 18], [18, 19], [19, 20], [20, 21], [21, 22], [22, 23], [23, 24], [24, 25], [25, 26], [26, 27], [27, 28], [28, 29], [29, 30], [30, 31], [31, 32]]
      month.build_days_array.should == actual
    end
  end

end
