module day6

readInput() = split.(split(read(joinpath(@__DIR__, "input.txt"), String), "\r\n\r\n"), "\r\n")

part1(input) =  (union(vec...) for vec in input)  .|> length |> sum

part2(input) =  (intersect(vec...) for vec in input)  .|> length |> sum

end