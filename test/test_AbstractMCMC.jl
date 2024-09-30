using Test
using TwMakieHelpers
#using Distributions
using CairoMakie
using MCMCChains

() -> begin
    #using WGLMakie
    WGLMakie.activate!()
end

@testset "plot_chn" begin
    chn = Chains(rand(500, 2, 3), [:a, :b]);
    methods(plot_chn)
    fig = plot_chn(chn)
    ax = fig.content[1,1]
    @test length(ax.scene.plots) >= 3
end;
