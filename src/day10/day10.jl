module day10

using OffsetArrays

readInput() = parse.(Int, eachline(joinpath(@__DIR__, "input.txt")))

function part1(input)
    list = sort(input)
    pushfirst!(list, 0)
    push!(list, list[end] + 3)
    nbOnes, nbThrees = 0, 0
    for i = 1:length(list) - 1
        if list[i + 1] - list[i] == 1
            nbOnes += 1
        elseif list[i + 1] - list[i] == 3
            nbThrees += 1
        end
    end
    nbOnes * nbThrees
end

function part2(input)
    list = sort(input)
    push!(list, list[end] + 3)
    nbWays = OffsetVector(zeros(Int, list[end] + 1), -1)
    nbWays[0] = 1
    for i in list
        nbWays[i] = nbWays[i - 1] + (i > 1 ? nbWays[i - 2] : 0) + (i > 2 ? nbWays[i - 3] : 0)
    end
    nbWays[end]
end

end