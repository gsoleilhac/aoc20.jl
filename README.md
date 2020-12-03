# aoc20

![Github Actions](https://github.com/gsoleilhac/aoc20.jl/workflows/CI/badge.svg?branch=master)
[![Build Status](https://travis-ci.com/gsoleilhac/aoc20.jl.svg?branch=master)](https://travis-ci.com/gsoleilhac/aoc20.jl)
[![Codecov](https://codecov.io/gh/gsoleilhac/aoc20.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/gsoleilhac/aoc20.jl)

### Running

```julia
julia> ]dev https://github.com/gsoleilhac/aoc20.jl
julia> using aoc20
julia> part1(day = 1)
julia> part2(day = 1)
julia> aoc20.benchmarkAll()
```

| day | part1      | part2      |
|-----|------------|------------|
| 1   | 3.263 μs   | 535.800 μs |
| 2   | 502.700 μs | 516.600 μs |
| 2   | 2.867 μs   | 13.600 μs  |