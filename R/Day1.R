day <- 1

solveDay1 <- function(source=NULL) {
  input <- getData(day,source = source) |> trimws() |> str_split('\n') |> unlist() |> as.integer()
  diff_1 <- diff(sumWindow(input,1))
  diff_3 <- diff(sumWindow(input,3))
  c((diff_1 > 0) |> sum(), (diff_3 > 0) |> sum())
}
