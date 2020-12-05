module day5

using LinearAlgebra: dot
readInput() = readlines(joinpath(@__DIR__, "input.txt"))

function decode(s, low, high)
    for char in s
        if char == 'F' || char == 'L'
            high = (high + low) ÷ 2
        else
            low = (high + low) ÷ 2 + 1
        end
    end
    @assert low == high
    low
end

function decode(s)
    row = decode(view(s, 1:7), 0, 127)
    col = decode(view(s, 8:10), 0, 7)
    row, col
end

part1(input) = mapreduce(s -> dot(decode(s), (8,1)), max, input)

function part2(input)
    ids = sort!(map(s -> dot(decode(s), (8,1)), input))
    for i = 1:length(ids) - 1
        ids[i] + 1 != ids[i+1] && return ids[i] + 1
    end
end

end