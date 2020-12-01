module day1

readInput() = parse.(Int, readlines(joinpath(@__DIR__, "input.txt")))

function part1(input)
    for i = 1:length(input), j = i+1:length(input)
        a, b = input[i], input[j]
        a + b == 2020 && return a * b 
    end
end

function part2(input)
    for i = 1:length(input), j = i+1:length(input), k = j+1:length(input)
        a, b, c = input[i], input[j], input[k]
        a + b + c == 2020 && return a * b * c
    end
end

end