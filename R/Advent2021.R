library(httr)
library(tidyverse)

getData <- function(day) {
  content(httr::GET(paste0('https://adventofcode.com/2021/day/',day,'/input'), set_cookies('session'=Sys.getenv('AOC_SESSION'))))
  }

solver <- function(day) {
  getData(day) |> solveDay(day)
}

sumWindow <- function(data, size) {
  sapply(size:length(data), function(x) sum(data[(x-(size-1)):x]))
}
