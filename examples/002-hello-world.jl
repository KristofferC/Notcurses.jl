using Notcurses

nc = NotCurses()

plane = stdplane(nc)
putstr(plane, "Hello, World!")

render(nc)

sleep(3)
