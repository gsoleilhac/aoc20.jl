using aoc20
using Test, aoc20

@testset "aoc20.jl" begin
    @test_nowarn aoc20.benchmarkAll(onlyOnce = true)
    @test aoc20.formatTime(0.1) == "100.000 ms"
end

@testset "day1" begin
    @testset "part1" begin
        @test part1(day = 1) == 1006875
    end

    @testset "part2" begin
        @test part2(day = 1) == 165026160
    end
end
