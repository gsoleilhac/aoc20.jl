module day9

readInput() = parse.(Int, eachline(joinpath(@__DIR__, "input.txt")))

function isValid(target, list)
    for i in 1:length(list) - 1, j in i + 1:length(list)
        list[i] + list[j] == target && return true
    end
    false
end

function part1(input, width=25)
    i = width + 1
    while isValid(input[i], view(input, (i - width):(i - 1)))
        i += 1
    end
    input[i]
end

function findRange(target, list)
    i, j = 1, 2
    sum = list[i] + list[j]
    while sum != target
        if sum > target && j - 1 > 1
            sum -= list[i]
            i += 1
        elseif sum < target
            j += 1
            sum += list[j]
        end
    end
    return i, j
end

const resultP1 = part1(readInput()) # To leave part1 out of the benchmark

function part2(input, target=resultP1)
    i, j = findRange(target, input)
    +(extrema(view(input, i:j))...)
end

end