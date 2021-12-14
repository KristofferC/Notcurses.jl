using Notcurses

nc = NotCurses()

plane = Notcurses.stdplane(nc)

sub_plane_left = Notcurses.Ncplane(
    plane;
    rows=5,
    cols=5,
)

sub_plane_right = Notcurses.Ncplane(
    plane;
    x=(Notcurses.dim(plane).x ÷ 2),
    rows=5,
    cols=5,
)

Notcurses.set_fg_rgb8(sub_plane_left, 0, 255, 0)
Notcurses.putstr(sub_plane_left, "Left")

Notcurses.set_fg_rgb8(sub_plane_right, 255, 0, 0)
Notcurses.putstr(sub_plane_right, "Right")

Notcurses.render(nc)

sleep(3)
