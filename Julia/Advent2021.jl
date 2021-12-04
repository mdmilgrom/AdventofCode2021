module Advent2021

export daynum,
       stream,
       solve1,
       solve2,
       solve

using HTTP

struct Day{N} end

Day(N::Int) = Day{N}()

daynum(::Day{N}) where N = N

function _download_data(d::Day)
    day = daynum(d)
    outpath = "data/input_day$(lpad(day, 2, '0'))"
    isfile(outpath) && return outpath
    open(outpath, "w") do io
        write(io, HTTP.get("https://adventofcode.com/2021/day/$(daynum(d))/input"; cookies = Dict("session" => ENV["AOC_SESSION"])).body)
    end
    return outpath
end

function stream(f, io::IO)
    Iterators.map(f, eachline(io))
end

function stream(f, d::Day)
    Iterators.map(f, eachline(_download_data(d)))
end

solve1(io, d::Day) = error("No solution for part1 of Day $(daynum(d))")
solve1(d::Day) = solve1(d, d)

solve2(io, d::Day) = error("No solution for part2 of Day $(daynum(d))")
solve2(d::Day) = solve2(d, d)

solve(d::Day) = (solve1(d), solve2(d))

include("Day1.jl")
include("Day2.jl")

end