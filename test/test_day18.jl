using aoc2021.day18: SFNumber, magnitude


day18_testcase = split("""[[[0,[5,8]],[[1,7],[9,6]]],[[4,[1,2]],[[1,4],2]]]
[[[5,[2,8]],4],[5,[[9,9],0]]]
[6,[[[6,2],[5,6]],[[7,6],[4,7]]]]
[[[6,[0,7]],[0,9]],[4,[9,[9,0]]]]
[[[7,[6,4]],[3,[1,3]]],[[[5,5],1],9]]
[[6,[[7,3],[3,2]]],[[[3,8],[5,7]],4]]
[[[[5,4],[7,7]],8],[[8,3],8]]
[[9,3],[[9,9],[6,[4,9]]]]
[[2,[[7,7],7]],[[5,8],[[9,3],[0,2]]]]
[[[[5,2],5],[8,[3,7]]],[[5,[7,5]],[4,4]]]""", '\n')


@testset "Day 18" begin
    @testset "SFNumbers" begin
        @testset "Addition" begin
            let a = SFNumber([[[[4,3],4],4],[7,[[8,4],9]]]), b = SFNumber([1,1])
                @test a + b == SFNumber([[[[0,7],4],[[7,8],[6,0]]],[8,1]])
            end
            let l = [SFNumber(i, i) for i in 1:4]
                @test sum(l) == SFNumber([[[[1,1],[2,2]],[3,3]],[4,4]])
            end
            let l = [SFNumber(i, i) for i in 1:5]
                @test sum(l) == SFNumber([[[[3,0],[5,3]],[4,4]],[5,5]])
            end
            let l = [SFNumber(i, i) for i in 1:6]
                @test sum(l) == SFNumber([[[[5,0],[7,4]],[5,5]],[6,6]])
            end
            let l = map(SFNumber, [
                [[[0,[4,5]],[0,0]],[[[4,5],[2,6]],[9,5]]],
                [7,[[[3,7],[4,3]],[[6,3],[8,8]]]],
                [[2,[[0,8],[3,4]]],[[[6,7],1],[7,[1,6]]]],
                [[[[2,4],7],[6,[0,5]]],[[[6,8],[2,8]],[[2,1],[4,5]]]],
                [7,[5,[[3,8],[1,4]]]],
                [[2,[2,2]],[8,[8,1]]],
                [2,9],
                [1,[[[9,3],9],[[9,0],[0,7]]]],
                [[[5,[7,4]],7],1],
                [[[[4,2],2],6],[8,7]],
            ])
                @test sum(l) == SFNumber([[[[8,7],[7,7]],[[8,6],[7,7]]],[[[0,7],[6,6]],[8,7]]])
            end
        end
        @testset "Magnitude" begin
            @test magnitude(SFNumber(
                [[[[8,7],[7,7]],[[8,6],[7,7]]],[[[0,7],[6,6]],[8,7]]]
            )) == 3488
            @test magnitude(SFNumber(
                [[[[6,6],[7,6]],[[7,7],[7,0]]],[[[7,7],[7,7]],[[7,8],[9,9]]]]
            )) == 4140
        end
    end

    @testset "Part 1" begin
        @test aoc2021.day18.part1(day18_testcase) == 4140
    end

    @testset "Part 2" begin
        @test aoc2021.day18.part2(day18_testcase) == 3993
    end
end
