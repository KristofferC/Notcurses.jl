using Notcurses

nc = NotCurses()

plane = Notcurses.stdplane(nc)
Notcurses.putstr(plane, "Hello, World!")

Notcurses.render(nc)

sleep(3)
