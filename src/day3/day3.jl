module day3

const ⨸ = mod1
readInput() = reduce(hcat, map.(x -> x == '.' ? 0 : 1, collect.(readlines(joinpath(@__DIR__, "input.txt")))))

function part1(input, slope = (3, 1))
    width, height = size(input)
    nbTrees = 0
    pos = (1, 1)
    while pos[2] <= height
        nbTrees += input[pos...]
        pos = pos .+ slope
        pos = (pos[1] ⨸ width, pos[2])
    end
    nbTrees
end

part2(input) = reduce(*, (part1(input, slope) for slope in ((1,1), (3,1), (5,1), (7,1), (1,2))))

end