module aoc20

using BenchmarkTools, ProgressMeter
import DataFrames: DataFrame
import Dates, REPL

export part1, part2
export run_program!, process_opcode!

for day = 1:25
    include("day$day/day$day.jl")
end

formatTime(t) = (1e9 * t) |> BenchmarkTools.prettytime

function benchmarkAll(; onlyOnce = false)
    df = DataFrame(parsing = String[], part1 = String[], part2 = String[])
    terminal = REPL.Terminals.TTYTerminal("", stdin, stdout, stderr)
    for day = 1:25
        !isdefined(@__MODULE__, Symbol("day$day")) && continue
        m = getproperty(@__MODULE__, Symbol("day$day"))
        input = m.readInput()
        t1 = onlyOnce ? @elapsed(m.readInput()) : @belapsed($m.readInput())
        t2 = onlyOnce ? @elapsed(m.part1(input)) : @belapsed($m.part1($input))
        t3 = onlyOnce ? @elapsed(m.part2(input)) : @belapsed($m.part2($input))
        push!(df, formatTime.((t1, t2, t3)))
        if !onlyOnce
            REPL.Terminals.clear(terminal) 
            display(df)
        end
    end
    df
end

function part1(; day::Int = min(Dates.day(Dates.today()), 25))
    m = getproperty(@__MODULE__, Symbol("day$day"))
    input = m.readInput()
    m.part1(input)
end

function part2(; day::Int = min(Dates.day(Dates.today()), 25))
    m = getproperty(@__MODULE__, Symbol("day$day"))
    input = m.readInput()
    m.part2(input)
end

function benchmark(; day::Int = min(Dates.day(Dates.today()), 25))
    df = DataFrame(parsing = String[], part1 = String[], part2 = String[])
    m = getproperty(@__MODULE__, Symbol("day$day"))
    input = m.readInput()
    t1 = @belapsed($m.readInput)
    t2 = @belapsed($m.part1($input))
    t3 = @belapsed($m.part2($input))
    push!(df, formatTime.((t1, t2, t3)))
    df
end


end # module
