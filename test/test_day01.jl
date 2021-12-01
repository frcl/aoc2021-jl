@testset "Day 1" begin
    @testset "Part 1" begin
        @test aoc2021.day01_part1(split("199\n200\n208\n210\n200\n207\n240\n269\n260\n263")) == 7
    end

    @testset "Part 2" begin
        @test aoc2021.day01_part2(split("199\n200\n208\n210\n200\n207\n240\n269\n260\n263")) == 5
    end
end
