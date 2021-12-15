# Notcurses

CLI mode :  Yes! Use the flags `NCOPTION_NO_ALTERNATE_SCREEN`,
   `NCOPTION_NO_CLEAR_BITMAPS`, and `NCOPTION_PRESERVE_CURSOR`,
   and call `ncplane_set_scrolling()` on the standard plane. You
   still must explicitly render.