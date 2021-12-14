using Printf

module Key
using ..CEnum, ..LibNotcursesCore
@cenum _Key::UInt begin
INVALID      = LibNotcursesCore.NCKEY_INVALID
RESIZE       = LibNotcursesCore.NCKEY_RESIZE     # we received SIGWINCH
UP           = LibNotcursesCore.NCKEY_UP
RIGHT        = LibNotcursesCore.NCKEY_RIGHT
DOWN         = LibNotcursesCore.NCKEY_DOWN
LEFT         = LibNotcursesCore.NCKEY_LEFT
INS          = LibNotcursesCore.NCKEY_INS
DEL          = LibNotcursesCore.NCKEY_DEL
BACKSPACE    = LibNotcursesCore.NCKEY_BACKSPACE  # backspace (sometimes)
PGDOWN       = LibNotcursesCore.NCKEY_PGDOWN
PGUP         = LibNotcursesCore.NCKEY_PGUP
HOME         = LibNotcursesCore.NCKEY_HOME
END          = LibNotcursesCore.NCKEY_END
F00          = LibNotcursesCore.NCKEY_F00
F01          = LibNotcursesCore.NCKEY_F01
F02          = LibNotcursesCore.NCKEY_F02
F03          = LibNotcursesCore.NCKEY_F03
F04          = LibNotcursesCore.NCKEY_F04
F05          = LibNotcursesCore.NCKEY_F05
F06          = LibNotcursesCore.NCKEY_F06
F07          = LibNotcursesCore.NCKEY_F07
F08          = LibNotcursesCore.NCKEY_F08
F09          = LibNotcursesCore.NCKEY_F09
F10          = LibNotcursesCore.NCKEY_F10
F11          = LibNotcursesCore.NCKEY_F11
F12          = LibNotcursesCore.NCKEY_F12
F13          = LibNotcursesCore.NCKEY_F13
F14          = LibNotcursesCore.NCKEY_F14
F15          = LibNotcursesCore.NCKEY_F15
F16          = LibNotcursesCore.NCKEY_F16
F17          = LibNotcursesCore.NCKEY_F17
F18          = LibNotcursesCore.NCKEY_F18
F19          = LibNotcursesCore.NCKEY_F19
F20          = LibNotcursesCore.NCKEY_F20
F21          = LibNotcursesCore.NCKEY_F21
F22          = LibNotcursesCore.NCKEY_F22
F23          = LibNotcursesCore.NCKEY_F23
F24          = LibNotcursesCore.NCKEY_F24
F25          = LibNotcursesCore.NCKEY_F25
F26          = LibNotcursesCore.NCKEY_F26
F27          = LibNotcursesCore.NCKEY_F27
F28          = LibNotcursesCore.NCKEY_F28
F29          = LibNotcursesCore.NCKEY_F29
F30          = LibNotcursesCore.NCKEY_F30
F31          = LibNotcursesCore.NCKEY_F31
F32          = LibNotcursesCore.NCKEY_F32
F33          = LibNotcursesCore.NCKEY_F33
F34          = LibNotcursesCore.NCKEY_F34
F35          = LibNotcursesCore.NCKEY_F35
F36          = LibNotcursesCore.NCKEY_F36
F37          = LibNotcursesCore.NCKEY_F37
F38          = LibNotcursesCore.NCKEY_F38
F39          = LibNotcursesCore.NCKEY_F39
F40          = LibNotcursesCore.NCKEY_F40
F41          = LibNotcursesCore.NCKEY_F41
F42          = LibNotcursesCore.NCKEY_F42
F43          = LibNotcursesCore.NCKEY_F43
F44          = LibNotcursesCore.NCKEY_F44
F45          = LibNotcursesCore.NCKEY_F45
F46          = LibNotcursesCore.NCKEY_F46
F47          = LibNotcursesCore.NCKEY_F47
F48          = LibNotcursesCore.NCKEY_F48
F49          = LibNotcursesCore.NCKEY_F49
F50          = LibNotcursesCore.NCKEY_F50
F51          = LibNotcursesCore.NCKEY_F51
F52          = LibNotcursesCore.NCKEY_F52
F53          = LibNotcursesCore.NCKEY_F53
F54          = LibNotcursesCore.NCKEY_F54
F55          = LibNotcursesCore.NCKEY_F55
F56          = LibNotcursesCore.NCKEY_F56
F57          = LibNotcursesCore.NCKEY_F57
F58          = LibNotcursesCore.NCKEY_F58
F59          = LibNotcursesCore.NCKEY_F59
F60          = LibNotcursesCore.NCKEY_F60
# ... leave room for up to 100 function keys, egads
ENTER        = LibNotcursesCore.NCKEY_ENTER
CLS          = LibNotcursesCore.NCKEY_CLS        # "clear-screen or erase"
DLEFT        = LibNotcursesCore.NCKEY_DLEFT      # down + left on keypad
DRIGHT       = LibNotcursesCore.NCKEY_DRIGHT
ULEFT        = LibNotcursesCore.NCKEY_ULEFT      # up + left on keypad
URIGHT       = LibNotcursesCore.NCKEY_URIGHT
CENTER       = LibNotcursesCore.NCKEY_CENTER     # the most truly neutral of keypresses
BEGIN        = LibNotcursesCore.NCKEY_BEGIN
CANCEL       = LibNotcursesCore.NCKEY_CANCEL
CLOSE        = LibNotcursesCore.NCKEY_CLOSE
COMMAND      = LibNotcursesCore.NCKEY_COMMAND
COPY         = LibNotcursesCore.NCKEY_COPY
EXIT         = LibNotcursesCore.NCKEY_EXIT
PRINT        = LibNotcursesCore.NCKEY_PRINT
REFRESH      = LibNotcursesCore.NCKEY_REFRESH
SEPARATOR    = LibNotcursesCore.NCKEY_SEPARATOR
#            = LibNotcursesCore.NCKEY_# these keys aren't generally available outside of the kitty protocol
CAPS_LOCK    = LibNotcursesCore.NCKEY_CAPS_LOCK
SCROLL_LOCK  = LibNotcursesCore.NCKEY_SCROLL_LOCK
NUM_LOCK     = LibNotcursesCore.NCKEY_NUM_LOCK
PRINT_SCREEN = LibNotcursesCore.NCKEY_PRINT_SCREEN
PAUSE        = LibNotcursesCore.NCKEY_PAUSE
MENU         = LibNotcursesCore.NCKEY_MENU
#            = LibNotcursesCore.NCKEY_# media keys, similarly only available through kitty's protocol
MEDIA_PLAY   = LibNotcursesCore.NCKEY_MEDIA_PLAY
MEDIA_PAUSE  = LibNotcursesCore.NCKEY_MEDIA_PAUSE
MEDIA_PPAUSE = LibNotcursesCore.NCKEY_MEDIA_PPAUSE
MEDIA_REV    = LibNotcursesCore.NCKEY_MEDIA_REV
MEDIA_STOP   = LibNotcursesCore.NCKEY_MEDIA_STOP
MEDIA_FF     = LibNotcursesCore.NCKEY_MEDIA_FF
MEDIA_REWIND = LibNotcursesCore.NCKEY_MEDIA_REWIND
MEDIA_NEXT   = LibNotcursesCore.NCKEY_MEDIA_NEXT
MEDIA_PREV   = LibNotcursesCore.NCKEY_MEDIA_PREV
MEDIA_RECORD = LibNotcursesCore.NCKEY_MEDIA_RECORD
MEDIA_LVOL   = LibNotcursesCore.NCKEY_MEDIA_LVOL
MEDIA_RVOL   = LibNotcursesCore.NCKEY_MEDIA_RVOL
MEDIA_MUTE   = LibNotcursesCore.NCKEY_MEDIA_MUTE
# modifiers when pressed by themselves. this ordering comes from the Kitty
# keyboard protocol, and mustn't be changed without updating handlers.
LSHIFT       = LibNotcursesCore.NCKEY_LSHIFT
LCTRL        = LibNotcursesCore.NCKEY_LCTRL
LALT         = LibNotcursesCore.NCKEY_LALT
LSUPER       = LibNotcursesCore.NCKEY_LSUPER
LHYPER       = LibNotcursesCore.NCKEY_LHYPER
LMETA        = LibNotcursesCore.NCKEY_LMETA
RSHIFT       = LibNotcursesCore.NCKEY_RSHIFT
RCTRL        = LibNotcursesCore.NCKEY_RCTRL
RALT         = LibNotcursesCore.NCKEY_RALT
RSUPER       = LibNotcursesCore.NCKEY_RSUPER
RHYPER       = LibNotcursesCore.NCKEY_RHYPER
RMETA        = LibNotcursesCore.NCKEY_RMETA
L3SHIFT      = LibNotcursesCore.NCKEY_L3SHIFT
L5SHIFT      = LibNotcursesCore.NCKEY_L5SHIFT
# mouse events. We encode which button was pressed into the char32_t,
# but position information is embedded in the larger ncinput event.
MOTION       = LibNotcursesCore.NCKEY_MOTION     # no buttons pressed
BUTTON1      = LibNotcursesCore.NCKEY_BUTTON1
BUTTON2      = LibNotcursesCore.NCKEY_BUTTON2
BUTTON3      = LibNotcursesCore.NCKEY_BUTTON3
BUTTON4      = LibNotcursesCore.NCKEY_BUTTON4    # scrollwheel up
BUTTON5      = LibNotcursesCore.NCKEY_BUTTON5    # scrollwheel down
BUTTON6      = LibNotcursesCore.NCKEY_BUTTON6
BUTTON7      = LibNotcursesCore.NCKEY_BUTTON7
BUTTON8      = LibNotcursesCore.NCKEY_BUTTON8
BUTTON9      = LibNotcursesCore.NCKEY_BUTTON9
BUTTON10     = LibNotcursesCore.NCKEY_BUTTON10
BUTTON11     = LibNotcursesCore.NCKEY_BUTTON11

# we received SIGCONT
SIGNAL       = LibNotcursesCore.NCKEY_SIGNAL

EOF          = LibNotcursesCore.NCKEY_EOF

SCROLL_UP    = LibNotcursesCore.NCKEY_BUTTON4
SCROLL_DOWN  = LibNotcursesCore.NCKEY_BUTTON5
RETURN       = LibNotcursesCore.NCKEY_ENTER

# Just aliases, ma'am, from the 128 characters common to ASCII+UTF8
TAB          = 0x09
ESC          = 0x1b
SPACE        = 0x2
end
end


function get_blocking(n::Union{NcDirect, NotCurses})
    ni_ref = Ref{ncinput}()
    v = if n isa NcDirect
        ncdirect_get_blocking(n, ni_ref)
    else
        notcurses_get_blocking(n, ni_ref)
    end
    v == 0 && return nothing
    if v == -1
        throw_nc("error in `ncdirect_get_blocking`")
    end
    ni = ni_ref[]
    v = nckey_synthesized_p(v) ? Key._Key(v) : Char(v)
    return v, ni
end
