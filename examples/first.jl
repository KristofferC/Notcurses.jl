using Notcurses

nc_direct = NcDirect()
cursor_disable(nc_direct)
set_fg(nc_direct, 0xFF0000)
print("Hello")
cursor_enable(nc_direct)
