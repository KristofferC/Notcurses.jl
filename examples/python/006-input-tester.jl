
using Notcurses
using Printf

nc = NotCurses()

plane = Notcurses.stdplane(nc)
Notcurses.putstr(plane, "Enter string!")

Notcurses.render(nc)
Notcurses.cursor_enable(nc, 0, 0)
Notcurses.mice_enable(nc)

while true
    # Get an input event and print its properties
    v, ni = Notcurses.get_blocking(nc)

    Notcurses.erase(plane)
    Notcurses.putstr_yx(plane, 0, 0, "Code point: $v", )
    Notcurses.putstr_yx(plane, 1, 0, "Y pos: $(ni.x)")
    Notcurses.putstr_yx(plane, 2, 0, "X pos: $(ni.y)")
    Notcurses.putstr_yx(plane, 3, 0, "Is alt: $(ni.alt)")
    Notcurses.putstr_yx(plane, 4, 0, "Is shift: $(ni.shift)")
    Notcurses.putstr_yx(plane, 5, 0, "Is ctrl: $(ni.ctrl)")
    Notcurses.putstr_yx(plane, 7, 0, "Press CTRL+C to exit.")

    Notcurses.render(nc)
end