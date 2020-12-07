module day7

function readInput()
    rules = Dict{String,Vector{Tuple{Int,String}}}()
    for line in eachline(joinpath(@__DIR__, "input.txt"))
        tokens = split(line, r"(contain\s)|(,\s)|(\sbags?.?)", keepempty=false)
        key = first(tokens)
        val = Tuple{Int,String}[]
        for str in tokens[2:end]
            m = match(r"(\d+)\s(.*)", str)
            m === nothing && break
            nb, type = m.captures
            push!(val, (parse(Int, nb), type))
        end
        rules[key] = val
    end
    rules
end

function canContain(recipient, target, rules)
    isempty(rules[recipient]) && return false
    any(x -> last(x) == target, rules[recipient]) && return true
    return any(rec -> canContain(rec, target, rules), last.(rules[recipient]))
end

function nbBags(recipient, rules)
    mapreduce(((i, r),) -> (1 + nbBags(r, rules)) * i, +, rules[recipient] ; init=0)
end

part1(rules) = count(canContain.(keys(rules), "shiny gold", Ref(rules)))

part2(rules) = nbBags("shiny gold", rules)

end