using Notcurses

nc = NotCurses()

plane = stdplane(nc)
#putstr(stdplane, "Hello, World!")

render(nc)

sleep(3)
