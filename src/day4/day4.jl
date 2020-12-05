module day4

function readInput()
    result = [Dict{String, String}()]
    for line in readlines(joinpath(@__DIR__, "input.txt"))
        if line == ""
            push!(result, Dict{String, String}())
        else
            push!(result[end], map(x -> Pair(split(x, ":")...), split(line, " "))...) # ¯\_(ツ)_/¯
        end
    end
    result
end

checkerP1(d::AbstractDict) = all(key -> haskey(d, key), ("byr","iyr","eyr","hgt","hcl","ecl","pid"))

part1(input) = count(checkerP1, input)

function checkerP2(d::AbstractDict)
    !checkerP1(d) && return false
    
    byr = tryparse(Int, d["byr"]) ; (byr === nothing || byr < 1920 || byr > 2002) && return false

    iyr = tryparse(Int, d["iyr"]) ; (iyr === nothing || iyr < 2010 || iyr > 2020) && return false

    eyr = tryparse(Int, d["eyr"]) ; (eyr === nothing || eyr < 2020 || eyr > 2030) && return false

    hgt = match(r"^(\d+)(in|cm)$", d["hgt"]) ; hgt === nothing && return false
    h, unit = parse(Int, hgt.captures[1]), hgt.captures[2]
    unit == "cm" && (h < 150 || h > 193) && return false
    unit == "in" && (h < 59 || h > 76) && return false

    hcl = match(r"^#[a-f0-9]{6}$", d["hcl"]) ; hcl === nothing && return false
    
    d["ecl"] in ("amb", "blu", "brn", "gry", "grn", "hzl", "oth") || return false
    
    pid = match(r"^\d{9}$", d["pid"]) ; pid === nothing && return false

    true
end

part2(input) = count(checkerP2, input)

end