day12_testcase_1 = split("""start-A
start-b
A-c
A-b
b-d
A-end
b-end""", '\n')
day12_testcase_2 = split("""dc-end
HN-start
start-kj
dc-start
dc-HN
LN-dc
HN-end
kj-sa
kj-HN
kj-dc""", '\n')
day12_testcase_3 = split("""fs-end
he-DX
fs-he
start-DX
pj-DX
end-zg
zg-sl
zg-pj
pj-he
RW-he
fs-DX
pj-RW
zg-RW
start-pj
he-WI
zg-he
pj-fs
start-RW""", '\n')


@testset "Day 12" begin
    @testset "Part 1" begin
        @test aoc2021.day12.part1(day12_testcase_1) == 10
        @test aoc2021.day12.part1(day12_testcase_2) == 19
        @test aoc2021.day12.part1(day12_testcase_3) == 226
    end

    @testset "Part 2" begin
        @test aoc2021.day12.part2(day12_testcase_1) == 36
        @test aoc2021.day12.part2(day12_testcase_2) == 103
        @test aoc2021.day12.part2(day12_testcase_3) == 3509
    end
end
