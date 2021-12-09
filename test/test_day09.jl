day09_testcase = split("2199943210\n3987894921\n9856789892\n8767896789\n9899965678")


@testset "Day 09" begin
    @testset "Part 1" begin
        @test aoc2021.day09.part1(day09_testcase) == 15
    end

    @testset "Part 2" begin
        @test aoc2021.day09.part2(day09_testcase) == 1134
    end
end
