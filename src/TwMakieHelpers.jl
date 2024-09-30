module TwMakieHelpers

@doc let
    path = joinpath(dirname(@__DIR__), "README.md")
    include_dependency(path)
    read(path, String)
end TwMakieHelpers

export density_dist, density_dist!
include("ext_Distributions.jl")

export plot_chn, plot_chn!
include("ext_AbstractMCMC.jl")

end
