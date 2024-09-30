using TwMakieHelpers
using Test
using Aqua

@testset "TwMakieHelpers.jl" begin
    @testset "Code quality (Aqua.jl)" begin
        Aqua.test_all(TwMakieHelpers)
    end
    # Write your tests here.
end
