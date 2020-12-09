module day8

function readInput()
    result = NamedTuple{(:op, :x),Tuple{Symbol,Int64}}[]
    for line in eachline(joinpath(@__DIR__, "input.txt"))
        op, x = split(line)
        push!(result, (op = Symbol(op), x = parse(Int, x)))
    end
    result
end

function run(input)
    acc, ptr = 0, 1
    states = Set{Int}()
    terminate = false
    while true
        ptr in states && return acc, false
        ptr == length(input) && (terminate = true)
        !(1 <= ptr <= length(input)) && return typemin(Int), false
        push!(states, ptr)
        instruction = input[ptr]
        if instruction.op === :acc
            acc += instruction.x
            ptr += 1
        elseif instruction.op === :jmp
            ptr += instruction.x
        elseif instruction.op === :nop
            ptr += 1
        else
            error("unknown instruction $(instruction.op)")
        end
        terminate && break
    end
    return acc, true
end


function part1(input)
    acc, terminated = run(input)
    return acc
end

function part2(input)
    for i in findall(i -> i.op !== :acc, input)

        if input[i].op === :jmp
            input[i] = (op = :nop, x = input[i].x)
        else
            input[i] = (op = :jmp, x = input[i].x)
        end

        acc, success = run(input)
        success && return acc
        if input[i].op === :jmp
            input[i] = (op = :nop, x = input[i].x)
        else
            input[i] = (op = :jmp, x = input[i].x)
        end

    end
end

end