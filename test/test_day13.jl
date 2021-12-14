day13_testcase = split("""6,10
0,14
9,10
0,3
10,4
4,11
6,0
6,12
4,1
0,13
10,12
3,4
3,0
8,4
1,10
2,14
8,10
9,0

fold along y=7
fold along x=5""", '\n')


@testset "Day 13" begin
    @testset "Part 1" begin
        @test aoc2021.day13.part1(day13_testcase) == 17
    end

    @testset "Part 2" begin
        @test aoc2021.day13.part2(day13_testcase) == "#####\n#...#\n#...#\n#...#\n#####"
    end
end
