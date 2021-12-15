day15_testcase = split("""1163751742
1381373672
2136511328
3694931569
7463417111
1319128137
1359912421
3125421639
1293138521
2311944581""", '\n')


@testset "Day 15" begin
    @testset "Part 1" begin
        @test aoc2021.day15.part1(day15_testcase) == 40
    end

    @testset "Part 2" begin
        @test aoc2021.day15.part2(day15_testcase) == 315
    end
end
