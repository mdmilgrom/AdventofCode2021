using BenchmarkTools
#using Advent2021

list = map(x->tryparse(Int64,x),readlines("data/input_day1"))

function solve1(list)::Int64
  if length(list) == 1
    0
  else
    (list[end] > list[end-1]) + solve1(list[1:end-1])
  end
end

function solve2(io, Day)

end
@btime solve1(list)