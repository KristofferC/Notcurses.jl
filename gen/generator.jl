#! /bin/bash julia --project generator.jl
using Clang.Generators
using Clang.Generators.JLLEnvs
# using Clang.LibClang.Clang_jll  # replace this with your jll package

cd(@__DIR__)

# headers
include_dir = joinpath(@__DIR__, "include") |> normpath

# load common option
options = load_options(joinpath(@__DIR__, "generator.toml"))

args = get_default_args()
push!(args, "-I$include_dir")'
headers = detect_headers(include_dir, args)

ctx = create_context(headers, args, options)

build!(ctx)
