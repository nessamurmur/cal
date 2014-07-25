RSpec.describe "Cal's full month integration" do

  it "should correctly print 2014" do
    expected = <<EOS
                             2014

      January               February               March
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
          1  2  3  4                     1                     1
 5  6  7  8  9 10 11   2  3  4  5  6  7  8   2  3  4  5  6  7  8
12 13 14 15 16 17 18   9 10 11 12 13 14 15   9 10 11 12 13 14 15
19 20 21 22 23 24 25  16 17 18 19 20 21 22  16 17 18 19 20 21 22
26 27 28 29 30 31     23 24 25 26 27 28     23 24 25 26 27 28 29
                                            30 31
       April                  May                   June
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
       1  2  3  4  5               1  2  3   1  2  3  4  5  6  7
 6  7  8  9 10 11 12   4  5  6  7  8  9 10   8  9 10 11 12 13 14
13 14 15 16 17 18 19  11 12 13 14 15 16 17  15 16 17 18 19 20 21
20 21 22 23 24 25 26  18 19 20 21 22 23 24  22 23 24 25 26 27 28
27 28 29 30           25 26 27 28 29 30 31  29 30

        July                 August              September
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
       1  2  3  4  5                  1  2      1  2  3  4  5  6
 6  7  8  9 10 11 12   3  4  5  6  7  8  9   7  8  9 10 11 12 13
13 14 15 16 17 18 19  10 11 12 13 14 15 16  14 15 16 17 18 19 20
20 21 22 23 24 25 26  17 18 19 20 21 22 23  21 22 23 24 25 26 27
27 28 29 30 31        24 25 26 27 28 29 30  28 29 30
                      31
      October               November              December
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
          1  2  3  4                     1      1  2  3  4  5  6
 5  6  7  8  9 10 11   2  3  4  5  6  7  8   7  8  9 10 11 12 13
12 13 14 15 16 17 18   9 10 11 12 13 14 15  14 15 16 17 18 19 20
19 20 21 22 23 24 25  16 17 18 19 20 21 22  21 22 23 24 25 26 27
26 27 28 29 30 31     23 24 25 26 27 28 29  28 29 30 31
                      30
EOS
    actual = `./cal 2014`
    actual.should == expected
  end

#   it "should correctly print 2017" do
#     expected = <<EOS
#                              2017
#
#       January               February               March
# Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
#  1  2  3  4  5  6  7            1  2  3  4            1  2  3  4
#  8  9 10 11 12 13 14   5  6  7  8  9 10 11   5  6  7  8  9 10 11
# 15 16 17 18 19 20 21  12 13 14 15 16 17 18  12 13 14 15 16 17 18
# 22 23 24 25 26 27 28  19 20 21 22 23 24 25  19 20 21 22 23 24 25
# 29 30 31              26 27 28              26 27 28 29 30 31
#
#        April                  May                   June
# Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
#                    1      1  2  3  4  5  6               1  2  3
#  2  3  4  5  6  7  8   7  8  9 10 11 12 13   4  5  6  7  8  9 10
#  9 10 11 12 13 14 15  14 15 16 17 18 19 20  11 12 13 14 15 16 17
# 16 17 18 19 20 21 22  21 22 23 24 25 26 27  18 19 20 21 22 23 24
# 23 24 25 26 27 28 29  28 29 30 31           25 26 27 28 29 30
# 30
#         July                 August              September
# Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
#                    1         1  2  3  4  5                  1  2
#  2  3  4  5  6  7  8   6  7  8  9 10 11 12   3  4  5  6  7  8  9
#  9 10 11 12 13 14 15  13 14 15 16 17 18 19  10 11 12 13 14 15 16
# 16 17 18 19 20 21 22  20 21 22 23 24 25 26  17 18 19 20 21 22 23
# 23 24 25 26 27 28 29  27 28 29 30 31        24 25 26 27 28 29 30
# 30 31
#       October               November              December
# Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
#  1  2  3  4  5  6  7            1  2  3  4                  1  2
#  8  9 10 11 12 13 14   5  6  7  8  9 10 11   3  4  5  6  7  8  9
# 15 16 17 18 19 20 21  12 13 14 15 16 17 18  10 11 12 13 14 15 16
# 22 23 24 25 26 27 28  19 20 21 22 23 24 25  17 18 19 20 21 22 23
# 29 30 31              26 27 28 29 30        24 25 26 27 28 29 30
#                                             31
# EOS
#     actual = `./cal 2017`
#     actual.should == expected
#   end
#
#   it "should correctly print 2000" do
#     expected = <<EOS
#                              2000
#
#       January               February               March
# Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
#                    1         1  2  3  4  5            1  2  3  4
#  2  3  4  5  6  7  8   6  7  8  9 10 11 12   5  6  7  8  9 10 11
#  9 10 11 12 13 14 15  13 14 15 16 17 18 19  12 13 14 15 16 17 18
# 16 17 18 19 20 21 22  20 21 22 23 24 25 26  19 20 21 22 23 24 25
# 23 24 25 26 27 28 29  27 28 29              26 27 28 29 30 31
# 30 31
#        April                  May                   June
# Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
#                    1      1  2  3  4  5  6               1  2  3
#  2  3  4  5  6  7  8   7  8  9 10 11 12 13   4  5  6  7  8  9 10
#  9 10 11 12 13 14 15  14 15 16 17 18 19 20  11 12 13 14 15 16 17
# 16 17 18 19 20 21 22  21 22 23 24 25 26 27  18 19 20 21 22 23 24
# 23 24 25 26 27 28 29  28 29 30 31           25 26 27 28 29 30
# 30
#         July                 August              September
# Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
#                    1         1  2  3  4  5                  1  2
#  2  3  4  5  6  7  8   6  7  8  9 10 11 12   3  4  5  6  7  8  9
#  9 10 11 12 13 14 15  13 14 15 16 17 18 19  10 11 12 13 14 15 16
# 16 17 18 19 20 21 22  20 21 22 23 24 25 26  17 18 19 20 21 22 23
# 23 24 25 26 27 28 29  27 28 29 30 31        24 25 26 27 28 29 30
# 30 31
#       October               November              December
# Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
#  1  2  3  4  5  6  7            1  2  3  4                  1  2
#  8  9 10 11 12 13 14   5  6  7  8  9 10 11   3  4  5  6  7  8  9
# 15 16 17 18 19 20 21  12 13 14 15 16 17 18  10 11 12 13 14 15 16
# 22 23 24 25 26 27 28  19 20 21 22 23 24 25  17 18 19 20 21 22 23
# 29 30 31              26 27 28 29 30        24 25 26 27 28 29 30
#                                             31
# EOS
#     actual = `./cal 2000`
#     actual.should == expected
#   end
#
#   it "should correctly print 1950" do
#     expected = <<EOS
#                              1950
#
#       January               February               March
# Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
#  1  2  3  4  5  6  7            1  2  3  4            1  2  3  4
#  8  9 10 11 12 13 14   5  6  7  8  9 10 11   5  6  7  8  9 10 11
# 15 16 17 18 19 20 21  12 13 14 15 16 17 18  12 13 14 15 16 17 18
# 22 23 24 25 26 27 28  19 20 21 22 23 24 25  19 20 21 22 23 24 25
# 29 30 31              26 27 28              26 27 28 29 30 31
#
#        April                  May                   June
# Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
#                    1      1  2  3  4  5  6               1  2  3
#  2  3  4  5  6  7  8   7  8  9 10 11 12 13   4  5  6  7  8  9 10
#  9 10 11 12 13 14 15  14 15 16 17 18 19 20  11 12 13 14 15 16 17
# 16 17 18 19 20 21 22  21 22 23 24 25 26 27  18 19 20 21 22 23 24
# 23 24 25 26 27 28 29  28 29 30 31           25 26 27 28 29 30
# 30
#         July                 August              September
# Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
#                    1         1  2  3  4  5                  1  2
#  2  3  4  5  6  7  8   6  7  8  9 10 11 12   3  4  5  6  7  8  9
#  9 10 11 12 13 14 15  13 14 15 16 17 18 19  10 11 12 13 14 15 16
# 16 17 18 19 20 21 22  20 21 22 23 24 25 26  17 18 19 20 21 22 23
# 23 24 25 26 27 28 29  27 28 29 30 31        24 25 26 27 28 29 30
# 30 31
#       October               November              December
# Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
#  1  2  3  4  5  6  7            1  2  3  4                  1  2
#  8  9 10 11 12 13 14   5  6  7  8  9 10 11   3  4  5  6  7  8  9
# 15 16 17 18 19 20 21  12 13 14 15 16 17 18  10 11 12 13 14 15 16
# 22 23 24 25 26 27 28  19 20 21 22 23 24 25  17 18 19 20 21 22 23
# 29 30 31              26 27 28 29 30        24 25 26 27 28 29 30
#                                             31
# EOS
#     actual = `./cal 1950`
#     actual.should == expected
#   end

end
