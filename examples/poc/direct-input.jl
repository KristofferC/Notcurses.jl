using Notcurses
using Printf

function main()
    n = Notcurses.NcDirect()
    while true
        v, ni = Notcurses.get_blocking(n)
        @printf("Read input: [%c%c%c] %s\n", ni.ctrl ? 'C' : 'c',
                ni.alt ? 'A' : 'a', ni.shift ? 'S' : 's', v)
        if ni.ctrl && v == 'D'
            break
        end
    end
end

main()