module Notcurses

export Ncplane, putstr
export NotCurses
export NcDirect

export cursor_enable, cursor_disable, set_fg

using Libdl

include("../lib/LibNotcurses.jl")

version() = unsafe_string(LibNotcurses.notcurses_version())

#############
# Exception #
#############
struct NotCursesException
    str::String
end
Base.showerror(io::IO, nce::NotCursesException) = print(io, nce.str)

throw_nc(str) = throw(NotCursesException(str))

###################
# Fullscreen mode #
###################

# Ncplane
struct Ncplane
    plane_ptr::Ptr{LibNotcurses.ncplane}
end
Base.cconvert(::Type{Ptr{LibNotcurses.ncplane}}, nc::Ncplane) = nc.plane_ptr

putstr(n::Ncplane, str::AbstractString) = LibNotcurses.ncplane_putstr(n.plane_ptr, str)
putstr_yx(n::Ncplane, y::Integer, x::Integer, str::AbstractString) = LibNotcurses.ncplane_putstr_yx(n.plane_ptr, y, x, str)

set_bg_rgb8_clipped(n::Ncplane, r::Integer, g::Integer, b::Integer) = LibNotcurses.ncplane_set_bg_rgb8_clipped(n.plane_ptr, r, g, b)
set_fg_rgb8_clipped(n::Ncplane, r::Integer, g::Integer, b::Integer) = LibNotcurses.ncplane_set_fg_rgb8_clipped(n.plane_ptr, r, g, b)

set_bg_rgb8(n::Ncplane, r::Integer, g::Integer, b::Integer) = LibNotcurses.ncplane_set_bg_rgb8(n.plane_ptr, r, g, b)
set_fg_rgb8(n::Ncplane, r::Integer, g::Integer, b::Integer) = LibNotcurses.ncplane_set_fg_rgb8(n.plane_ptr, r, g, b)


LibNotcurses.notcurses_options() = 
    LibNotcurses.notcurses_options(C_NULL, LibNotcurses.NCLOGLEVEL_PANIC, 0, 0, 0, 0, 0)

mutable struct NotCurses
    opts::LibNotcurses.notcurses_options
    nc_ptr::Ptr{LibNotcurses.notcurses}
    # TODO Make a julia version of the option
    function NotCurses(opts::LibNotcurses.notcurses_options = LibNotcurses.notcurses_options())
        nc_ptr = Notcurses.LibNotcurses.notcurses_init(Ref(opts), C_NULL) # TODO, allow passing a FD
        nc_ptr == C_NULL && throw_nc("failed to initialize notcurses")
        nc = new(opts, nc_ptr)
        finalizer(nc) do nc
            LibNotcurses.notcurses_stop(nc.nc_ptr)
        end
        return nc
    end
end
Base.cconvert(::Type{Ptr{LibNotcurses.notcurses}}, nc::NotCurses) = nc.nc_ptr


render(nc::NotCurses) = LibNotcurses.notcurses_render(nc)
stdplane(nc::NotCurses) = Ncplane(LibNotcurses.notcurses_stdplane(nc.nc_ptr))


##########
# Direct #
##########

mutable struct NcDirect
    nc_ptr::Ptr{LibNotcurses.ncdirect}
    function NcDirect()
        # TODO: allow passing a FD
        nc_ptr = Notcurses.LibNotcurses.ncdirect_init(C_NULL, C_NULL, 0)
        nc_ptr == C_NULL && throw_nc("failed to initialize ncdirect")
        nc_direct = new(nc_ptr)
        finalizer(nc_direct) do nc_direct
            LibNotcurses.ncdirect_stop(nc_direct.nc_ptr)
        end
        return nc_direct
    end
end
Base.cconvert(::Type{Ptr{LibNotcurses.ncdirect}}, nc_direct::NcDirect) = nc_direct.nc_ptr

cursor_enable(nc_direct::NcDirect) = LibNotcurses.ncdirect_cursor_enable(nc_direct)
cursor_disable(nc_direct::NcDirect) = LibNotcurses.ncdirect_cursor_disable(nc_direct)

set_fg(nc_direct::NcDirect, v::Integer) = LibNotcurses.ncdirect_set_fg_rgb(nc_direct, v)

end #module
