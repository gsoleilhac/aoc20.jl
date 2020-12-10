# aoc20

![Github Actions](https://github.com/gsoleilhac/aoc20.jl/workflows/CI/badge.svg?branch=master)
[![Codecov](https://codecov.io/gh/gsoleilhac/aoc20.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/gsoleilhac/aoc20.jl)

### Running

```julia
julia> ]dev https://github.com/gsoleilhac/aoc20.jl
julia> using aoc20
julia> part1(day = 1)
julia> part2(day = 1)
julia> aoc20.benchmarkAll()
```

| day | parsing    | part1      | part2      |
| --- | ---------- | ---------- | ---------- |
| 1   | 63.800 μs  | 3.250 μs   | 514.200 μs |
| 2   | 148.900 μs | 485.700 μs | 466.300 μs |
| 3   | 142.800 μs | 2.867 μs   | 14.300 μs  |
| 4   | 1.723 ms   | 54.400 μs  | 235.600 μs |
| 5   | 27.739 ns  | 83.100 μs  | 102.900 μs |
| 6   | 25.878 ns  | 646.300 μs | 1.028 ms   |
| 7   | 25.402 ns  | 10.657 ms  | 4.029 μs   |
| 8   | 23.370 ns  | 3.900 μs   | 3.737 μs   |
| 9   | 23.547 ns  | 31.200 μs  | 641.333 ns |
| 10  | 23.571 ns  | 658.491 ns | 852.809 ns |