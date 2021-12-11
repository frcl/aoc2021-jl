day11_testcase = split("""5483143223
2745854711
5264556173
6141336146
6357385478
4167524645
2176841721
6882881134
4846848554
5283751526""", '\n')


@testset "Day 11" begin
    @testset "Part 1" begin
        @test aoc2021.day11.part1(day11_testcase) == 1656
    end

    @testset "Part 2" begin
        @test aoc2021.day11.part2(day11_testcase) == 195
    end
end
