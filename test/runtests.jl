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

@testset "day2" begin
    @testset "part1" begin
        @test aoc20.day2.part1(["1-3 a: abaca"]) == 1
        @test aoc20.day2.part1(["1-3 a: abaaca"]) == 0
        @test aoc20.day2.part1(["1-3 a: bc"]) == 0
        @test aoc20.day2.part1(["0-0 a: abaaca"]) == 0
        @test part1(day = 2) == 506
    end

    @testset "part2" begin
        @test aoc20.day2.part2(["1-3 a: abc"]) == 1
        @test aoc20.day2.part2(["1-3 a: cba"]) == 1
        @test aoc20.day2.part2(["1-3 a: aba"]) == 0
        @test aoc20.day2.part2(["1-3 a: bac"]) == 0
        @test part2(day = 2) == 443
    end
end
