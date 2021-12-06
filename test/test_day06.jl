day06_testcase = ["3,4,3,1,2"]


@testset "Day 06" begin
    @testset "Part 1" begin
        @test aoc2021.day06_part1(day06_testcase) == 5934
    end

    @testset "Part 2" begin
        @test aoc2021.day06_part2(day06_testcase) == 26984457539
    end
end
