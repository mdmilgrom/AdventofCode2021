library(testthat)

testdata1 <- "199
200
208
210
200
207
240
269
260
263"
compare_2 <- c(607,618,618,617,647,716,769,792)

testthat::expect_equal(sumWindow(testdata1,1), testdata1)
testthat::expect_equal(sumWindow(testdata1,3), compare_2)
testthat::expect_equal(solveDay1(source=testdata1), c(7,5))

testdata2 <- "forward 5
down 5
forward 8
up 3
down 8
forward 2"
testthat::expect_equal(solveDay2(testdata2), c(150,900))
