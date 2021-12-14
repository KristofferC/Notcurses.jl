module Notcurses

export NcDirect

export cursor_enable, cursor_disable, set_fg

using Libdl

include("../lib/LibNotcurses.jl")

version() = unsafe_string(LibNotcurses.notcurses_version())



##########
# Direct #
##########

mutable struct NcDirect
    nc::Ptr{LibNotcurses.ncdirect}
    function NcDirect()
        nc = Notcurses.LibNotcurses.ncdirect_init(C_NULL, C_NULL, 0)
        nc_direct = new(nc)
        finalizer(nc_direct) do nc_direct
            LibNotcurses.ncdirect_stop(nc_direct.nc)
        end
        return nc_direct
    end
end
Base.cconvert(::Type{Ptr{LibNotcurses.ncdirect}}, nc_direct::NcDirect) = nc_direct.nc

cursor_enable(nc_direct::NcDirect) = LibNotcurses.ncdirect_cursor_enable(nc_direct)
cursor_disable(nc_direct::NcDirect) = LibNotcurses.ncdirect_cursor_disable(nc_direct)

set_fg(nc_direct::NcDirect, v::Integer) = LibNotcurses.ncdirect_set_fg_rgb(nc_direct, v)

end #module
