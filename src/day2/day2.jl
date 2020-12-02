module day2

readInput() = readlines(joinpath(@__DIR__, "input.txt"))

function checkerP1(s::String)
    s_lb, s_ub, s_char, pwd = split(s, ['-', ':', ' '], keepempty=false)
    lb, ub, char = parse(Int, s_lb), parse(Int, s_ub), s_char[1]
    return lb <= count(==(char), pwd) <= ub
end

part1(input) = count(checkerP1, input)

function checkerP2(s::String)
    s_lb, s_ub, s_char, pwd = split(s, ['-', ':', ' '], keepempty=false)
    lb, ub, char = parse(Int, s_lb), parse(Int, s_ub), s_char[1]
    return (pwd[lb] == char) ⊻ (pwd[ub] == char)
end

part2(input) = count(checkerP2, input)

end