RSpec.describe "Cal's full month integration" do
  it "should correctly print July 2017" do
    expected = <<EOS
     July 2017
Su Mo Tu We Th Fr Sa
                   1
 2  3  4  5  6  7  8
 9 10 11 12 13 14 15
16 17 18 19 20 21 22
23 24 25 26 27 28 29
30 31
EOS
    actual = `./cal 7 2017`
    actual.should == expected
  end

  it "should correctly print February 2014" do
    expected = <<EOS
   February 2014
Su Mo Tu We Th Fr Sa
                   1
 2  3  4  5  6  7  8
 9 10 11 12 13 14 15
16 17 18 19 20 21 22
23 24 25 26 27 28

EOS
  actual = `./cal 2 2014`
  actual.should == expected
  end

  it "should correctly print February 2015" do
    expected = <<EOS
   February 2015
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28


EOS
  actual = `./cal 2 2015`
  actual.should == expected
  end

  it "should correctly print January 2016" do
    expected = <<EOS
    January 2016
Su Mo Tu We Th Fr Sa
                1  2
 3  4  5  6  7  8  9
10 11 12 13 14 15 16
17 18 19 20 21 22 23
24 25 26 27 28 29 30
31
EOS
  actual = `./cal 1 2016`
  actual.should == expected
  end

  it "should successfully print December 2013" do
    expected = <<EOS
   December 2013
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30 31

EOS
    actual = `./cal 12 2013`
    actual.should == expected
  end
end
