using aoc20
using Test, aoc20

@testset "aoc20.jl" begin
    @test_nowarn aoc20.benchmarkAll(onlyOnce = true)
    @test aoc20.formatTime(0.1) == "100.000 ms"
end

@testset "day1" begin
    @testset "part1" begin
    end

    @testset "part2" begin
    end
end
