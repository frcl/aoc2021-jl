day03_testcase = split("00100\n11110\n10110\n10111\n10101\n01111\n00111\n11100\n10000\n11001\n00010\n01010")

@testset "Day 03" begin
    @testset "Part 1" begin
        @test aoc2021.day03.part1(day03_testcase) == 198
    end

    @testset "Part 2" begin
        @test aoc2021.day03.part2(day03_testcase) == 230
    end
end
