library(httr)
library(tidyverse)

getData <- function(day, source=NULL) {
  ifelse(is.null(source),content(httr::GET(paste0('https://adventofcode.com/2021/day/',day,'/input'), set_cookies('session'=Sys.getenv('AOC_SESSION')))),source)
  }

solver <- function(day) {
  getData(day) |> solveDay(day)
}

sumWindow <- function(data, size) {
  sapply(size:length(data), function(x) sum(data[(x-(size-1)):x]))
}
