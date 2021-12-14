day14_testcase = split("""NNCB

CH -> B
HH -> N
CB -> H
NH -> C
HB -> C
HC -> B
HN -> C
NN -> C
BH -> H
NC -> B
NB -> B
BN -> B
BB -> N
BC -> B
CC -> N
CN -> C""", '\n')

@testset "Day 14" begin
    @testset "Part 1" begin
        @test aoc2021.day14.part1(day14_testcase) == 1588
    end

    @testset "Part 2" begin
        @test aoc2021.day14.part2(day14_testcase) == 2188189693529
    end
end
