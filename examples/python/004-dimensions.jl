using Notcurses

function main()
    nc = NotCurses()

    plane = Notcurses.stdplane(nc)

    red = 0x80
    green = 0x80
    blue = 0x80

    y_dimension, x_dimension = Notcurses.dim(plane)

    for y in 1:y_dimension
        for x in 1:x_dimension
            Notcurses.set_fg_rgb8(plane, red, green, blue)
            Notcurses.set_bg_rgb8(plane, blue, red, green)
            Notcurses.putstr_yx(plane, y, x, 'X')
            blue += 2
            if blue == 256
                blue = 0
                green += 2
                if green == 256
                    green = 0
                    red = (red + 2) % 256
                end
            end
        end
    end
    Notcurses.render(nc)
    close(nc)
end

main()
sleep(3)