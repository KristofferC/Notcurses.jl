using Libdl

function __init__()
    global libnotcurses_handle = dlopen("/home/kc/Applications/notcurses-3.0/notcurses-3.0/build/libnotcurses.so")
end

const libnotcurses = "libnotcurses.so"