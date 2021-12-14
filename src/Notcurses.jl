module Notcurses

export Ncplane, putstr
export NotCurses
export NcDirect

export cursor_enable, cursor_disable, set_fg

using Libdl
using Ncurses_jll
using CEnum

include("../lib/LibNotcurses_core.jl")
include("../lib/LibNotcurses_ffi.jl")
include("../lib/LibNotcurses.jl")
using .LibNotcursesCore
using .LibNotcursesFFI
using .LibNotcurses

version() = unsafe_string(notcurses_version())


#############
# Exception #
#############
struct NotCursesException
    str::String
end
Base.showerror(io::IO, nce::NotCursesException) = print(io, nce.str)

throw_nc(str) = throw(NotCursesException(str))


####################
# NotCursesOptions #
####################
module LogLevel
using ..LibNotcursesCore
@enum _LogLevel begin
    SILENT  = LibNotcursesCore.NCLOGLEVEL_SILENT  |> Int
    PANIC   = LibNotcursesCore.NCLOGLEVEL_PANIC   |> Int
    FATAL   = LibNotcursesCore.NCLOGLEVEL_FATAL   |> Int
    ERROR   = LibNotcursesCore.NCLOGLEVEL_ERROR   |> Int
    WARNING = LibNotcursesCore.NCLOGLEVEL_WARNING |> Int
    INFO    = LibNotcursesCore.NCLOGLEVEL_INFO    |> Int
    VERBOSE = LibNotcursesCore.NCLOGLEVEL_VERBOSE |> Int
    DEBUG   = LibNotcursesCore.NCLOGLEVEL_DEBUG   |> Int
    TRACE   = LibNotcursesCore.NCLOGLEVEL_TRACE   |> Int
end
end

module NotCursesOptionsFlag
using ..CEnum, ..LibNotcursesCore
@cenum _NotCursesOptionsFlags begin
    INHIBIT_SETLOCALE   = LibNotcursesCore.NCOPTION_INHIBIT_SETLOCALE
    NO_CLEAR_BITMAPS    = LibNotcursesCore.NCOPTION_NO_CLEAR_BITMAPS
    NO_WINCH_SIGHANDLER = LibNotcursesCore.NCOPTION_NO_WINCH_SIGHANDLER
    NO_QUIT_SIGHANDLERS = LibNotcursesCore.NCOPTION_NO_QUIT_SIGHANDLERS
    PRESERVE_CURSOR     = LibNotcursesCore.NCOPTION_PRESERVE_CURSOR
    SUPPRESS_BANNERS    = LibNotcursesCore.NCOPTION_SUPPRESS_BANNERS
    NO_ALTERNATE_SCREEN = LibNotcursesCore.NCOPTION_NO_ALTERNATE_SCREEN
    NO_FONT_CHANGES     = LibNotcursesCore.NCOPTION_NO_FONT_CHANGES
    DRAIN_INPUT         = LibNotcursesCore.NCOPTION_DRAIN_INPUT
end
end

Base.@kwdef struct NotCursesOptions
    termtype::String = ""
    loglevel::LogLevel._LogLevel = LogLevel.PANIC
    margin_t::Cuint = 0
    margin_r::Cuint = 0
    margin_b::Cuint = 0
    margin_l::Cuint = 0
    flags::UInt64 = 0
end

function Base.cconvert(::Type{Ptr{notcurses_options}}, opt::NotCursesOptions)
    Ref(notcurses_options(
        isempty(opt.termtype) ? C_NULL : pointer(opt.termtype),
        ncloglevel_e(Int(opt.loglevel)),
        opt.margin_t,
        opt.margin_r,
        opt.margin_b,
        opt.margin_l,
        opt.flags,
    ))
end

mutable struct NotCurses
    opts::NotCursesOptions
    nc_ptr::Ptr{notcurses}
    NotCurses(opts::NotCursesOptions=NotCursesOptions()) = _NotCurses(nothing, opts)
    NotCurses(file::IOStream, opts::NotCursesOptions=NotCursesOptions()) = _NotCurses(file, opts)
    function _NotCurses(file::Union{IOStream, Nothing}, opts::NotCursesOptions)
        nc_ptr = withenv("TERMINFO" => joinpath(Ncurses_jll.artifact_dir, "share", "terminfo")) do
            if file === nothing
                notcurses_core_init(opts, C_NULL) # TODO, allow passing a FD
            else
                notcurses_core_init(opts, Base.Libc.FILE(file))
            end
        end                
        nc_ptr == C_NULL && throw_nc("failed to initialize notcurses")
        nc = new(opts, nc_ptr)
        finalizer(nc) do nc
            close(nc)
        end
        return nc
    end
end

Base.close(nc::NotCurses) = (notcurses_stop(nc.nc_ptr); nc.nc_ptr = C_NULL; nothing)
Base.cconvert(::Type{Ptr{notcurses}}, nc::NotCurses) = nc.nc_ptr

render(nc::NotCurses) = notcurses_render(nc)
stdplane(nc::NotCurses) = Ncplane(notcurses_stdplane(nc.nc_ptr))
cursor_enable(nc::NotCurses, y::Integer, x::Integer) = notcurses_cursor_enable(nc, y, x)
cursor_disable(nc::NotCurses, y::Integer, x::Integer) = notcurses_cursor_disable(nc, y, x)
mice_enable(nc::NotCurses) = notcurses_mice_enable(nc, 0)

##########
# Direct #
##########

mutable struct NcDirect
    nc_ptr::Ptr{ncdirect}
    NcDirect() = _NcDirect(nothing)
    NcDirect(file::IOStream) = _NcDirect(file)
    function _NcDirect(file::Union{IOStream, Nothing})
        nc_ptr = withenv("TERMINFO" => joinpath(Ncurses_jll.artifact_dir, "share", "terminfo")) do
            if file === nothing
                ncdirect_core_init(C_NULL, C_NULL, 0)
            else
                ncdirect_core_init(C_NULL, Base.Libc.FILE(file), 0)
            end
        end
        nc_ptr == C_NULL && throw_nc("failed to initialize ncdirect")
        nc_direct = new(nc_ptr)
        finalizer(nc_direct) do nc_direct
            close(nc_direct)
        end
        return nc_direct
    end
end
Base.cconvert(::Type{Ptr{ncdirect}}, nc_direct::NcDirect) = nc_direct.nc_ptr
Base.close(nc_direct::NcDirect) = (ncdirect_stop(nc_direct.nc_ptr); nc_direct.nc_ptr = C_NULL; nothing)

cursor_enable(nc_direct::NcDirect) = ncdirect_cursor_enable(nc_direct)
cursor_disable(nc_direct::NcDirect) = ncdirect_cursor_disable(nc_direct)

set_fg(nc_direct::NcDirect, v::Integer) = ncdirect_set_fg_rgb(nc_direct, v)


include("input.jl")


###################
# Fullscreen mode #
###################


module Align
using ..CEnum, ..LibNotcursesCore
@cenum _Align::UInt32 begin
    UNALIGNED = LibNotcursesCore.NCALIGN_UNALIGNED |> Int
    LEFT      = LibNotcursesCore.NCALIGN_LEFT      |> Int
    CENTER    = LibNotcursesCore.NCALIGN_CENTER    |> Int
    RIGHT     = LibNotcursesCore.NCALIGN_RIGHT     |> Int
    TOP       = LibNotcursesCore.NCALIGN_LEFT      |> Int
    BOTTOM    = LibNotcursesCore.NCALIGN_RIGHT     |> Int
end
Base.cconvert(::Type{ncalign_e}, v::_Align) = ncalign_e(Int(v))
end

Base.@kwdef struct NcplaneOptions
    y::Int = 0
    x::Int = 0
    rows::Int = 0
    cols::Int = 0
    userptr::Ptr{Cvoid} = C_NULL
    name::Ptr{Cchar} = C_NULL # ?
    resizecb::Ptr{Cvoid} = C_NULL
    flags::UInt64 = 0
    margin_b::Cuint = 0
    margin_r::Cuint = 0
end
Base.cconvert(::Type{Ptr{ncplane_options}}, opts::NcplaneOptions) = 
    Ref(ncplane_options(opts.y, opts.x, opts.rows, opts.cols, opts.userptr, opts.name, opts.resizecb, opts.flags, opts.margin_b, opts.margin_r))

# Ncplane
struct Ncplane
    plane_ptr::Ptr{ncplane}
end
Base.cconvert(::Type{Ptr{ncplane}}, nc::Ncplane) = nc.plane_ptr


Ncplane(nc::Ncplane; kwargs...) = Ncplane(nc, NcplaneOptions(;kwargs...))
Ncplane(nc::Ncplane, opts::NcplaneOptions) = Ncplane(ncplane_create(nc, opts))


putstr(n::Ncplane, str::Union{AbstractChar, AbstractString}) = ncplane_putstr(n.plane_ptr, string(str))
putstr_yx(n::Ncplane, y::Integer, x::Integer, str::Union{AbstractChar, AbstractString}) = ncplane_putstr_yx(n.plane_ptr, y, x, string(str))

set_bg_rgb8_clipped(n::Ncplane, r::Integer, g::Integer, b::Integer) = ncplane_set_bg_rgb8_clipped(n.plane_ptr, r, g, b)
set_fg_rgb8_clipped(n::Ncplane, r::Integer, g::Integer, b::Integer) = ncplane_set_fg_rgb8_clipped(n.plane_ptr, r, g, b)

set_bg_rgb8(n::Ncplane, r::Integer, g::Integer, b::Integer) = ncplane_set_bg_rgb8(n.plane_ptr, r, g, b)
set_fg_rgb8(n::Ncplane, r::Integer, g::Integer, b::Integer) = ncplane_set_fg_rgb8(n.plane_ptr, r, g, b)
set_scrolling(n::Ncplane, v::Bool) = ncplane_set_scrolling(n, v)
putstr_aligned(n::Ncplane, y::Integer, align, str::AbstractString) = ncplane_putstr_aligned(n, y, align, str)
function puttext(n::Ncplane, y::Integer, align::Align._Align, text::AbstractString) 
    bytes = Ref{Csize_t}()
    i = ncplane_puttext(n, y, align, text, bytes)
    return bytes[]
end

function dim(n::Ncplane)
    y, x = Ref{Cuint}(), Ref{Cuint}()
    ncplane_dim_yx(n, y, x)
    return (;y=y[], x=x[])
end

erase(n::Ncplane) = ncplane_erase(n)


end #module
