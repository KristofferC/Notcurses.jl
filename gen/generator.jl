#! /bin/bash julia --project generator.jl
using Clang.Generators
using Notcurses_jll

cd(@__DIR__)

# headers
# include_dir = joinpath(Notcurses_jll.artifact_dir, "include") |> normpath
include_dir = joinpath(@__DIR__, "include") |> normpath

# load common option
options = load_options(joinpath(@__DIR__, "generator.toml"))

args = get_default_args()
push!(args, "-I$include_dir")'
push!(args, "-fparse-all-comments")
headers = joinpath.(include_dir, "notcurses", ["notcurses.h", "direct.h"])

ctx = create_context(headers, args, options)

build!(ctx)
