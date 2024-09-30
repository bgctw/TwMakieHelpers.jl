using Test, SafeTestsets
const GROUP = get(ENV, "GROUP", "All") # defined in in CI.yml
@show GROUP

@time begin
    if GROUP == "All" || GROUP == "Basic"
        #@safetestset "Tests" include("test/test_Distributions.jl")
        @time @safetestset "test_Distributions" include("test_Distributions.jl")
        #@safetestset "Tests" include("test/test_AbstractMCMC.jl")
        @time @safetestset "test_AbstractMCMC" include("test_AbstractMCMC.jl")
    end
    if GROUP == "All" || GROUP == "JET"
        #@safetestset "Tests" include("test/test_JET.jl")
        @time @safetestset "test_JET" include("test_JET.jl")
        #@safetestset "Tests" include("test/test_aqua.jl")
        #TODO @time @safetestset "test_Aqua" include("test_aqua.jl")
    end
end
