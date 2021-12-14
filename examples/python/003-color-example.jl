using Notcurses

nc = NotCurses()

plane = Notcurses.stdplane(nc)

Notcurses.set_bg_rgb8_clipped(plane, 0, 0, 255)
Notcurses.set_fg_rgb8_clipped(plane, 255, 0, 0)
Notcurses.putstr_yx(plane, 0, 0, "Red on blue")

Notcurses.set_bg_rgb8(plane, 0, 255, 0)
Notcurses.set_fg_rgb8(plane, 255, 255, 255)
Notcurses.putstr_yx(plane, 1, 0, "White on green")

Notcurses.set_bg_rgb8(plane, 0, 0, 0)
Notcurses.set_fg_rgb8(plane, 255, 0, 255)
Notcurses.putstr_yx(plane, 2, 0, "Purple on black")

Notcurses.render(nc)

sleep(3)
