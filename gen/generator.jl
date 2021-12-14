#! /bin/bash julia --project generator.jl
using Clang.Generators
using Notcurses_jll

cd(@__DIR__)

# headers
# include_dir = joinpath(Notcurses_jll.artifact_dir, "include") |> normpath
include_dir = joinpath(@__DIR__, "include") |> normpath

# load common option
options = load_options(joinpath(@__DIR__, "generator.toml"))

headers = joinpath.(include_dir, "notcurses", ["notcurses.h", "direct.h", "nckeys.h"])

static_inlines = Vector{String}()
for header in headers
    lines = readlines(header)
    static_inline_lines = findall(x->occursin("static inline",x), lines)
    vars = static_inline_lines .+ 1
    for v in lines[vars]
        m = match(r"(.*?)\(", v)
        push!(static_inlines, m[1])
    end
end

noncore = [
    "ncdirect_init",
    "notcurses_init",
]
    
args = get_default_args()
push!(args, "-I$include_dir")
push!(args, "-fparse-all-comments")

orig_ignore = copy(options["general"]["output_ignorelist"])

# Core:
append!(options["general"]["output_ignorelist"], [static_inlines; noncore])
options["general"]["library_name"] = "libnotcurses_core"
options["general"]["output_file_path"] = "../lib/LibNotcurses_core.jl"
options["general"]["module_name"] = "LibNotcursesCore"
options["general"]["prologue_file_path"] = "./prologue_core.jl"
ctx = create_context(headers, args, options)
build!(ctx)
options["general"]["output_ignorelist"] = copy(orig_ignore)

options["general"]["prologue_file_path"] = "./prologue.jl"
# FFI
options["general"]["output_exclusivelist"] = static_inlines
options["general"]["library_name"] = "libnotcurses_ffi"
options["general"]["output_file_path"] = "../lib/LibNotcurses_ffi.jl"
options["general"]["module_name"] = "LibNotcursesFFI"
ctx = create_context(headers, args, options)
build!(ctx)

# FFI
options["general"]["output_exclusivelist"] = noncore
options["general"]["library_name"] = "libnotcurses"
options["general"]["output_file_path"] = "../lib/LibNotcurses.jl"
options["general"]["module_name"] = "LibNotcurses"
ctx = create_context(headers, args, options)
build!(ctx)