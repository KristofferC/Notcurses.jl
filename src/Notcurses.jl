module Notcurses

using Libdl

include("../lib/LibNotcurses.jl")

version() = unsafe_string(LibNotcurses.notcurses_version())


struct Notcurses
    nc::LibNotcurses.notcurses
    function Notcurses()
        nc = Notcurses.LibNotcurses.notcurses_init(C_NULL, C_NULL)
        n = Notcurses(nc)
        finalizer(() -> LibNotcurses.notcurses_stop(n.nc), n)
    end
end

render() = 

    def __init__(self):
        opts = ffi.new("notcurses_options *")
        opts.flags = lib.NCOPTION_NO_ALTERNATE_SCREEN
        self.nc = lib.notcurses_init(opts, sys.stdout)
        if not self.nc:
            raise NotcursesError("Error initializing notcurses")
        self.stdncplane = Ncplane(lib.notcurses_stdplane(self.nc))

    def __del__(self):
        lib.notcurses_stop(self.nc)

    def render(self):
        return lib.notcurses_render(self.nc)

    def stdplane(self):
        return self.stdncplane



end #module
