day05_testcase = split("0,9 -> 5,9\n8,0 -> 0,8\n9,4 -> 3,4\n2,2 -> 2,1\n7,0 -> 7,4\n6,4 -> 2,0\n0,9 -> 2,9\n3,4 -> 1,4\n0,0 -> 8,8\n5,5 -> 8,2", '\n')


@testset "Day 05" begin
    @testset "Part 1" begin
        @test aoc2021.day05_part1(day05_testcase) == 5
    end

    @testset "Part 2" begin
        @test aoc2021.day05_part2(day05_testcase) == 12
    end
end
