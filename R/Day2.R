day <- 2

solveDay2 <- function(source = NULL) {
  input <- getData(day,source = source) |>
    trimws() |>
    tibble() |>
    separate_rows(1,sep='\n') |>
    separate(1,c('command', 'distance'), convert=TRUE,sep=" ") |>
    mutate(distance = ifelse(command == 'up', -distance, distance)) 
#Part 1
  x <- input |>
    filter(command == 'forward') |>
    summarise(distance = sum(distance)) |>
    pull(distance)
  y <- input |>
    filter(command %in% c('down','up')) |>
    summarise(distance = sum(distance)) |>
    pull(distance)
#Part 2
  aim <- 0
  x2 <- y2 <- 0
  for (d in 1:nrow(input)) {
    ifelse(input[d,"command"] == 'forward', {x2 <- x2 + input[d,"distance"]; y2 <- y2 + input[d,"distance"] * aim}, aim <- aim + input[d,"distance"])
  }
  #print(typeof(x2))
  c(x * y, x2$distance * y2$distance)
}
