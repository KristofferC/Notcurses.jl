using Notcurses
using Test

@testset "Notcurses.jl" begin
    @test Notcurses.version() == "3.0.1"
end
