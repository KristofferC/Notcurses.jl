module LibNotcurses

using CEnum

using Libdl

function __init__()
    global libnotcurses_handle = dlopen("/home/kc/Applications/notcurses-3.0/notcurses-3.0/build/libnotcurses.so")
end

const libnotcurses = "/home/kc/Applications/notcurses-3.0/notcurses-3.0/build/libnotcurses.so"

const uintmax_t = Culong

function ncstrwidth(egcs, validbytes, validwidth)
    @ccall libnotcurses.ncstrwidth(egcs::Ptr{Cchar}, validbytes::Ptr{Cint}, validwidth::Ptr{Cint})::Cint
end

function nckey_synthesized_p(w)
    @ccall libnotcurses.nckey_synthesized_p(w::UInt32)::Bool
end

function nckey_pua_p(w)
    @ccall libnotcurses.nckey_pua_p(w::UInt32)::Bool
end

function nckey_supppuaa_p(w)
    @ccall libnotcurses.nckey_supppuaa_p(w::UInt32)::Bool
end

function nckey_supppuab_p(w)
    @ccall libnotcurses.nckey_supppuab_p(w::UInt32)::Bool
end

function notcurses_version()
    @ccall libnotcurses.notcurses_version()::Ptr{Cchar}
end

function notcurses_version_components(major, minor, patch, tweak)
    @ccall libnotcurses.notcurses_version_components(major::Ptr{Cint}, minor::Ptr{Cint}, patch::Ptr{Cint}, tweak::Ptr{Cint})::Cvoid
end

mutable struct notcurses end

mutable struct ncvisual end

mutable struct ncuplot end

mutable struct ncdplot end

mutable struct ncprogbar end

mutable struct ncfdplane end

mutable struct ncsubproc end

mutable struct ncselector end

mutable struct ncmultiselector end

mutable struct ncreader end

mutable struct ncfadectx end

mutable struct nctablet end

mutable struct ncreel end

mutable struct nctab end

mutable struct nctabbed end

mutable struct ncdirect end

@cenum ncblitter_e::UInt32 begin
    NCBLIT_DEFAULT = 0
    NCBLIT_1x1 = 1
    NCBLIT_2x1 = 2
    NCBLIT_2x2 = 3
    NCBLIT_3x2 = 4
    NCBLIT_BRAILLE = 5
    NCBLIT_PIXEL = 6
    NCBLIT_4x1 = 7
    NCBLIT_8x1 = 8
end

@cenum ncalign_e::UInt32 begin
    NCALIGN_UNALIGNED = 0
    NCALIGN_LEFT = 1
    NCALIGN_CENTER = 2
    NCALIGN_RIGHT = 3
end

@cenum ncscale_e::UInt32 begin
    NCSCALE_NONE = 0
    NCSCALE_SCALE = 1
    NCSCALE_STRETCH = 2
    NCSCALE_NONE_HIRES = 3
    NCSCALE_SCALE_HIRES = 4
end

function ncchannel_alpha(channel)
    @ccall libnotcurses.ncchannel_alpha(channel::UInt32)::Cuint
end

function ncchannel_set_alpha(channel, alpha)
    @ccall libnotcurses.ncchannel_set_alpha(channel::Ptr{UInt32}, alpha::Cuint)::Cint
end

function ncchannel_default_p(channel)
    @ccall libnotcurses.ncchannel_default_p(channel::UInt32)::Bool
end

function ncchannel_set_default(channel)
    @ccall libnotcurses.ncchannel_set_default(channel::Ptr{UInt32})::UInt32
end

function ncchannel_palindex_p(channel)
    @ccall libnotcurses.ncchannel_palindex_p(channel::UInt32)::Bool
end

function ncchannel_palindex(channel)
    @ccall libnotcurses.ncchannel_palindex(channel::UInt32)::Cuint
end

function ncchannel_set_palindex(channel, idx)
    @ccall libnotcurses.ncchannel_set_palindex(channel::Ptr{UInt32}, idx::Cint)::Cint
end

function ncchannel_rgb_p(channel)
    @ccall libnotcurses.ncchannel_rgb_p(channel::UInt32)::Bool
end

function ncchannel_r(channel)
    @ccall libnotcurses.ncchannel_r(channel::UInt32)::Cuint
end

function ncchannel_g(channel)
    @ccall libnotcurses.ncchannel_g(channel::UInt32)::Cuint
end

function ncchannel_b(channel)
    @ccall libnotcurses.ncchannel_b(channel::UInt32)::Cuint
end

function ncchannel_rgb8(channel, r, g, b)
    @ccall libnotcurses.ncchannel_rgb8(channel::UInt32, r::Ptr{Cuint}, g::Ptr{Cuint}, b::Ptr{Cuint})::Cuint
end

function ncchannel_set_rgb8(channel, r, g, b)
    @ccall libnotcurses.ncchannel_set_rgb8(channel::Ptr{UInt32}, r::Cuint, g::Cuint, b::Cuint)::Cint
end

function ncchannel_set(channel, rgb)
    @ccall libnotcurses.ncchannel_set(channel::Ptr{UInt32}, rgb::UInt32)::Cint
end

function ncchannel_set_rgb8_clipped(channel, r, g, b)
    @ccall libnotcurses.ncchannel_set_rgb8_clipped(channel::Ptr{UInt32}, r::Cint, g::Cint, b::Cint)::Cvoid
end

function ncchannels_bchannel(channels)
    @ccall libnotcurses.ncchannels_bchannel(channels::UInt64)::UInt32
end

function ncchannels_fchannel(channels)
    @ccall libnotcurses.ncchannels_fchannel(channels::UInt64)::UInt32
end

function ncchannels_bg_rgb_p(channels)
    @ccall libnotcurses.ncchannels_bg_rgb_p(channels::UInt64)::Bool
end

function ncchannels_fg_rgb_p(channels)
    @ccall libnotcurses.ncchannels_fg_rgb_p(channels::UInt64)::Bool
end

function ncchannels_bg_alpha(channels)
    @ccall libnotcurses.ncchannels_bg_alpha(channels::UInt64)::Cuint
end

function ncchannels_set_bchannel(channels, channel)
    @ccall libnotcurses.ncchannels_set_bchannel(channels::Ptr{UInt64}, channel::UInt32)::UInt64
end

function ncchannels_set_fchannel(channels, channel)
    @ccall libnotcurses.ncchannels_set_fchannel(channels::Ptr{UInt64}, channel::UInt32)::UInt64
end

function ncchannels_set_bg_alpha(channels, alpha)
    @ccall libnotcurses.ncchannels_set_bg_alpha(channels::Ptr{UInt64}, alpha::Cuint)::Cint
end

function ncchannels_fg_alpha(channels)
    @ccall libnotcurses.ncchannels_fg_alpha(channels::UInt64)::Cuint
end

function ncchannels_set_fg_alpha(channels, alpha)
    @ccall libnotcurses.ncchannels_set_fg_alpha(channels::Ptr{UInt64}, alpha::Cuint)::Cint
end

function ncchannels_reverse(channels)
    @ccall libnotcurses.ncchannels_reverse(channels::UInt64)::UInt64
end

function ncchannels_combine(fchan, bchan)
    @ccall libnotcurses.ncchannels_combine(fchan::UInt32, bchan::UInt32)::UInt64
end

function ncchannels_fg_palindex(channels)
    @ccall libnotcurses.ncchannels_fg_palindex(channels::UInt64)::Cuint
end

function ncchannels_bg_palindex(channels)
    @ccall libnotcurses.ncchannels_bg_palindex(channels::UInt64)::Cuint
end

function ncchannels_fg_rgb(channels)
    @ccall libnotcurses.ncchannels_fg_rgb(channels::UInt64)::UInt32
end

function ncchannels_bg_rgb(channels)
    @ccall libnotcurses.ncchannels_bg_rgb(channels::UInt64)::UInt32
end

function ncchannels_fg_rgb8(channels, r, g, b)
    @ccall libnotcurses.ncchannels_fg_rgb8(channels::UInt64, r::Ptr{Cuint}, g::Ptr{Cuint}, b::Ptr{Cuint})::UInt32
end

function ncchannels_bg_rgb8(channels, r, g, b)
    @ccall libnotcurses.ncchannels_bg_rgb8(channels::UInt64, r::Ptr{Cuint}, g::Ptr{Cuint}, b::Ptr{Cuint})::UInt32
end

function ncchannels_set_fg_rgb8(channels, r, g, b)
    @ccall libnotcurses.ncchannels_set_fg_rgb8(channels::Ptr{UInt64}, r::Cuint, g::Cuint, b::Cuint)::Cint
end

function ncchannels_set_fg_rgb8_clipped(channels, r, g, b)
    @ccall libnotcurses.ncchannels_set_fg_rgb8_clipped(channels::Ptr{UInt64}, r::Cint, g::Cint, b::Cint)::Cvoid
end

function ncchannels_set_fg_palindex(channels, idx)
    @ccall libnotcurses.ncchannels_set_fg_palindex(channels::Ptr{UInt64}, idx::Cint)::Cint
end

function ncchannels_set_fg_rgb(channels, rgb)
    @ccall libnotcurses.ncchannels_set_fg_rgb(channels::Ptr{UInt64}, rgb::Cuint)::Cint
end

function ncchannels_set_bg_rgb8(channels, r, g, b)
    @ccall libnotcurses.ncchannels_set_bg_rgb8(channels::Ptr{UInt64}, r::Cuint, g::Cuint, b::Cuint)::Cint
end

function ncchannels_set_bg_rgb8_clipped(channels, r, g, b)
    @ccall libnotcurses.ncchannels_set_bg_rgb8_clipped(channels::Ptr{UInt64}, r::Cint, g::Cint, b::Cint)::Cvoid
end

function ncchannels_set_bg_palindex(channels, idx)
    @ccall libnotcurses.ncchannels_set_bg_palindex(channels::Ptr{UInt64}, idx::Cint)::Cint
end

function ncchannels_set_bg_rgb(channels, rgb)
    @ccall libnotcurses.ncchannels_set_bg_rgb(channels::Ptr{UInt64}, rgb::Cuint)::Cint
end

function ncchannels_fg_default_p(channels)
    @ccall libnotcurses.ncchannels_fg_default_p(channels::UInt64)::Bool
end

function ncchannels_fg_palindex_p(channels)
    @ccall libnotcurses.ncchannels_fg_palindex_p(channels::UInt64)::Bool
end

function ncchannels_bg_default_p(channels)
    @ccall libnotcurses.ncchannels_bg_default_p(channels::UInt64)::Bool
end

function ncchannels_bg_palindex_p(channels)
    @ccall libnotcurses.ncchannels_bg_palindex_p(channels::UInt64)::Bool
end

function ncchannels_set_fg_default(channels)
    @ccall libnotcurses.ncchannels_set_fg_default(channels::Ptr{UInt64})::UInt64
end

function ncchannels_set_bg_default(channels)
    @ccall libnotcurses.ncchannels_set_bg_default(channels::Ptr{UInt64})::UInt64
end

function notcurses_ucs32_to_utf8(ucs32, ucs32count, resultbuf, buflen)
    @ccall libnotcurses.notcurses_ucs32_to_utf8(ucs32::Ptr{UInt32}, ucs32count::Cuint, resultbuf::Ptr{Cuchar}, buflen::Csize_t)::Cint
end

struct nccell
    gcluster::UInt32
    gcluster_backstop::UInt8
    width::UInt8
    stylemask::UInt16
    channels::UInt64
end

function nccell_init(c)
    @ccall libnotcurses.nccell_init(c::Ptr{nccell})::Cvoid
end

mutable struct ncplane end

function nccell_load(n, c, gcluster)
    @ccall libnotcurses.nccell_load(n::Ptr{ncplane}, c::Ptr{nccell}, gcluster::Ptr{Cchar})::Cint
end

function nccell_prime(n, c, gcluster, stylemask, channels)
    @ccall libnotcurses.nccell_prime(n::Ptr{ncplane}, c::Ptr{nccell}, gcluster::Ptr{Cchar}, stylemask::UInt16, channels::UInt64)::Cint
end

function nccell_duplicate(n, targ, c)
    @ccall libnotcurses.nccell_duplicate(n::Ptr{ncplane}, targ::Ptr{nccell}, c::Ptr{nccell})::Cint
end

function nccell_release(n, c)
    @ccall libnotcurses.nccell_release(n::Ptr{ncplane}, c::Ptr{nccell})::Cvoid
end

function nccell_set_styles(c, stylebits)
    @ccall libnotcurses.nccell_set_styles(c::Ptr{nccell}, stylebits::Cuint)::Cvoid
end

function nccell_styles(c)
    @ccall libnotcurses.nccell_styles(c::Ptr{nccell})::UInt16
end

function nccell_on_styles(c, stylebits)
    @ccall libnotcurses.nccell_on_styles(c::Ptr{nccell}, stylebits::Cuint)::Cvoid
end

function nccell_off_styles(c, stylebits)
    @ccall libnotcurses.nccell_off_styles(c::Ptr{nccell}, stylebits::Cuint)::Cvoid
end

function nccell_set_fg_default(c)
    @ccall libnotcurses.nccell_set_fg_default(c::Ptr{nccell})::Cvoid
end

function nccell_set_bg_default(c)
    @ccall libnotcurses.nccell_set_bg_default(c::Ptr{nccell})::Cvoid
end

function nccell_set_fg_alpha(c, alpha)
    @ccall libnotcurses.nccell_set_fg_alpha(c::Ptr{nccell}, alpha::Cint)::Cint
end

function nccell_set_bg_alpha(c, alpha)
    @ccall libnotcurses.nccell_set_bg_alpha(c::Ptr{nccell}, alpha::Cint)::Cint
end

function nccell_double_wide_p(c)
    @ccall libnotcurses.nccell_double_wide_p(c::Ptr{nccell})::Bool
end

function nccell_wide_right_p(c)
    @ccall libnotcurses.nccell_wide_right_p(c::Ptr{nccell})::Bool
end

function nccell_wide_left_p(c)
    @ccall libnotcurses.nccell_wide_left_p(c::Ptr{nccell})::Bool
end

function nccell_extended_gcluster(n, c)
    @ccall libnotcurses.nccell_extended_gcluster(n::Ptr{ncplane}, c::Ptr{nccell})::Ptr{Cchar}
end

function nccell_cols(c)
    @ccall libnotcurses.nccell_cols(c::Ptr{nccell})::Cuint
end

function nccell_strdup(n, c)
    @ccall libnotcurses.nccell_strdup(n::Ptr{ncplane}, c::Ptr{nccell})::Ptr{Cchar}
end

function nccell_extract(n, c, stylemask, channels)
    @ccall libnotcurses.nccell_extract(n::Ptr{ncplane}, c::Ptr{nccell}, stylemask::Ptr{UInt16}, channels::Ptr{UInt64})::Ptr{Cchar}
end

function nccellcmp(n1, c1, n2, c2)
    @ccall libnotcurses.nccellcmp(n1::Ptr{ncplane}, c1::Ptr{nccell}, n2::Ptr{ncplane}, c2::Ptr{nccell})::Bool
end

function nccell_load_char(n, c, ch)
    @ccall libnotcurses.nccell_load_char(n::Ptr{ncplane}, c::Ptr{nccell}, ch::Cchar)::Cint
end

function nccell_load_egc32(n, c, egc)
    @ccall libnotcurses.nccell_load_egc32(n::Ptr{ncplane}, c::Ptr{nccell}, egc::UInt32)::Cint
end

function nccell_load_ucs32(n, c, u)
    @ccall libnotcurses.nccell_load_ucs32(n::Ptr{ncplane}, c::Ptr{nccell}, u::UInt32)::Cint
end

@cenum ncloglevel_e::Int32 begin
    NCLOGLEVEL_SILENT = -1
    NCLOGLEVEL_PANIC = 0
    NCLOGLEVEL_FATAL = 1
    NCLOGLEVEL_ERROR = 2
    NCLOGLEVEL_WARNING = 3
    NCLOGLEVEL_INFO = 4
    NCLOGLEVEL_VERBOSE = 5
    NCLOGLEVEL_DEBUG = 6
    NCLOGLEVEL_TRACE = 7
end

struct notcurses_options
    termtype::Ptr{Cchar}
    loglevel::ncloglevel_e
    margin_t::Cuint
    margin_r::Cuint
    margin_b::Cuint
    margin_l::Cuint
    flags::UInt64
end

function notcurses_lex_margins(op, opts)
    @ccall libnotcurses.notcurses_lex_margins(op::Ptr{Cchar}, opts::Ptr{notcurses_options})::Cint
end

function notcurses_lex_blitter(op, blitter)
    @ccall libnotcurses.notcurses_lex_blitter(op::Ptr{Cchar}, blitter::Ptr{ncblitter_e})::Cint
end

function notcurses_str_blitter(blitter)
    @ccall libnotcurses.notcurses_str_blitter(blitter::ncblitter_e)::Ptr{Cchar}
end

function notcurses_lex_scalemode(op, scalemode)
    @ccall libnotcurses.notcurses_lex_scalemode(op::Ptr{Cchar}, scalemode::Ptr{ncscale_e})::Cint
end

function notcurses_str_scalemode(scalemode)
    @ccall libnotcurses.notcurses_str_scalemode(scalemode::ncscale_e)::Ptr{Cchar}
end

function notcurses_init(opts, fp)
    @ccall libnotcurses.notcurses_init(opts::Ptr{notcurses_options}, fp::Ptr{Libc.FILE})::Ptr{notcurses}
end

function notcurses_core_init(opts, fp)
    @ccall libnotcurses.notcurses_core_init(opts::Ptr{notcurses_options}, fp::Ptr{Libc.FILE})::Ptr{notcurses}
end

function notcurses_stop(nc)
    @ccall libnotcurses.notcurses_stop(nc::Ptr{notcurses})::Cint
end

function notcurses_enter_alternate_screen(nc)
    @ccall libnotcurses.notcurses_enter_alternate_screen(nc::Ptr{notcurses})::Cint
end

function notcurses_leave_alternate_screen(nc)
    @ccall libnotcurses.notcurses_leave_alternate_screen(nc::Ptr{notcurses})::Cint
end

function notcurses_stdplane(nc)
    @ccall libnotcurses.notcurses_stdplane(nc::Ptr{notcurses})::Ptr{ncplane}
end

function notcurses_stdplane_const(nc)
    @ccall libnotcurses.notcurses_stdplane_const(nc::Ptr{notcurses})::Ptr{ncplane}
end

function ncpile_top(n)
    @ccall libnotcurses.ncpile_top(n::Ptr{ncplane})::Ptr{ncplane}
end

function ncpile_bottom(n)
    @ccall libnotcurses.ncpile_bottom(n::Ptr{ncplane})::Ptr{ncplane}
end

function notcurses_top(n)
    @ccall libnotcurses.notcurses_top(n::Ptr{notcurses})::Ptr{ncplane}
end

function notcurses_bottom(n)
    @ccall libnotcurses.notcurses_bottom(n::Ptr{notcurses})::Ptr{ncplane}
end

function ncpile_render(n)
    @ccall libnotcurses.ncpile_render(n::Ptr{ncplane})::Cint
end

function ncpile_rasterize(n)
    @ccall libnotcurses.ncpile_rasterize(n::Ptr{ncplane})::Cint
end

function notcurses_render(nc)
    @ccall libnotcurses.notcurses_render(nc::Ptr{notcurses})::Cint
end

function ncpile_render_to_buffer(p, buf, buflen)
    @ccall libnotcurses.ncpile_render_to_buffer(p::Ptr{ncplane}, buf::Ptr{Ptr{Cchar}}, buflen::Ptr{Csize_t})::Cint
end

function ncpile_render_to_file(p, fp)
    @ccall libnotcurses.ncpile_render_to_file(p::Ptr{ncplane}, fp::Ptr{Libc.FILE})::Cint
end

function notcurses_drop_planes(nc)
    @ccall libnotcurses.notcurses_drop_planes(nc::Ptr{notcurses})::Cvoid
end

function nckey_mouse_p(r)
    @ccall libnotcurses.nckey_mouse_p(r::UInt32)::Bool
end

struct ncinput
    data::NTuple{32, UInt8}
end

function Base.getproperty(x::Ptr{ncinput}, f::Symbol)
    f === :id && return Ptr{UInt32}(x + 0)
    f === :y && return Ptr{Cint}(x + 4)
    f === :x && return Ptr{Cint}(x + 8)
    f === :utf8 && return Ptr{NTuple{5, Cchar}}(x + 12)
    f === :alt && return Ptr{Bool}(x + 17)
    f === :shift && return Ptr{Bool}(x + 18)
    f === :ctrl && return Ptr{Bool}(x + 19)
    f === :evtype && return Ptr{Cvoid}(x + 20)
    f === :ypx && return Ptr{Cint}(x + 24)
    f === :xpx && return Ptr{Cint}(x + 28)
    return getfield(x, f)
end

function Base.getproperty(x::ncinput, f::Symbol)
    r = Ref{ncinput}(x)
    ptr = Base.unsafe_convert(Ptr{ncinput}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{ncinput}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

function ncinput_equal_p(n1, n2)
    @ccall libnotcurses.ncinput_equal_p(n1::Ptr{ncinput}, n2::Ptr{ncinput})::Bool
end

function notcurses_get(n, ts, ni)
    @ccall libnotcurses.notcurses_get(n::Ptr{notcurses}, ts::Ptr{Cvoid}, ni::Ptr{ncinput})::UInt32
end

function notcurses_getvec(n, ts, ni, vcount)
    @ccall libnotcurses.notcurses_getvec(n::Ptr{notcurses}, ts::Ptr{Cvoid}, ni::Ptr{ncinput}, vcount::Cint)::Cint
end

function notcurses_inputready_fd(n)
    @ccall libnotcurses.notcurses_inputready_fd(n::Ptr{notcurses})::Cint
end

function notcurses_get_nblock(n, ni)
    @ccall libnotcurses.notcurses_get_nblock(n::Ptr{notcurses}, ni::Ptr{ncinput})::UInt32
end

function notcurses_get_blocking(n, ni)
    @ccall libnotcurses.notcurses_get_blocking(n::Ptr{notcurses}, ni::Ptr{ncinput})::UInt32
end

function ncinput_nomod_p(ni)
    @ccall libnotcurses.ncinput_nomod_p(ni::Ptr{ncinput})::Bool
end

function notcurses_mice_enable(n, eventmask)
    @ccall libnotcurses.notcurses_mice_enable(n::Ptr{notcurses}, eventmask::Cuint)::Cint
end

function notcurses_mice_disable(n)
    @ccall libnotcurses.notcurses_mice_disable(n::Ptr{notcurses})::Cint
end

function notcurses_linesigs_disable(n)
    @ccall libnotcurses.notcurses_linesigs_disable(n::Ptr{notcurses})::Cint
end

function notcurses_linesigs_enable(n)
    @ccall libnotcurses.notcurses_linesigs_enable(n::Ptr{notcurses})::Cint
end

function notcurses_refresh(n, y, x)
    @ccall libnotcurses.notcurses_refresh(n::Ptr{notcurses}, y::Ptr{Cuint}, x::Ptr{Cuint})::Cint
end

function ncplane_notcurses(n)
    @ccall libnotcurses.ncplane_notcurses(n::Ptr{ncplane})::Ptr{notcurses}
end

function ncplane_notcurses_const(n)
    @ccall libnotcurses.ncplane_notcurses_const(n::Ptr{ncplane})::Ptr{notcurses}
end

function ncplane_dim_yx(n, y, x)
    @ccall libnotcurses.ncplane_dim_yx(n::Ptr{ncplane}, y::Ptr{Cuint}, x::Ptr{Cuint})::Cvoid
end

function notcurses_stddim_yx(nc, y, x)
    @ccall libnotcurses.notcurses_stddim_yx(nc::Ptr{notcurses}, y::Ptr{Cuint}, x::Ptr{Cuint})::Ptr{ncplane}
end

function notcurses_stddim_yx_const(nc, y, x)
    @ccall libnotcurses.notcurses_stddim_yx_const(nc::Ptr{notcurses}, y::Ptr{Cuint}, x::Ptr{Cuint})::Ptr{ncplane}
end

function ncplane_dim_y(n)
    @ccall libnotcurses.ncplane_dim_y(n::Ptr{ncplane})::Cuint
end

function ncplane_dim_x(n)
    @ccall libnotcurses.ncplane_dim_x(n::Ptr{ncplane})::Cuint
end

function ncplane_pixel_geom(n, pxy, pxx, celldimy, celldimx, maxbmapy, maxbmapx)
    @ccall libnotcurses.ncplane_pixel_geom(n::Ptr{ncplane}, pxy::Ptr{Cuint}, pxx::Ptr{Cuint}, celldimy::Ptr{Cuint}, celldimx::Ptr{Cuint}, maxbmapy::Ptr{Cuint}, maxbmapx::Ptr{Cuint})::Cvoid
end

function notcurses_term_dim_yx(n, rows, cols)
    @ccall libnotcurses.notcurses_term_dim_yx(n::Ptr{notcurses}, rows::Ptr{Cuint}, cols::Ptr{Cuint})::Cvoid
end

function notcurses_at_yx(nc, yoff, xoff, stylemask, channels)
    @ccall libnotcurses.notcurses_at_yx(nc::Ptr{notcurses}, yoff::Cuint, xoff::Cuint, stylemask::Ptr{UInt16}, channels::Ptr{UInt64})::Ptr{Cchar}
end

struct ncplane_options
    y::Cint
    x::Cint
    rows::Cuint
    cols::Cuint
    userptr::Ptr{Cvoid}
    name::Ptr{Cchar}
    resizecb::Ptr{Cvoid}
    flags::UInt64
    margin_b::Cuint
    margin_r::Cuint
end

function ncplane_create(n, nopts)
    @ccall libnotcurses.ncplane_create(n::Ptr{ncplane}, nopts::Ptr{ncplane_options})::Ptr{ncplane}
end

function ncpile_create(nc, nopts)
    @ccall libnotcurses.ncpile_create(nc::Ptr{notcurses}, nopts::Ptr{ncplane_options})::Ptr{ncplane}
end

function ncplane_resize_maximize(n)
    @ccall libnotcurses.ncplane_resize_maximize(n::Ptr{ncplane})::Cint
end

function ncplane_resize_marginalized(n)
    @ccall libnotcurses.ncplane_resize_marginalized(n::Ptr{ncplane})::Cint
end

function ncplane_resize_realign(n)
    @ccall libnotcurses.ncplane_resize_realign(n::Ptr{ncplane})::Cint
end

function ncplane_resize_placewithin(n)
    @ccall libnotcurses.ncplane_resize_placewithin(n::Ptr{ncplane})::Cint
end

function ncplane_set_resizecb(n, resizecb)
    @ccall libnotcurses.ncplane_set_resizecb(n::Ptr{ncplane}, resizecb::Ptr{Cvoid})::Cvoid
end

function ncplane_set_name(n, name)
    @ccall libnotcurses.ncplane_set_name(n::Ptr{ncplane}, name::Ptr{Cchar})::Cint
end

function ncplane_name(n)
    @ccall libnotcurses.ncplane_name(n::Ptr{ncplane})::Ptr{Cchar}
end

function ncplane_reparent(n, newparent)
    @ccall libnotcurses.ncplane_reparent(n::Ptr{ncplane}, newparent::Ptr{ncplane})::Ptr{ncplane}
end

function ncplane_reparent_family(n, newparent)
    @ccall libnotcurses.ncplane_reparent_family(n::Ptr{ncplane}, newparent::Ptr{ncplane})::Ptr{ncplane}
end

function ncplane_dup(n, opaque)
    @ccall libnotcurses.ncplane_dup(n::Ptr{ncplane}, opaque::Ptr{Cvoid})::Ptr{ncplane}
end

function ncplane_translate(src, dst, y, x)
    @ccall libnotcurses.ncplane_translate(src::Ptr{ncplane}, dst::Ptr{ncplane}, y::Ptr{Cint}, x::Ptr{Cint})::Cvoid
end

function ncplane_translate_abs(n, y, x)
    @ccall libnotcurses.ncplane_translate_abs(n::Ptr{ncplane}, y::Ptr{Cint}, x::Ptr{Cint})::Bool
end

function ncplane_set_scrolling(n, scrollp)
    @ccall libnotcurses.ncplane_set_scrolling(n::Ptr{ncplane}, scrollp::Cuint)::Bool
end

function ncplane_scrolling_p(n)
    @ccall libnotcurses.ncplane_scrolling_p(n::Ptr{ncplane})::Bool
end

function ncplane_set_autogrow(n, growp)
    @ccall libnotcurses.ncplane_set_autogrow(n::Ptr{ncplane}, growp::Cuint)::Bool
end

function ncplane_autogrow_p(n)
    @ccall libnotcurses.ncplane_autogrow_p(n::Ptr{ncplane})::Bool
end

struct ncpalette
    chans::NTuple{256, UInt32}
end

function ncpalette_new(nc)
    @ccall libnotcurses.ncpalette_new(nc::Ptr{notcurses})::Ptr{ncpalette}
end

function ncpalette_use(nc, p)
    @ccall libnotcurses.ncpalette_use(nc::Ptr{notcurses}, p::Ptr{ncpalette})::Cint
end

function ncpalette_set_rgb8(p, idx, r, g, b)
    @ccall libnotcurses.ncpalette_set_rgb8(p::Ptr{ncpalette}, idx::Cint, r::Cuint, g::Cuint, b::Cuint)::Cint
end

function ncpalette_set(p, idx, rgb)
    @ccall libnotcurses.ncpalette_set(p::Ptr{ncpalette}, idx::Cint, rgb::Cuint)::Cint
end

function ncpalette_get_rgb8(p, idx, r, g, b)
    @ccall libnotcurses.ncpalette_get_rgb8(p::Ptr{ncpalette}, idx::Cint, r::Ptr{Cuint}, g::Ptr{Cuint}, b::Ptr{Cuint})::Cint
end

function ncpalette_free(p)
    @ccall libnotcurses.ncpalette_free(p::Ptr{ncpalette})::Cvoid
end

struct nccapabilities
    colors::Cuint
    utf8::Bool
    rgb::Bool
    can_change_colors::Bool
    halfblocks::Bool
    quadrants::Bool
    sextants::Bool
    braille::Bool
end

function notcurses_supported_styles(nc)
    @ccall libnotcurses.notcurses_supported_styles(nc::Ptr{notcurses})::UInt16
end

function notcurses_palette_size(nc)
    @ccall libnotcurses.notcurses_palette_size(nc::Ptr{notcurses})::Cuint
end

function notcurses_detected_terminal(nc)
    @ccall libnotcurses.notcurses_detected_terminal(nc::Ptr{notcurses})::Ptr{Cchar}
end

function notcurses_capabilities(n)
    @ccall libnotcurses.notcurses_capabilities(n::Ptr{notcurses})::Ptr{nccapabilities}
end

@cenum ncpixelimpl_e::UInt32 begin
    NCPIXEL_NONE = 0
    NCPIXEL_SIXEL = 1
    NCPIXEL_LINUXFB = 2
    NCPIXEL_ITERM2 = 3
    NCPIXEL_KITTY_STATIC = 4
    NCPIXEL_KITTY_ANIMATED = 5
    NCPIXEL_KITTY_SELFREF = 6
end

function notcurses_check_pixel_support(nc)
    @ccall libnotcurses.notcurses_check_pixel_support(nc::Ptr{notcurses})::ncpixelimpl_e
end

function nccapability_canchangecolor(caps)
    @ccall libnotcurses.nccapability_canchangecolor(caps::Ptr{nccapabilities})::Bool
end

function notcurses_cantruecolor(nc)
    @ccall libnotcurses.notcurses_cantruecolor(nc::Ptr{notcurses})::Bool
end

function notcurses_canchangecolor(nc)
    @ccall libnotcurses.notcurses_canchangecolor(nc::Ptr{notcurses})::Bool
end

function notcurses_canfade(n)
    @ccall libnotcurses.notcurses_canfade(n::Ptr{notcurses})::Bool
end

function notcurses_canopen_images(nc)
    @ccall libnotcurses.notcurses_canopen_images(nc::Ptr{notcurses})::Bool
end

function notcurses_canopen_videos(nc)
    @ccall libnotcurses.notcurses_canopen_videos(nc::Ptr{notcurses})::Bool
end

function notcurses_canutf8(nc)
    @ccall libnotcurses.notcurses_canutf8(nc::Ptr{notcurses})::Bool
end

function notcurses_canhalfblock(nc)
    @ccall libnotcurses.notcurses_canhalfblock(nc::Ptr{notcurses})::Bool
end

function notcurses_canquadrant(nc)
    @ccall libnotcurses.notcurses_canquadrant(nc::Ptr{notcurses})::Bool
end

function notcurses_cansextant(nc)
    @ccall libnotcurses.notcurses_cansextant(nc::Ptr{notcurses})::Bool
end

function notcurses_canbraille(nc)
    @ccall libnotcurses.notcurses_canbraille(nc::Ptr{notcurses})::Bool
end

function notcurses_canpixel(nc)
    @ccall libnotcurses.notcurses_canpixel(nc::Ptr{notcurses})::Bool
end

struct ncstats
    renders::UInt64
    writeouts::UInt64
    failed_renders::UInt64
    failed_writeouts::UInt64
    raster_bytes::UInt64
    raster_max_bytes::Int64
    raster_min_bytes::Int64
    render_ns::UInt64
    render_max_ns::Int64
    render_min_ns::Int64
    raster_ns::UInt64
    raster_max_ns::Int64
    raster_min_ns::Int64
    writeout_ns::UInt64
    writeout_max_ns::Int64
    writeout_min_ns::Int64
    cellelisions::UInt64
    cellemissions::UInt64
    fgelisions::UInt64
    fgemissions::UInt64
    bgelisions::UInt64
    bgemissions::UInt64
    defaultelisions::UInt64
    defaultemissions::UInt64
    refreshes::UInt64
    sprixelemissions::UInt64
    sprixelelisions::UInt64
    sprixelbytes::UInt64
    appsync_updates::UInt64
    input_errors::UInt64
    input_events::UInt64
    hpa_gratuitous::UInt64
    cell_geo_changes::UInt64
    pixel_geo_changes::UInt64
    fbbytes::UInt64
    planes::Cuint
end

function notcurses_stats_alloc(nc)
    @ccall libnotcurses.notcurses_stats_alloc(nc::Ptr{notcurses})::Ptr{ncstats}
end

function notcurses_stats(nc, stats)
    @ccall libnotcurses.notcurses_stats(nc::Ptr{notcurses}, stats::Ptr{ncstats})::Cvoid
end

function notcurses_stats_reset(nc, stats)
    @ccall libnotcurses.notcurses_stats_reset(nc::Ptr{notcurses}, stats::Ptr{ncstats})::Cvoid
end

function ncplane_resize(n, keepy, keepx, keepleny, keeplenx, yoff, xoff, ylen, xlen)
    @ccall libnotcurses.ncplane_resize(n::Ptr{ncplane}, keepy::Cint, keepx::Cint, keepleny::Cuint, keeplenx::Cuint, yoff::Cint, xoff::Cint, ylen::Cuint, xlen::Cuint)::Cint
end

function ncplane_resize_simple(n, ylen, xlen)
    @ccall libnotcurses.ncplane_resize_simple(n::Ptr{ncplane}, ylen::Cuint, xlen::Cuint)::Cint
end

function ncplane_destroy(n)
    @ccall libnotcurses.ncplane_destroy(n::Ptr{ncplane})::Cint
end

function ncplane_set_base_cell(n, c)
    @ccall libnotcurses.ncplane_set_base_cell(n::Ptr{ncplane}, c::Ptr{nccell})::Cint
end

function ncplane_set_base(n, egc, stylemask, channels)
    @ccall libnotcurses.ncplane_set_base(n::Ptr{ncplane}, egc::Ptr{Cchar}, stylemask::UInt16, channels::UInt64)::Cint
end

function ncplane_base(n, c)
    @ccall libnotcurses.ncplane_base(n::Ptr{ncplane}, c::Ptr{nccell})::Cint
end

function ncplane_yx(n, y, x)
    @ccall libnotcurses.ncplane_yx(n::Ptr{ncplane}, y::Ptr{Cint}, x::Ptr{Cint})::Cvoid
end

function ncplane_y(n)
    @ccall libnotcurses.ncplane_y(n::Ptr{ncplane})::Cint
end

function ncplane_x(n)
    @ccall libnotcurses.ncplane_x(n::Ptr{ncplane})::Cint
end

function ncplane_move_yx(n, y, x)
    @ccall libnotcurses.ncplane_move_yx(n::Ptr{ncplane}, y::Cint, x::Cint)::Cint
end

function ncplane_move_rel(n, y, x)
    @ccall libnotcurses.ncplane_move_rel(n::Ptr{ncplane}, y::Cint, x::Cint)::Cint
end

function ncplane_abs_yx(n, y, x)
    @ccall libnotcurses.ncplane_abs_yx(n::Ptr{ncplane}, y::Ptr{Cint}, x::Ptr{Cint})::Cvoid
end

function ncplane_abs_y(n)
    @ccall libnotcurses.ncplane_abs_y(n::Ptr{ncplane})::Cint
end

function ncplane_abs_x(n)
    @ccall libnotcurses.ncplane_abs_x(n::Ptr{ncplane})::Cint
end

function ncplane_parent(n)
    @ccall libnotcurses.ncplane_parent(n::Ptr{ncplane})::Ptr{ncplane}
end

function ncplane_parent_const(n)
    @ccall libnotcurses.ncplane_parent_const(n::Ptr{ncplane})::Ptr{ncplane}
end

function ncplane_descendant_p(n, ancestor)
    @ccall libnotcurses.ncplane_descendant_p(n::Ptr{ncplane}, ancestor::Ptr{ncplane})::Cint
end

function ncplane_move_above(n, above)
    @ccall libnotcurses.ncplane_move_above(n::Ptr{ncplane}, above::Ptr{ncplane})::Cint
end

function ncplane_move_below(n, below)
    @ccall libnotcurses.ncplane_move_below(n::Ptr{ncplane}, below::Ptr{ncplane})::Cint
end

function ncplane_move_top(n)
    @ccall libnotcurses.ncplane_move_top(n::Ptr{ncplane})::Cvoid
end

function ncplane_move_bottom(n)
    @ccall libnotcurses.ncplane_move_bottom(n::Ptr{ncplane})::Cvoid
end

function ncplane_move_family_above(n, targ)
    @ccall libnotcurses.ncplane_move_family_above(n::Ptr{ncplane}, targ::Ptr{ncplane})::Cint
end

function ncplane_move_family_below(n, targ)
    @ccall libnotcurses.ncplane_move_family_below(n::Ptr{ncplane}, targ::Ptr{ncplane})::Cint
end

function ncplane_move_family_top(n)
    @ccall libnotcurses.ncplane_move_family_top(n::Ptr{ncplane})::Cvoid
end

function ncplane_move_family_bottom(n)
    @ccall libnotcurses.ncplane_move_family_bottom(n::Ptr{ncplane})::Cvoid
end

function ncplane_below(n)
    @ccall libnotcurses.ncplane_below(n::Ptr{ncplane})::Ptr{ncplane}
end

function ncplane_above(n)
    @ccall libnotcurses.ncplane_above(n::Ptr{ncplane})::Ptr{ncplane}
end

function ncplane_scrollup(n, r)
    @ccall libnotcurses.ncplane_scrollup(n::Ptr{ncplane}, r::Cint)::Cint
end

function ncplane_scrollup_child(n, child)
    @ccall libnotcurses.ncplane_scrollup_child(n::Ptr{ncplane}, child::Ptr{ncplane})::Cint
end

function ncplane_rotate_cw(n)
    @ccall libnotcurses.ncplane_rotate_cw(n::Ptr{ncplane})::Cint
end

function ncplane_rotate_ccw(n)
    @ccall libnotcurses.ncplane_rotate_ccw(n::Ptr{ncplane})::Cint
end

function ncplane_at_cursor(n, stylemask, channels)
    @ccall libnotcurses.ncplane_at_cursor(n::Ptr{ncplane}, stylemask::Ptr{UInt16}, channels::Ptr{UInt64})::Ptr{Cchar}
end

function ncplane_at_cursor_cell(n, c)
    @ccall libnotcurses.ncplane_at_cursor_cell(n::Ptr{ncplane}, c::Ptr{nccell})::Cint
end

function ncplane_at_yx(n, y, x, stylemask, channels)
    @ccall libnotcurses.ncplane_at_yx(n::Ptr{ncplane}, y::Cint, x::Cint, stylemask::Ptr{UInt16}, channels::Ptr{UInt64})::Ptr{Cchar}
end

function ncplane_at_yx_cell(n, y, x, c)
    @ccall libnotcurses.ncplane_at_yx_cell(n::Ptr{ncplane}, y::Cint, x::Cint, c::Ptr{nccell})::Cint
end

function ncplane_contents(n, begy, begx, leny, lenx)
    @ccall libnotcurses.ncplane_contents(n::Ptr{ncplane}, begy::Cint, begx::Cint, leny::Cuint, lenx::Cuint)::Ptr{Cchar}
end

function ncplane_set_userptr(n, opaque)
    @ccall libnotcurses.ncplane_set_userptr(n::Ptr{ncplane}, opaque::Ptr{Cvoid})::Ptr{Cvoid}
end

function ncplane_userptr(n)
    @ccall libnotcurses.ncplane_userptr(n::Ptr{ncplane})::Ptr{Cvoid}
end

function ncplane_center_abs(n, y, x)
    @ccall libnotcurses.ncplane_center_abs(n::Ptr{ncplane}, y::Ptr{Cint}, x::Ptr{Cint})::Cvoid
end

function ncplane_as_rgba(n, blit, begy, begx, leny, lenx, pxdimy, pxdimx)
    @ccall libnotcurses.ncplane_as_rgba(n::Ptr{ncplane}, blit::ncblitter_e, begy::Cint, begx::Cint, leny::Cuint, lenx::Cuint, pxdimy::Ptr{Cuint}, pxdimx::Ptr{Cuint})::Ptr{UInt32}
end

function notcurses_align(availu, align, u)
    @ccall libnotcurses.notcurses_align(availu::Cint, align::ncalign_e, u::Cint)::Cint
end

function ncplane_halign(n, align, c)
    @ccall libnotcurses.ncplane_halign(n::Ptr{ncplane}, align::ncalign_e, c::Cint)::Cint
end

function ncplane_valign(n, align, r)
    @ccall libnotcurses.ncplane_valign(n::Ptr{ncplane}, align::ncalign_e, r::Cint)::Cint
end

function ncplane_cursor_move_yx(n, y, x)
    @ccall libnotcurses.ncplane_cursor_move_yx(n::Ptr{ncplane}, y::Cint, x::Cint)::Cint
end

function ncplane_cursor_move_rel(n, y, x)
    @ccall libnotcurses.ncplane_cursor_move_rel(n::Ptr{ncplane}, y::Cint, x::Cint)::Cint
end

function ncplane_home(n)
    @ccall libnotcurses.ncplane_home(n::Ptr{ncplane})::Cvoid
end

function ncplane_cursor_yx(n, y, x)
    @ccall libnotcurses.ncplane_cursor_yx(n::Ptr{ncplane}, y::Ptr{Cuint}, x::Ptr{Cuint})::Cvoid
end

function ncplane_channels(n)
    @ccall libnotcurses.ncplane_channels(n::Ptr{ncplane})::UInt64
end

function ncplane_styles(n)
    @ccall libnotcurses.ncplane_styles(n::Ptr{ncplane})::UInt16
end

function ncplane_putc_yx(n, y, x, c)
    @ccall libnotcurses.ncplane_putc_yx(n::Ptr{ncplane}, y::Cint, x::Cint, c::Ptr{nccell})::Cint
end

function ncplane_putc(n, c)
    @ccall libnotcurses.ncplane_putc(n::Ptr{ncplane}, c::Ptr{nccell})::Cint
end

function ncplane_putchar_yx(n, y, x, c)
    @ccall libnotcurses.ncplane_putchar_yx(n::Ptr{ncplane}, y::Cint, x::Cint, c::Cchar)::Cint
end

function ncplane_putchar(n, c)
    @ccall libnotcurses.ncplane_putchar(n::Ptr{ncplane}, c::Cchar)::Cint
end

function ncplane_putchar_stained(n, c)
    @ccall libnotcurses.ncplane_putchar_stained(n::Ptr{ncplane}, c::Cchar)::Cint
end

function ncplane_putegc_yx(n, y, x, gclust, sbytes)
    @ccall libnotcurses.ncplane_putegc_yx(n::Ptr{ncplane}, y::Cint, x::Cint, gclust::Ptr{Cchar}, sbytes::Ptr{Csize_t})::Cint
end

function ncplane_putegc(n, gclust, sbytes)
    @ccall libnotcurses.ncplane_putegc(n::Ptr{ncplane}, gclust::Ptr{Cchar}, sbytes::Ptr{Csize_t})::Cint
end

function ncplane_putegc_stained(n, gclust, sbytes)
    @ccall libnotcurses.ncplane_putegc_stained(n::Ptr{ncplane}, gclust::Ptr{Cchar}, sbytes::Ptr{Csize_t})::Cint
end

function ncwcsrtombs(src)
    @ccall libnotcurses.ncwcsrtombs(src::Ptr{Cwchar_t})::Ptr{Cchar}
end

function ncplane_putwegc(n, gclust, sbytes)
    @ccall libnotcurses.ncplane_putwegc(n::Ptr{ncplane}, gclust::Ptr{Cwchar_t}, sbytes::Ptr{Csize_t})::Cint
end

function ncplane_putwegc_yx(n, y, x, gclust, sbytes)
    @ccall libnotcurses.ncplane_putwegc_yx(n::Ptr{ncplane}, y::Cint, x::Cint, gclust::Ptr{Cwchar_t}, sbytes::Ptr{Csize_t})::Cint
end

function ncplane_putwegc_stained(n, gclust, sbytes)
    @ccall libnotcurses.ncplane_putwegc_stained(n::Ptr{ncplane}, gclust::Ptr{Cwchar_t}, sbytes::Ptr{Csize_t})::Cint
end

function ncplane_putstr_yx(n, y, x, gclusters)
    @ccall libnotcurses.ncplane_putstr_yx(n::Ptr{ncplane}, y::Cint, x::Cint, gclusters::Ptr{Cchar})::Cint
end

function ncplane_putstr(n, gclustarr)
    @ccall libnotcurses.ncplane_putstr(n::Ptr{ncplane}, gclustarr::Ptr{Cchar})::Cint
end

function ncplane_putstr_aligned(n, y, align, s)
    @ccall libnotcurses.ncplane_putstr_aligned(n::Ptr{ncplane}, y::Cint, align::ncalign_e, s::Ptr{Cchar})::Cint
end

function ncplane_putstr_stained(n, gclusters)
    @ccall libnotcurses.ncplane_putstr_stained(n::Ptr{ncplane}, gclusters::Ptr{Cchar})::Cint
end

function ncplane_putnstr_aligned(n, y, align, s, str)
    @ccall libnotcurses.ncplane_putnstr_aligned(n::Ptr{ncplane}, y::Cint, align::ncalign_e, s::Csize_t, str::Ptr{Cchar})::Cint
end

function ncplane_putnstr_yx(n, y, x, s, gclusters)
    @ccall libnotcurses.ncplane_putnstr_yx(n::Ptr{ncplane}, y::Cint, x::Cint, s::Csize_t, gclusters::Ptr{Cchar})::Cint
end

function ncplane_putnstr(n, s, gclustarr)
    @ccall libnotcurses.ncplane_putnstr(n::Ptr{ncplane}, s::Csize_t, gclustarr::Ptr{Cchar})::Cint
end

function ncplane_putwstr_yx(n, y, x, gclustarr)
    @ccall libnotcurses.ncplane_putwstr_yx(n::Ptr{ncplane}, y::Cint, x::Cint, gclustarr::Ptr{Cwchar_t})::Cint
end

function ncplane_putwstr_aligned(n, y, align, gclustarr)
    @ccall libnotcurses.ncplane_putwstr_aligned(n::Ptr{ncplane}, y::Cint, align::ncalign_e, gclustarr::Ptr{Cwchar_t})::Cint
end

function ncplane_putwstr_stained(n, gclustarr)
    @ccall libnotcurses.ncplane_putwstr_stained(n::Ptr{ncplane}, gclustarr::Ptr{Cwchar_t})::Cint
end

function ncplane_putwstr(n, gclustarr)
    @ccall libnotcurses.ncplane_putwstr(n::Ptr{ncplane}, gclustarr::Ptr{Cwchar_t})::Cint
end

function ncplane_pututf32_yx(n, y, x, u)
    @ccall libnotcurses.ncplane_pututf32_yx(n::Ptr{ncplane}, y::Cint, x::Cint, u::UInt32)::Cint
end

function ncplane_putwc_yx(n, y, x, w)
    @ccall libnotcurses.ncplane_putwc_yx(n::Ptr{ncplane}, y::Cint, x::Cint, w::Cwchar_t)::Cint
end

function ncplane_putwc(n, w)
    @ccall libnotcurses.ncplane_putwc(n::Ptr{ncplane}, w::Cwchar_t)::Cint
end

function ncplane_putwc_utf32(n, w, wchars)
    @ccall libnotcurses.ncplane_putwc_utf32(n::Ptr{ncplane}, w::Ptr{Cwchar_t}, wchars::Ptr{Cuint})::Cint
end

function ncplane_putwc_stained(n, w)
    @ccall libnotcurses.ncplane_putwc_stained(n::Ptr{ncplane}, w::Cwchar_t)::Cint
end

function ncplane_puttext(n, y, align, text, bytes)
    @ccall libnotcurses.ncplane_puttext(n::Ptr{ncplane}, y::Cint, align::ncalign_e, text::Ptr{Cchar}, bytes::Ptr{Csize_t})::Cint
end

function ncplane_hline_interp(n, c, len, c1, c2)
    @ccall libnotcurses.ncplane_hline_interp(n::Ptr{ncplane}, c::Ptr{nccell}, len::Cuint, c1::UInt64, c2::UInt64)::Cint
end

function ncplane_hline(n, c, len)
    @ccall libnotcurses.ncplane_hline(n::Ptr{ncplane}, c::Ptr{nccell}, len::Cuint)::Cint
end

function ncplane_vline_interp(n, c, len, c1, c2)
    @ccall libnotcurses.ncplane_vline_interp(n::Ptr{ncplane}, c::Ptr{nccell}, len::Cuint, c1::UInt64, c2::UInt64)::Cint
end

function ncplane_vline(n, c, len)
    @ccall libnotcurses.ncplane_vline(n::Ptr{ncplane}, c::Ptr{nccell}, len::Cuint)::Cint
end

function ncplane_box(n, ul, ur, ll, lr, hline, vline, ystop, xstop, ctlword)
    @ccall libnotcurses.ncplane_box(n::Ptr{ncplane}, ul::Ptr{nccell}, ur::Ptr{nccell}, ll::Ptr{nccell}, lr::Ptr{nccell}, hline::Ptr{nccell}, vline::Ptr{nccell}, ystop::Cuint, xstop::Cuint, ctlword::Cuint)::Cint
end

function ncplane_box_sized(n, ul, ur, ll, lr, hline, vline, ystop, xstop, ctlword)
    @ccall libnotcurses.ncplane_box_sized(n::Ptr{ncplane}, ul::Ptr{nccell}, ur::Ptr{nccell}, ll::Ptr{nccell}, lr::Ptr{nccell}, hline::Ptr{nccell}, vline::Ptr{nccell}, ystop::Cuint, xstop::Cuint, ctlword::Cuint)::Cint
end

function ncplane_perimeter(n, ul, ur, ll, lr, hline, vline, ctlword)
    @ccall libnotcurses.ncplane_perimeter(n::Ptr{ncplane}, ul::Ptr{nccell}, ur::Ptr{nccell}, ll::Ptr{nccell}, lr::Ptr{nccell}, hline::Ptr{nccell}, vline::Ptr{nccell}, ctlword::Cuint)::Cint
end

function ncplane_polyfill_yx(n, y, x, c)
    @ccall libnotcurses.ncplane_polyfill_yx(n::Ptr{ncplane}, y::Cint, x::Cint, c::Ptr{nccell})::Cint
end

function ncplane_gradient(n, y, x, ylen, xlen, egc, styles, ul, ur, ll, lr)
    @ccall libnotcurses.ncplane_gradient(n::Ptr{ncplane}, y::Cint, x::Cint, ylen::Cuint, xlen::Cuint, egc::Ptr{Cchar}, styles::UInt16, ul::UInt64, ur::UInt64, ll::UInt64, lr::UInt64)::Cint
end

function ncplane_gradient2x1(n, y, x, ylen, xlen, ul, ur, ll, lr)
    @ccall libnotcurses.ncplane_gradient2x1(n::Ptr{ncplane}, y::Cint, x::Cint, ylen::Cuint, xlen::Cuint, ul::UInt32, ur::UInt32, ll::UInt32, lr::UInt32)::Cint
end

function ncplane_format(n, y, x, ylen, xlen, stylemask)
    @ccall libnotcurses.ncplane_format(n::Ptr{ncplane}, y::Cint, x::Cint, ylen::Cuint, xlen::Cuint, stylemask::UInt16)::Cint
end

function ncplane_stain(n, y, x, ylen, xlen, ul, ur, ll, lr)
    @ccall libnotcurses.ncplane_stain(n::Ptr{ncplane}, y::Cint, x::Cint, ylen::Cuint, xlen::Cuint, ul::UInt64, ur::UInt64, ll::UInt64, lr::UInt64)::Cint
end

function ncplane_mergedown_simple(src, dst)
    @ccall libnotcurses.ncplane_mergedown_simple(src::Ptr{ncplane}, dst::Ptr{ncplane})::Cint
end

function ncplane_mergedown(src, dst, begsrcy, begsrcx, leny, lenx, dsty, dstx)
    @ccall libnotcurses.ncplane_mergedown(src::Ptr{ncplane}, dst::Ptr{ncplane}, begsrcy::Cint, begsrcx::Cint, leny::Cuint, lenx::Cuint, dsty::Cint, dstx::Cint)::Cint
end

function ncplane_erase(n)
    @ccall libnotcurses.ncplane_erase(n::Ptr{ncplane})::Cvoid
end

function ncplane_erase_region(n, ystart, xstart, ylen, xlen)
    @ccall libnotcurses.ncplane_erase_region(n::Ptr{ncplane}, ystart::Cint, xstart::Cint, ylen::Cint, xlen::Cint)::Cint
end

function nccell_fg_rgb(cl)
    @ccall libnotcurses.nccell_fg_rgb(cl::Ptr{nccell})::UInt32
end

function nccell_bg_rgb(cl)
    @ccall libnotcurses.nccell_bg_rgb(cl::Ptr{nccell})::UInt32
end

function nccell_fg_alpha(cl)
    @ccall libnotcurses.nccell_fg_alpha(cl::Ptr{nccell})::UInt32
end

function nccell_bg_alpha(cl)
    @ccall libnotcurses.nccell_bg_alpha(cl::Ptr{nccell})::UInt32
end

function nccell_fg_rgb8(cl, r, g, b)
    @ccall libnotcurses.nccell_fg_rgb8(cl::Ptr{nccell}, r::Ptr{Cuint}, g::Ptr{Cuint}, b::Ptr{Cuint})::UInt32
end

function nccell_bg_rgb8(cl, r, g, b)
    @ccall libnotcurses.nccell_bg_rgb8(cl::Ptr{nccell}, r::Ptr{Cuint}, g::Ptr{Cuint}, b::Ptr{Cuint})::UInt32
end

function nccell_set_fg_rgb8(cl, r, g, b)
    @ccall libnotcurses.nccell_set_fg_rgb8(cl::Ptr{nccell}, r::Cuint, g::Cuint, b::Cuint)::Cint
end

function nccell_set_fg_rgb8_clipped(cl, r, g, b)
    @ccall libnotcurses.nccell_set_fg_rgb8_clipped(cl::Ptr{nccell}, r::Cint, g::Cint, b::Cint)::Cvoid
end

function nccell_set_fg_rgb(c, channel)
    @ccall libnotcurses.nccell_set_fg_rgb(c::Ptr{nccell}, channel::UInt32)::Cint
end

function nccell_set_fg_palindex(cl, idx)
    @ccall libnotcurses.nccell_set_fg_palindex(cl::Ptr{nccell}, idx::Cint)::Cint
end

function nccell_fg_palindex(cl)
    @ccall libnotcurses.nccell_fg_palindex(cl::Ptr{nccell})::UInt32
end

function nccell_set_bg_rgb8(cl, r, g, b)
    @ccall libnotcurses.nccell_set_bg_rgb8(cl::Ptr{nccell}, r::Cuint, g::Cuint, b::Cuint)::Cint
end

function nccell_set_bg_rgb8_clipped(cl, r, g, b)
    @ccall libnotcurses.nccell_set_bg_rgb8_clipped(cl::Ptr{nccell}, r::Cint, g::Cint, b::Cint)::Cvoid
end

function nccell_set_bg_rgb(c, channel)
    @ccall libnotcurses.nccell_set_bg_rgb(c::Ptr{nccell}, channel::UInt32)::Cint
end

function nccell_set_bg_palindex(cl, idx)
    @ccall libnotcurses.nccell_set_bg_palindex(cl::Ptr{nccell}, idx::Cint)::Cint
end

function nccell_bg_palindex(cl)
    @ccall libnotcurses.nccell_bg_palindex(cl::Ptr{nccell})::UInt32
end

function nccell_fg_default_p(cl)
    @ccall libnotcurses.nccell_fg_default_p(cl::Ptr{nccell})::Bool
end

function nccell_fg_palindex_p(cl)
    @ccall libnotcurses.nccell_fg_palindex_p(cl::Ptr{nccell})::Bool
end

function nccell_bg_default_p(cl)
    @ccall libnotcurses.nccell_bg_default_p(cl::Ptr{nccell})::Bool
end

function nccell_bg_palindex_p(cl)
    @ccall libnotcurses.nccell_bg_palindex_p(cl::Ptr{nccell})::Bool
end

function ncplane_bchannel(n)
    @ccall libnotcurses.ncplane_bchannel(n::Ptr{ncplane})::UInt32
end

function ncplane_fchannel(n)
    @ccall libnotcurses.ncplane_fchannel(n::Ptr{ncplane})::UInt32
end

function ncplane_set_channels(n, channels)
    @ccall libnotcurses.ncplane_set_channels(n::Ptr{ncplane}, channels::UInt64)::Cvoid
end

function ncplane_set_styles(n, stylebits)
    @ccall libnotcurses.ncplane_set_styles(n::Ptr{ncplane}, stylebits::Cuint)::Cvoid
end

function ncplane_on_styles(n, stylebits)
    @ccall libnotcurses.ncplane_on_styles(n::Ptr{ncplane}, stylebits::Cuint)::Cvoid
end

function ncplane_off_styles(n, stylebits)
    @ccall libnotcurses.ncplane_off_styles(n::Ptr{ncplane}, stylebits::Cuint)::Cvoid
end

function ncplane_fg_rgb(n)
    @ccall libnotcurses.ncplane_fg_rgb(n::Ptr{ncplane})::UInt32
end

function ncplane_bg_rgb(n)
    @ccall libnotcurses.ncplane_bg_rgb(n::Ptr{ncplane})::UInt32
end

function ncplane_fg_alpha(n)
    @ccall libnotcurses.ncplane_fg_alpha(n::Ptr{ncplane})::UInt32
end

function ncplane_fg_default_p(n)
    @ccall libnotcurses.ncplane_fg_default_p(n::Ptr{ncplane})::Bool
end

function ncplane_bg_alpha(n)
    @ccall libnotcurses.ncplane_bg_alpha(n::Ptr{ncplane})::UInt32
end

function ncplane_bg_default_p(n)
    @ccall libnotcurses.ncplane_bg_default_p(n::Ptr{ncplane})::Bool
end

function ncplane_fg_rgb8(n, r, g, b)
    @ccall libnotcurses.ncplane_fg_rgb8(n::Ptr{ncplane}, r::Ptr{Cuint}, g::Ptr{Cuint}, b::Ptr{Cuint})::UInt32
end

function ncplane_bg_rgb8(n, r, g, b)
    @ccall libnotcurses.ncplane_bg_rgb8(n::Ptr{ncplane}, r::Ptr{Cuint}, g::Ptr{Cuint}, b::Ptr{Cuint})::UInt32
end

function ncplane_set_fchannel(n, channel)
    @ccall libnotcurses.ncplane_set_fchannel(n::Ptr{ncplane}, channel::UInt32)::UInt64
end

function ncplane_set_bchannel(n, channel)
    @ccall libnotcurses.ncplane_set_bchannel(n::Ptr{ncplane}, channel::UInt32)::UInt64
end

function ncplane_set_fg_rgb8(n, r, g, b)
    @ccall libnotcurses.ncplane_set_fg_rgb8(n::Ptr{ncplane}, r::Cuint, g::Cuint, b::Cuint)::Cint
end

function ncplane_set_bg_rgb8(n, r, g, b)
    @ccall libnotcurses.ncplane_set_bg_rgb8(n::Ptr{ncplane}, r::Cuint, g::Cuint, b::Cuint)::Cint
end

function ncplane_set_bg_rgb8_clipped(n, r, g, b)
    @ccall libnotcurses.ncplane_set_bg_rgb8_clipped(n::Ptr{ncplane}, r::Cint, g::Cint, b::Cint)::Cvoid
end

function ncplane_set_fg_rgb8_clipped(n, r, g, b)
    @ccall libnotcurses.ncplane_set_fg_rgb8_clipped(n::Ptr{ncplane}, r::Cint, g::Cint, b::Cint)::Cvoid
end

function ncplane_set_fg_rgb(n, channel)
    @ccall libnotcurses.ncplane_set_fg_rgb(n::Ptr{ncplane}, channel::UInt32)::Cint
end

function ncplane_set_bg_rgb(n, channel)
    @ccall libnotcurses.ncplane_set_bg_rgb(n::Ptr{ncplane}, channel::UInt32)::Cint
end

function ncplane_set_fg_default(n)
    @ccall libnotcurses.ncplane_set_fg_default(n::Ptr{ncplane})::Cvoid
end

function ncplane_set_bg_default(n)
    @ccall libnotcurses.ncplane_set_bg_default(n::Ptr{ncplane})::Cvoid
end

function ncplane_set_fg_palindex(n, idx)
    @ccall libnotcurses.ncplane_set_fg_palindex(n::Ptr{ncplane}, idx::Cint)::Cint
end

function ncplane_set_bg_palindex(n, idx)
    @ccall libnotcurses.ncplane_set_bg_palindex(n::Ptr{ncplane}, idx::Cint)::Cint
end

function ncplane_set_fg_alpha(n, alpha)
    @ccall libnotcurses.ncplane_set_fg_alpha(n::Ptr{ncplane}, alpha::Cint)::Cint
end

function ncplane_set_bg_alpha(n, alpha)
    @ccall libnotcurses.ncplane_set_bg_alpha(n::Ptr{ncplane}, alpha::Cint)::Cint
end

# typedef int ( * fadecb ) ( struct notcurses * nc , struct ncplane * n , const struct timespec * , void * curry )
const fadecb = Ptr{Cvoid}

function ncplane_fadeout(n, ts, fader, curry)
    @ccall libnotcurses.ncplane_fadeout(n::Ptr{ncplane}, ts::Ptr{Cvoid}, fader::fadecb, curry::Ptr{Cvoid})::Cint
end

function ncplane_fadein(n, ts, fader, curry)
    @ccall libnotcurses.ncplane_fadein(n::Ptr{ncplane}, ts::Ptr{Cvoid}, fader::fadecb, curry::Ptr{Cvoid})::Cint
end

function ncfadectx_setup(n)
    @ccall libnotcurses.ncfadectx_setup(n::Ptr{ncplane})::Ptr{ncfadectx}
end

function ncfadectx_iterations(nctx)
    @ccall libnotcurses.ncfadectx_iterations(nctx::Ptr{ncfadectx})::Cint
end

function ncplane_fadeout_iteration(n, nctx, iter, fader, curry)
    @ccall libnotcurses.ncplane_fadeout_iteration(n::Ptr{ncplane}, nctx::Ptr{ncfadectx}, iter::Cint, fader::fadecb, curry::Ptr{Cvoid})::Cint
end

function ncplane_fadein_iteration(n, nctx, iter, fader, curry)
    @ccall libnotcurses.ncplane_fadein_iteration(n::Ptr{ncplane}, nctx::Ptr{ncfadectx}, iter::Cint, fader::fadecb, curry::Ptr{Cvoid})::Cint
end

function ncplane_pulse(n, ts, fader, curry)
    @ccall libnotcurses.ncplane_pulse(n::Ptr{ncplane}, ts::Ptr{Cvoid}, fader::fadecb, curry::Ptr{Cvoid})::Cint
end

function ncfadectx_free(nctx)
    @ccall libnotcurses.ncfadectx_free(nctx::Ptr{ncfadectx})::Cvoid
end

function nccells_load_box(n, styles, channels, ul, ur, ll, lr, hl, vl, gclusters)
    @ccall libnotcurses.nccells_load_box(n::Ptr{ncplane}, styles::UInt32, channels::UInt64, ul::Ptr{nccell}, ur::Ptr{nccell}, ll::Ptr{nccell}, lr::Ptr{nccell}, hl::Ptr{nccell}, vl::Ptr{nccell}, gclusters::Ptr{Cchar})::Cint
end

function nccells_ascii_box(n, attr, channels, ul, ur, ll, lr, hl, vl)
    @ccall libnotcurses.nccells_ascii_box(n::Ptr{ncplane}, attr::UInt16, channels::UInt64, ul::Ptr{nccell}, ur::Ptr{nccell}, ll::Ptr{nccell}, lr::Ptr{nccell}, hl::Ptr{nccell}, vl::Ptr{nccell})::Cint
end

function nccells_double_box(n, attr, channels, ul, ur, ll, lr, hl, vl)
    @ccall libnotcurses.nccells_double_box(n::Ptr{ncplane}, attr::UInt16, channels::UInt64, ul::Ptr{nccell}, ur::Ptr{nccell}, ll::Ptr{nccell}, lr::Ptr{nccell}, hl::Ptr{nccell}, vl::Ptr{nccell})::Cint
end

function nccells_rounded_box(n, attr, channels, ul, ur, ll, lr, hl, vl)
    @ccall libnotcurses.nccells_rounded_box(n::Ptr{ncplane}, attr::UInt16, channels::UInt64, ul::Ptr{nccell}, ur::Ptr{nccell}, ll::Ptr{nccell}, lr::Ptr{nccell}, hl::Ptr{nccell}, vl::Ptr{nccell})::Cint
end

function nccells_light_box(n, attr, channels, ul, ur, ll, lr, hl, vl)
    @ccall libnotcurses.nccells_light_box(n::Ptr{ncplane}, attr::UInt16, channels::UInt64, ul::Ptr{nccell}, ur::Ptr{nccell}, ll::Ptr{nccell}, lr::Ptr{nccell}, hl::Ptr{nccell}, vl::Ptr{nccell})::Cint
end

function nccells_heavy_box(n, attr, channels, ul, ur, ll, lr, hl, vl)
    @ccall libnotcurses.nccells_heavy_box(n::Ptr{ncplane}, attr::UInt16, channels::UInt64, ul::Ptr{nccell}, ur::Ptr{nccell}, ll::Ptr{nccell}, lr::Ptr{nccell}, hl::Ptr{nccell}, vl::Ptr{nccell})::Cint
end

function ncplane_rounded_box(n, styles, channels, ystop, xstop, ctlword)
    @ccall libnotcurses.ncplane_rounded_box(n::Ptr{ncplane}, styles::UInt16, channels::UInt64, ystop::Cuint, xstop::Cuint, ctlword::Cuint)::Cint
end

function ncplane_perimeter_rounded(n, stylemask, channels, ctlword)
    @ccall libnotcurses.ncplane_perimeter_rounded(n::Ptr{ncplane}, stylemask::UInt16, channels::UInt64, ctlword::Cuint)::Cint
end

function ncplane_rounded_box_sized(n, styles, channels, ylen, xlen, ctlword)
    @ccall libnotcurses.ncplane_rounded_box_sized(n::Ptr{ncplane}, styles::UInt16, channels::UInt64, ylen::Cuint, xlen::Cuint, ctlword::Cuint)::Cint
end

function ncplane_double_box(n, styles, channels, ylen, xlen, ctlword)
    @ccall libnotcurses.ncplane_double_box(n::Ptr{ncplane}, styles::UInt16, channels::UInt64, ylen::Cuint, xlen::Cuint, ctlword::Cuint)::Cint
end

function ncplane_ascii_box(n, styles, channels, ylen, xlen, ctlword)
    @ccall libnotcurses.ncplane_ascii_box(n::Ptr{ncplane}, styles::UInt16, channels::UInt64, ylen::Cuint, xlen::Cuint, ctlword::Cuint)::Cint
end

function ncplane_perimeter_double(n, stylemask, channels, ctlword)
    @ccall libnotcurses.ncplane_perimeter_double(n::Ptr{ncplane}, stylemask::UInt16, channels::UInt64, ctlword::Cuint)::Cint
end

function ncplane_double_box_sized(n, styles, channels, ylen, xlen, ctlword)
    @ccall libnotcurses.ncplane_double_box_sized(n::Ptr{ncplane}, styles::UInt16, channels::UInt64, ylen::Cuint, xlen::Cuint, ctlword::Cuint)::Cint
end

function ncvisual_from_file(file)
    @ccall libnotcurses.ncvisual_from_file(file::Ptr{Cchar})::Ptr{ncvisual}
end

function ncvisual_from_rgba(rgba, rows, rowstride, cols)
    @ccall libnotcurses.ncvisual_from_rgba(rgba::Ptr{Cvoid}, rows::Cint, rowstride::Cint, cols::Cint)::Ptr{ncvisual}
end

function ncvisual_from_rgb_packed(rgba, rows, rowstride, cols, alpha)
    @ccall libnotcurses.ncvisual_from_rgb_packed(rgba::Ptr{Cvoid}, rows::Cint, rowstride::Cint, cols::Cint, alpha::Cint)::Ptr{ncvisual}
end

function ncvisual_from_rgb_loose(rgba, rows, rowstride, cols, alpha)
    @ccall libnotcurses.ncvisual_from_rgb_loose(rgba::Ptr{Cvoid}, rows::Cint, rowstride::Cint, cols::Cint, alpha::Cint)::Ptr{ncvisual}
end

function ncvisual_from_bgra(bgra, rows, rowstride, cols)
    @ccall libnotcurses.ncvisual_from_bgra(bgra::Ptr{Cvoid}, rows::Cint, rowstride::Cint, cols::Cint)::Ptr{ncvisual}
end

function ncvisual_from_palidx(data, rows, rowstride, cols, palsize, pstride, palette)
    @ccall libnotcurses.ncvisual_from_palidx(data::Ptr{Cvoid}, rows::Cint, rowstride::Cint, cols::Cint, palsize::Cint, pstride::Cint, palette::Ptr{UInt32})::Ptr{ncvisual}
end

function ncvisual_from_plane(n, blit, begy, begx, leny, lenx)
    @ccall libnotcurses.ncvisual_from_plane(n::Ptr{ncplane}, blit::ncblitter_e, begy::Cint, begx::Cint, leny::Cuint, lenx::Cuint)::Ptr{ncvisual}
end

struct ncvisual_options
    n::Ptr{ncplane}
    scaling::ncscale_e
    y::Cint
    x::Cint
    begy::Cuint
    begx::Cuint
    leny::Cuint
    lenx::Cuint
    blitter::ncblitter_e
    flags::UInt64
    transcolor::UInt32
    pxoffy::Cuint
    pxoffx::Cuint
end

struct ncvgeom
    pixy::Cuint
    pixx::Cuint
    cdimy::Cuint
    cdimx::Cuint
    rpixy::Cuint
    rpixx::Cuint
    rcelly::Cuint
    rcellx::Cuint
    scaley::Cuint
    scalex::Cuint
    begy::Cuint
    begx::Cuint
    leny::Cuint
    lenx::Cuint
    maxpixely::Cuint
    maxpixelx::Cuint
    blitter::ncblitter_e
end

function ncvisual_geom(nc, n, vopts, geom)
    @ccall libnotcurses.ncvisual_geom(nc::Ptr{notcurses}, n::Ptr{ncvisual}, vopts::Ptr{ncvisual_options}, geom::Ptr{ncvgeom})::Cint
end

function ncvisual_destroy(ncv)
    @ccall libnotcurses.ncvisual_destroy(ncv::Ptr{ncvisual})::Cvoid
end

function ncvisual_decode(nc)
    @ccall libnotcurses.ncvisual_decode(nc::Ptr{ncvisual})::Cint
end

function ncvisual_decode_loop(nc)
    @ccall libnotcurses.ncvisual_decode_loop(nc::Ptr{ncvisual})::Cint
end

function ncvisual_rotate(n, rads)
    @ccall libnotcurses.ncvisual_rotate(n::Ptr{ncvisual}, rads::Cdouble)::Cint
end

function ncvisual_resize(n, rows, cols)
    @ccall libnotcurses.ncvisual_resize(n::Ptr{ncvisual}, rows::Cint, cols::Cint)::Cint
end

function ncvisual_resize_noninterpolative(n, rows, cols)
    @ccall libnotcurses.ncvisual_resize_noninterpolative(n::Ptr{ncvisual}, rows::Cint, cols::Cint)::Cint
end

function ncvisual_polyfill_yx(n, y, x, rgba)
    @ccall libnotcurses.ncvisual_polyfill_yx(n::Ptr{ncvisual}, y::Cuint, x::Cuint, rgba::UInt32)::Cint
end

function ncvisual_at_yx(n, y, x, pixel)
    @ccall libnotcurses.ncvisual_at_yx(n::Ptr{ncvisual}, y::Cuint, x::Cuint, pixel::Ptr{UInt32})::Cint
end

function ncvisual_set_yx(n, y, x, pixel)
    @ccall libnotcurses.ncvisual_set_yx(n::Ptr{ncvisual}, y::Cuint, x::Cuint, pixel::UInt32)::Cint
end

function ncvisual_blit(nc, ncv, vopts)
    @ccall libnotcurses.ncvisual_blit(nc::Ptr{notcurses}, ncv::Ptr{ncvisual}, vopts::Ptr{ncvisual_options})::Ptr{ncplane}
end

function ncvisualplane_create(nc, opts, ncv, vopts)
    @ccall libnotcurses.ncvisualplane_create(nc::Ptr{notcurses}, opts::Ptr{ncplane_options}, ncv::Ptr{ncvisual}, vopts::Ptr{ncvisual_options})::Ptr{ncplane}
end

function ncvisual_subtitle_plane(parent, ncv)
    @ccall libnotcurses.ncvisual_subtitle_plane(parent::Ptr{ncplane}, ncv::Ptr{ncvisual})::Ptr{ncplane}
end

function ncvisual_media_defblitter(nc, scale)
    @ccall libnotcurses.ncvisual_media_defblitter(nc::Ptr{notcurses}, scale::ncscale_e)::ncblitter_e
end

# typedef int ( * ncstreamcb ) ( struct ncvisual * , struct ncvisual_options * , const struct timespec * , void * )
const ncstreamcb = Ptr{Cvoid}

function ncvisual_simple_streamer(ncv, vopts, tspec, curry)
    @ccall libnotcurses.ncvisual_simple_streamer(ncv::Ptr{ncvisual}, vopts::Ptr{ncvisual_options}, tspec::Ptr{Cvoid}, curry::Ptr{Cvoid})::Cint
end

function ncvisual_stream(nc, ncv, timescale, streamer, vopts, curry)
    @ccall libnotcurses.ncvisual_stream(nc::Ptr{notcurses}, ncv::Ptr{ncvisual}, timescale::Cfloat, streamer::ncstreamcb, vopts::Ptr{ncvisual_options}, curry::Ptr{Cvoid})::Cint
end

function ncblit_rgba(data, linesize, vopts)
    @ccall libnotcurses.ncblit_rgba(data::Ptr{Cvoid}, linesize::Cint, vopts::Ptr{ncvisual_options})::Cint
end

function ncblit_bgrx(data, linesize, vopts)
    @ccall libnotcurses.ncblit_bgrx(data::Ptr{Cvoid}, linesize::Cint, vopts::Ptr{ncvisual_options})::Cint
end

function ncblit_rgb_packed(data, linesize, vopts, alpha)
    @ccall libnotcurses.ncblit_rgb_packed(data::Ptr{Cvoid}, linesize::Cint, vopts::Ptr{ncvisual_options}, alpha::Cint)::Cint
end

function ncblit_rgb_loose(data, linesize, vopts, alpha)
    @ccall libnotcurses.ncblit_rgb_loose(data::Ptr{Cvoid}, linesize::Cint, vopts::Ptr{ncvisual_options}, alpha::Cint)::Cint
end

function ncpixel_a(pixel)
    @ccall libnotcurses.ncpixel_a(pixel::UInt32)::Cuint
end

function ncpixel_r(pixel)
    @ccall libnotcurses.ncpixel_r(pixel::UInt32)::Cuint
end

function ncpixel_g(pixel)
    @ccall libnotcurses.ncpixel_g(pixel::UInt32)::Cuint
end

function ncpixel_b(pixel)
    @ccall libnotcurses.ncpixel_b(pixel::UInt32)::Cuint
end

function ncpixel_set_a(pixel, a)
    @ccall libnotcurses.ncpixel_set_a(pixel::Ptr{UInt32}, a::Cuint)::Cint
end

function ncpixel_set_r(pixel, r)
    @ccall libnotcurses.ncpixel_set_r(pixel::Ptr{UInt32}, r::Cuint)::Cint
end

function ncpixel_set_g(pixel, g)
    @ccall libnotcurses.ncpixel_set_g(pixel::Ptr{UInt32}, g::Cuint)::Cint
end

function ncpixel_set_b(pixel, b)
    @ccall libnotcurses.ncpixel_set_b(pixel::Ptr{UInt32}, b::Cuint)::Cint
end

function ncpixel(r, g, b)
    @ccall libnotcurses.ncpixel(r::Cint, g::Cint, b::Cint)::UInt32
end

function ncpixel_set_rgb8(pixel, r, g, b)
    @ccall libnotcurses.ncpixel_set_rgb8(pixel::Ptr{UInt32}, r::Cuint, g::Cuint, b::Cuint)::Cint
end

struct ncreel_options
    bordermask::Cuint
    borderchan::UInt64
    tabletmask::Cuint
    tabletchan::UInt64
    focusedchan::UInt64
    flags::UInt64
end

function ncreel_create(n, popts)
    @ccall libnotcurses.ncreel_create(n::Ptr{ncplane}, popts::Ptr{ncreel_options})::Ptr{ncreel}
end

function ncreel_plane(nr)
    @ccall libnotcurses.ncreel_plane(nr::Ptr{ncreel})::Ptr{ncplane}
end

# typedef int ( * tabletcb ) ( struct nctablet * t , bool drawfromtop )
const tabletcb = Ptr{Cvoid}

function ncreel_add(nr, after, before, cb, opaque)
    @ccall libnotcurses.ncreel_add(nr::Ptr{ncreel}, after::Ptr{nctablet}, before::Ptr{nctablet}, cb::tabletcb, opaque::Ptr{Cvoid})::Ptr{nctablet}
end

function ncreel_tabletcount(nr)
    @ccall libnotcurses.ncreel_tabletcount(nr::Ptr{ncreel})::Cint
end

function ncreel_del(nr, t)
    @ccall libnotcurses.ncreel_del(nr::Ptr{ncreel}, t::Ptr{nctablet})::Cint
end

function ncreel_redraw(nr)
    @ccall libnotcurses.ncreel_redraw(nr::Ptr{ncreel})::Cint
end

function ncreel_offer_input(nr, ni)
    @ccall libnotcurses.ncreel_offer_input(nr::Ptr{ncreel}, ni::Ptr{ncinput})::Bool
end

function ncreel_focused(nr)
    @ccall libnotcurses.ncreel_focused(nr::Ptr{ncreel})::Ptr{nctablet}
end

function ncreel_next(nr)
    @ccall libnotcurses.ncreel_next(nr::Ptr{ncreel})::Ptr{nctablet}
end

function ncreel_prev(nr)
    @ccall libnotcurses.ncreel_prev(nr::Ptr{ncreel})::Ptr{nctablet}
end

function ncreel_destroy(nr)
    @ccall libnotcurses.ncreel_destroy(nr::Ptr{ncreel})::Cvoid
end

function nctablet_userptr(t)
    @ccall libnotcurses.nctablet_userptr(t::Ptr{nctablet})::Ptr{Cvoid}
end

function nctablet_plane(t)
    @ccall libnotcurses.nctablet_plane(t::Ptr{nctablet})::Ptr{ncplane}
end

function ncnmetric(val, s, decimal, buf, omitdec, mult, uprefix)
    @ccall libnotcurses.ncnmetric(val::uintmax_t, s::Csize_t, decimal::uintmax_t, buf::Ptr{Cchar}, omitdec::Cint, mult::uintmax_t, uprefix::Cint)::Ptr{Cchar}
end

function ncqprefix(val, decimal, buf, omitdec)
    @ccall libnotcurses.ncqprefix(val::uintmax_t, decimal::uintmax_t, buf::Ptr{Cchar}, omitdec::Cint)::Ptr{Cchar}
end

function nciprefix(val, decimal, buf, omitdec)
    @ccall libnotcurses.nciprefix(val::uintmax_t, decimal::uintmax_t, buf::Ptr{Cchar}, omitdec::Cint)::Ptr{Cchar}
end

function ncbprefix(val, decimal, buf, omitdec)
    @ccall libnotcurses.ncbprefix(val::uintmax_t, decimal::uintmax_t, buf::Ptr{Cchar}, omitdec::Cint)::Ptr{Cchar}
end

function notcurses_default_foreground(nc, fg)
    @ccall libnotcurses.notcurses_default_foreground(nc::Ptr{notcurses}, fg::Ptr{UInt32})::Cint
end

function notcurses_default_background(nc, bg)
    @ccall libnotcurses.notcurses_default_background(nc::Ptr{notcurses}, bg::Ptr{UInt32})::Cint
end

function notcurses_cursor_enable(nc, y, x)
    @ccall libnotcurses.notcurses_cursor_enable(nc::Ptr{notcurses}, y::Cint, x::Cint)::Cint
end

function notcurses_cursor_disable(nc)
    @ccall libnotcurses.notcurses_cursor_disable(nc::Ptr{notcurses})::Cint
end

function notcurses_cursor_yx(nc, y, x)
    @ccall libnotcurses.notcurses_cursor_yx(nc::Ptr{notcurses}, y::Ptr{Cint}, x::Ptr{Cint})::Cint
end

function ncplane_greyscale(n)
    @ccall libnotcurses.ncplane_greyscale(n::Ptr{ncplane})::Cvoid
end

struct ncselector_item
    option::Ptr{Cchar}
    desc::Ptr{Cchar}
end

struct ncselector_options
    title::Ptr{Cchar}
    secondary::Ptr{Cchar}
    footer::Ptr{Cchar}
    items::Ptr{ncselector_item}
    defidx::Cuint
    maxdisplay::Cuint
    opchannels::UInt64
    descchannels::UInt64
    titlechannels::UInt64
    footchannels::UInt64
    boxchannels::UInt64
    flags::UInt64
end

function ncselector_create(n, opts)
    @ccall libnotcurses.ncselector_create(n::Ptr{ncplane}, opts::Ptr{ncselector_options})::Ptr{ncselector}
end

function ncselector_additem(n, item)
    @ccall libnotcurses.ncselector_additem(n::Ptr{ncselector}, item::Ptr{ncselector_item})::Cint
end

function ncselector_delitem(n, item)
    @ccall libnotcurses.ncselector_delitem(n::Ptr{ncselector}, item::Ptr{Cchar})::Cint
end

function ncselector_selected(n)
    @ccall libnotcurses.ncselector_selected(n::Ptr{ncselector})::Ptr{Cchar}
end

function ncselector_plane(n)
    @ccall libnotcurses.ncselector_plane(n::Ptr{ncselector})::Ptr{ncplane}
end

function ncselector_previtem(n)
    @ccall libnotcurses.ncselector_previtem(n::Ptr{ncselector})::Ptr{Cchar}
end

function ncselector_nextitem(n)
    @ccall libnotcurses.ncselector_nextitem(n::Ptr{ncselector})::Ptr{Cchar}
end

function ncselector_offer_input(n, nc)
    @ccall libnotcurses.ncselector_offer_input(n::Ptr{ncselector}, nc::Ptr{ncinput})::Bool
end

function ncselector_destroy(n, item)
    @ccall libnotcurses.ncselector_destroy(n::Ptr{ncselector}, item::Ptr{Ptr{Cchar}})::Cvoid
end

struct ncmselector_item
    option::Ptr{Cchar}
    desc::Ptr{Cchar}
    selected::Bool
end

struct ncmultiselector_options
    title::Ptr{Cchar}
    secondary::Ptr{Cchar}
    footer::Ptr{Cchar}
    items::Ptr{ncmselector_item}
    maxdisplay::Cuint
    opchannels::UInt64
    descchannels::UInt64
    titlechannels::UInt64
    footchannels::UInt64
    boxchannels::UInt64
    flags::UInt64
end

function ncmultiselector_create(n, opts)
    @ccall libnotcurses.ncmultiselector_create(n::Ptr{ncplane}, opts::Ptr{ncmultiselector_options})::Ptr{ncmultiselector}
end

function ncmultiselector_selected(n, selected, count)
    @ccall libnotcurses.ncmultiselector_selected(n::Ptr{ncmultiselector}, selected::Ptr{Bool}, count::Cuint)::Cint
end

function ncmultiselector_plane(n)
    @ccall libnotcurses.ncmultiselector_plane(n::Ptr{ncmultiselector})::Ptr{ncplane}
end

function ncmultiselector_offer_input(n, nc)
    @ccall libnotcurses.ncmultiselector_offer_input(n::Ptr{ncmultiselector}, nc::Ptr{ncinput})::Bool
end

function ncmultiselector_destroy(n)
    @ccall libnotcurses.ncmultiselector_destroy(n::Ptr{ncmultiselector})::Cvoid
end

struct nctree_item
    curry::Ptr{Cvoid}
    subs::Ptr{nctree_item}
    subcount::Cuint
end

struct nctree_options
    items::Ptr{nctree_item}
    count::Cuint
    nctreecb::Ptr{Cvoid}
    indentcols::Cint
    flags::UInt64
end

mutable struct nctree end

function nctree_create(n, opts)
    @ccall libnotcurses.nctree_create(n::Ptr{ncplane}, opts::Ptr{nctree_options})::Ptr{nctree}
end

function nctree_plane(n)
    @ccall libnotcurses.nctree_plane(n::Ptr{nctree})::Ptr{ncplane}
end

function nctree_redraw(n)
    @ccall libnotcurses.nctree_redraw(n::Ptr{nctree})::Cint
end

function nctree_offer_input(n, ni)
    @ccall libnotcurses.nctree_offer_input(n::Ptr{nctree}, ni::Ptr{ncinput})::Bool
end

function nctree_focused(n)
    @ccall libnotcurses.nctree_focused(n::Ptr{nctree})::Ptr{Cvoid}
end

function nctree_next(n)
    @ccall libnotcurses.nctree_next(n::Ptr{nctree})::Ptr{Cvoid}
end

function nctree_prev(n)
    @ccall libnotcurses.nctree_prev(n::Ptr{nctree})::Ptr{Cvoid}
end

function nctree_goto(n, spec, failspec)
    @ccall libnotcurses.nctree_goto(n::Ptr{nctree}, spec::Ptr{Cuint}, failspec::Ptr{Cint})::Ptr{Cvoid}
end

function nctree_add(n, spec, add)
    @ccall libnotcurses.nctree_add(n::Ptr{nctree}, spec::Ptr{Cuint}, add::Ptr{nctree_item})::Cint
end

function nctree_del(n, spec)
    @ccall libnotcurses.nctree_del(n::Ptr{nctree}, spec::Ptr{Cuint})::Cint
end

function nctree_destroy(n)
    @ccall libnotcurses.nctree_destroy(n::Ptr{nctree})::Cvoid
end

struct ncmenu_item
    desc::Ptr{Cchar}
    shortcut::ncinput
end

struct ncmenu_section
    name::Ptr{Cchar}
    itemcount::Cint
    items::Ptr{ncmenu_item}
    shortcut::ncinput
end

struct ncmenu_options
    sections::Ptr{ncmenu_section}
    sectioncount::Cint
    headerchannels::UInt64
    sectionchannels::UInt64
    flags::UInt64
end

mutable struct ncmenu end

function ncmenu_create(n, opts)
    @ccall libnotcurses.ncmenu_create(n::Ptr{ncplane}, opts::Ptr{ncmenu_options})::Ptr{ncmenu}
end

function ncmenu_unroll(n, sectionidx)
    @ccall libnotcurses.ncmenu_unroll(n::Ptr{ncmenu}, sectionidx::Cint)::Cint
end

function ncmenu_rollup(n)
    @ccall libnotcurses.ncmenu_rollup(n::Ptr{ncmenu})::Cint
end

function ncmenu_nextsection(n)
    @ccall libnotcurses.ncmenu_nextsection(n::Ptr{ncmenu})::Cint
end

function ncmenu_prevsection(n)
    @ccall libnotcurses.ncmenu_prevsection(n::Ptr{ncmenu})::Cint
end

function ncmenu_nextitem(n)
    @ccall libnotcurses.ncmenu_nextitem(n::Ptr{ncmenu})::Cint
end

function ncmenu_previtem(n)
    @ccall libnotcurses.ncmenu_previtem(n::Ptr{ncmenu})::Cint
end

function ncmenu_item_set_status(n, section, item, enabled)
    @ccall libnotcurses.ncmenu_item_set_status(n::Ptr{ncmenu}, section::Ptr{Cchar}, item::Ptr{Cchar}, enabled::Bool)::Cint
end

function ncmenu_selected(n, ni)
    @ccall libnotcurses.ncmenu_selected(n::Ptr{ncmenu}, ni::Ptr{ncinput})::Ptr{Cchar}
end

function ncmenu_mouse_selected(n, click, ni)
    @ccall libnotcurses.ncmenu_mouse_selected(n::Ptr{ncmenu}, click::Ptr{ncinput}, ni::Ptr{ncinput})::Ptr{Cchar}
end

function ncmenu_plane(n)
    @ccall libnotcurses.ncmenu_plane(n::Ptr{ncmenu})::Ptr{ncplane}
end

function ncmenu_offer_input(n, nc)
    @ccall libnotcurses.ncmenu_offer_input(n::Ptr{ncmenu}, nc::Ptr{ncinput})::Bool
end

function ncmenu_destroy(n)
    @ccall libnotcurses.ncmenu_destroy(n::Ptr{ncmenu})::Cvoid
end

struct ncprogbar_options
    ulchannel::UInt32
    urchannel::UInt32
    blchannel::UInt32
    brchannel::UInt32
    flags::UInt64
end

function ncprogbar_create(n, opts)
    @ccall libnotcurses.ncprogbar_create(n::Ptr{ncplane}, opts::Ptr{ncprogbar_options})::Ptr{ncprogbar}
end

function ncprogbar_plane(n)
    @ccall libnotcurses.ncprogbar_plane(n::Ptr{ncprogbar})::Ptr{ncplane}
end

function ncprogbar_set_progress(n, p)
    @ccall libnotcurses.ncprogbar_set_progress(n::Ptr{ncprogbar}, p::Cdouble)::Cint
end

function ncprogbar_progress(n)
    @ccall libnotcurses.ncprogbar_progress(n::Ptr{ncprogbar})::Cdouble
end

function ncprogbar_destroy(n)
    @ccall libnotcurses.ncprogbar_destroy(n::Ptr{ncprogbar})::Cvoid
end

struct nctabbed_options
    selchan::UInt64
    hdrchan::UInt64
    sepchan::UInt64
    separator::Ptr{Cchar}
    flags::UInt64
end

# typedef void ( * tabcb ) ( struct nctab * t , struct ncplane * ncp , void * curry )
const tabcb = Ptr{Cvoid}

function nctabbed_create(n, opts)
    @ccall libnotcurses.nctabbed_create(n::Ptr{ncplane}, opts::Ptr{nctabbed_options})::Ptr{nctabbed}
end

function nctabbed_destroy(nt)
    @ccall libnotcurses.nctabbed_destroy(nt::Ptr{nctabbed})::Cvoid
end

function nctabbed_redraw(nt)
    @ccall libnotcurses.nctabbed_redraw(nt::Ptr{nctabbed})::Cvoid
end

function nctabbed_ensure_selected_header_visible(nt)
    @ccall libnotcurses.nctabbed_ensure_selected_header_visible(nt::Ptr{nctabbed})::Cvoid
end

function nctabbed_selected(nt)
    @ccall libnotcurses.nctabbed_selected(nt::Ptr{nctabbed})::Ptr{nctab}
end

function nctabbed_leftmost(nt)
    @ccall libnotcurses.nctabbed_leftmost(nt::Ptr{nctabbed})::Ptr{nctab}
end

function nctabbed_tabcount(nt)
    @ccall libnotcurses.nctabbed_tabcount(nt::Ptr{nctabbed})::Cint
end

function nctabbed_plane(nt)
    @ccall libnotcurses.nctabbed_plane(nt::Ptr{nctabbed})::Ptr{ncplane}
end

function nctabbed_content_plane(nt)
    @ccall libnotcurses.nctabbed_content_plane(nt::Ptr{nctabbed})::Ptr{ncplane}
end

function nctab_cb(t)
    @ccall libnotcurses.nctab_cb(t::Ptr{nctab})::tabcb
end

function nctab_name(t)
    @ccall libnotcurses.nctab_name(t::Ptr{nctab})::Ptr{Cchar}
end

function nctab_name_width(t)
    @ccall libnotcurses.nctab_name_width(t::Ptr{nctab})::Cint
end

function nctab_userptr(t)
    @ccall libnotcurses.nctab_userptr(t::Ptr{nctab})::Ptr{Cvoid}
end

function nctab_next(t)
    @ccall libnotcurses.nctab_next(t::Ptr{nctab})::Ptr{nctab}
end

function nctab_prev(t)
    @ccall libnotcurses.nctab_prev(t::Ptr{nctab})::Ptr{nctab}
end

function nctabbed_add(nt, after, before, tcb, name, opaque)
    @ccall libnotcurses.nctabbed_add(nt::Ptr{nctabbed}, after::Ptr{nctab}, before::Ptr{nctab}, tcb::tabcb, name::Ptr{Cchar}, opaque::Ptr{Cvoid})::Ptr{nctab}
end

function nctabbed_del(nt, t)
    @ccall libnotcurses.nctabbed_del(nt::Ptr{nctabbed}, t::Ptr{nctab})::Cint
end

function nctab_move(nt, t, after, before)
    @ccall libnotcurses.nctab_move(nt::Ptr{nctabbed}, t::Ptr{nctab}, after::Ptr{nctab}, before::Ptr{nctab})::Cint
end

function nctab_move_right(nt, t)
    @ccall libnotcurses.nctab_move_right(nt::Ptr{nctabbed}, t::Ptr{nctab})::Cvoid
end

function nctab_move_left(nt, t)
    @ccall libnotcurses.nctab_move_left(nt::Ptr{nctabbed}, t::Ptr{nctab})::Cvoid
end

function nctabbed_rotate(nt, amt)
    @ccall libnotcurses.nctabbed_rotate(nt::Ptr{nctabbed}, amt::Cint)::Cvoid
end

function nctabbed_next(nt)
    @ccall libnotcurses.nctabbed_next(nt::Ptr{nctabbed})::Ptr{nctab}
end

function nctabbed_prev(nt)
    @ccall libnotcurses.nctabbed_prev(nt::Ptr{nctabbed})::Ptr{nctab}
end

function nctabbed_select(nt, t)
    @ccall libnotcurses.nctabbed_select(nt::Ptr{nctabbed}, t::Ptr{nctab})::Ptr{nctab}
end

function nctabbed_channels(nt, hdrchan, selchan, sepchan)
    @ccall libnotcurses.nctabbed_channels(nt::Ptr{nctabbed}, hdrchan::Ptr{UInt64}, selchan::Ptr{UInt64}, sepchan::Ptr{UInt64})::Cvoid
end

function nctabbed_hdrchan(nt)
    @ccall libnotcurses.nctabbed_hdrchan(nt::Ptr{nctabbed})::UInt64
end

function nctabbed_selchan(nt)
    @ccall libnotcurses.nctabbed_selchan(nt::Ptr{nctabbed})::UInt64
end

function nctabbed_sepchan(nt)
    @ccall libnotcurses.nctabbed_sepchan(nt::Ptr{nctabbed})::UInt64
end

function nctabbed_separator(nt)
    @ccall libnotcurses.nctabbed_separator(nt::Ptr{nctabbed})::Ptr{Cchar}
end

function nctabbed_separator_width(nt)
    @ccall libnotcurses.nctabbed_separator_width(nt::Ptr{nctabbed})::Cint
end

function nctabbed_set_hdrchan(nt, chan)
    @ccall libnotcurses.nctabbed_set_hdrchan(nt::Ptr{nctabbed}, chan::UInt64)::Cvoid
end

function nctabbed_set_selchan(nt, chan)
    @ccall libnotcurses.nctabbed_set_selchan(nt::Ptr{nctabbed}, chan::UInt64)::Cvoid
end

function nctabbed_set_sepchan(nt, chan)
    @ccall libnotcurses.nctabbed_set_sepchan(nt::Ptr{nctabbed}, chan::UInt64)::Cvoid
end

function nctab_set_cb(t, newcb)
    @ccall libnotcurses.nctab_set_cb(t::Ptr{nctab}, newcb::tabcb)::tabcb
end

function nctab_set_name(t, newname)
    @ccall libnotcurses.nctab_set_name(t::Ptr{nctab}, newname::Ptr{Cchar})::Cint
end

function nctab_set_userptr(t, newopaque)
    @ccall libnotcurses.nctab_set_userptr(t::Ptr{nctab}, newopaque::Ptr{Cvoid})::Ptr{Cvoid}
end

function nctabbed_set_separator(nt, separator)
    @ccall libnotcurses.nctabbed_set_separator(nt::Ptr{nctabbed}, separator::Ptr{Cchar})::Cint
end

struct ncplot_options
    maxchannels::UInt64
    minchannels::UInt64
    legendstyle::UInt16
    gridtype::ncblitter_e
    rangex::Cint
    title::Ptr{Cchar}
    flags::UInt64
end

function ncuplot_create(n, opts, miny, maxy)
    @ccall libnotcurses.ncuplot_create(n::Ptr{ncplane}, opts::Ptr{ncplot_options}, miny::UInt64, maxy::UInt64)::Ptr{ncuplot}
end

function ncdplot_create(n, opts, miny, maxy)
    @ccall libnotcurses.ncdplot_create(n::Ptr{ncplane}, opts::Ptr{ncplot_options}, miny::Cdouble, maxy::Cdouble)::Ptr{ncdplot}
end

function ncuplot_plane(n)
    @ccall libnotcurses.ncuplot_plane(n::Ptr{ncuplot})::Ptr{ncplane}
end

function ncdplot_plane(n)
    @ccall libnotcurses.ncdplot_plane(n::Ptr{ncdplot})::Ptr{ncplane}
end

function ncuplot_add_sample(n, x, y)
    @ccall libnotcurses.ncuplot_add_sample(n::Ptr{ncuplot}, x::UInt64, y::UInt64)::Cint
end

function ncdplot_add_sample(n, x, y)
    @ccall libnotcurses.ncdplot_add_sample(n::Ptr{ncdplot}, x::UInt64, y::Cdouble)::Cint
end

function ncuplot_set_sample(n, x, y)
    @ccall libnotcurses.ncuplot_set_sample(n::Ptr{ncuplot}, x::UInt64, y::UInt64)::Cint
end

function ncdplot_set_sample(n, x, y)
    @ccall libnotcurses.ncdplot_set_sample(n::Ptr{ncdplot}, x::UInt64, y::Cdouble)::Cint
end

function ncuplot_sample(n, x, y)
    @ccall libnotcurses.ncuplot_sample(n::Ptr{ncuplot}, x::UInt64, y::Ptr{UInt64})::Cint
end

function ncdplot_sample(n, x, y)
    @ccall libnotcurses.ncdplot_sample(n::Ptr{ncdplot}, x::UInt64, y::Ptr{Cdouble})::Cint
end

function ncuplot_destroy(n)
    @ccall libnotcurses.ncuplot_destroy(n::Ptr{ncuplot})::Cvoid
end

function ncdplot_destroy(n)
    @ccall libnotcurses.ncdplot_destroy(n::Ptr{ncdplot})::Cvoid
end

# typedef int ( * ncfdplane_callback ) ( struct ncfdplane * n , const void * buf , size_t s , void * curry )
const ncfdplane_callback = Ptr{Cvoid}

# typedef int ( * ncfdplane_done_cb ) ( struct ncfdplane * n , int fderrno , void * curry )
const ncfdplane_done_cb = Ptr{Cvoid}

struct ncfdplane_options
    curry::Ptr{Cvoid}
    follow::Bool
    flags::UInt64
end

function ncfdplane_create(n, opts, fd, cbfxn, donecbfxn)
    @ccall libnotcurses.ncfdplane_create(n::Ptr{ncplane}, opts::Ptr{ncfdplane_options}, fd::Cint, cbfxn::ncfdplane_callback, donecbfxn::ncfdplane_done_cb)::Ptr{ncfdplane}
end

function ncfdplane_plane(n)
    @ccall libnotcurses.ncfdplane_plane(n::Ptr{ncfdplane})::Ptr{ncplane}
end

function ncfdplane_destroy(n)
    @ccall libnotcurses.ncfdplane_destroy(n::Ptr{ncfdplane})::Cint
end

struct ncsubproc_options
    curry::Ptr{Cvoid}
    restart_period::UInt64
    flags::UInt64
end

function ncsubproc_createv(n, opts, bin, arg, cbfxn, donecbfxn)
    @ccall libnotcurses.ncsubproc_createv(n::Ptr{ncplane}, opts::Ptr{ncsubproc_options}, bin::Ptr{Cchar}, arg::Ptr{Ptr{Cchar}}, cbfxn::ncfdplane_callback, donecbfxn::ncfdplane_done_cb)::Ptr{ncsubproc}
end

function ncsubproc_createvp(n, opts, bin, arg, cbfxn, donecbfxn)
    @ccall libnotcurses.ncsubproc_createvp(n::Ptr{ncplane}, opts::Ptr{ncsubproc_options}, bin::Ptr{Cchar}, arg::Ptr{Ptr{Cchar}}, cbfxn::ncfdplane_callback, donecbfxn::ncfdplane_done_cb)::Ptr{ncsubproc}
end

function ncsubproc_createvpe(n, opts, bin, arg, env, cbfxn, donecbfxn)
    @ccall libnotcurses.ncsubproc_createvpe(n::Ptr{ncplane}, opts::Ptr{ncsubproc_options}, bin::Ptr{Cchar}, arg::Ptr{Ptr{Cchar}}, env::Ptr{Ptr{Cchar}}, cbfxn::ncfdplane_callback, donecbfxn::ncfdplane_done_cb)::Ptr{ncsubproc}
end

function ncsubproc_plane(n)
    @ccall libnotcurses.ncsubproc_plane(n::Ptr{ncsubproc})::Ptr{ncplane}
end

function ncsubproc_destroy(n)
    @ccall libnotcurses.ncsubproc_destroy(n::Ptr{ncsubproc})::Cint
end

function ncplane_qrcode(n, ymax, xmax, data, len)
    @ccall libnotcurses.ncplane_qrcode(n::Ptr{ncplane}, ymax::Ptr{Cuint}, xmax::Ptr{Cuint}, data::Ptr{Cvoid}, len::Csize_t)::Cint
end

struct ncreader_options
    tchannels::UInt64
    tattrword::UInt32
    flags::UInt64
end

function ncreader_create(n, opts)
    @ccall libnotcurses.ncreader_create(n::Ptr{ncplane}, opts::Ptr{ncreader_options})::Ptr{ncreader}
end

function ncreader_clear(n)
    @ccall libnotcurses.ncreader_clear(n::Ptr{ncreader})::Cint
end

function ncreader_plane(n)
    @ccall libnotcurses.ncreader_plane(n::Ptr{ncreader})::Ptr{ncplane}
end

function ncreader_offer_input(n, ni)
    @ccall libnotcurses.ncreader_offer_input(n::Ptr{ncreader}, ni::Ptr{ncinput})::Bool
end

function ncreader_move_left(n)
    @ccall libnotcurses.ncreader_move_left(n::Ptr{ncreader})::Cint
end

function ncreader_move_right(n)
    @ccall libnotcurses.ncreader_move_right(n::Ptr{ncreader})::Cint
end

function ncreader_move_up(n)
    @ccall libnotcurses.ncreader_move_up(n::Ptr{ncreader})::Cint
end

function ncreader_move_down(n)
    @ccall libnotcurses.ncreader_move_down(n::Ptr{ncreader})::Cint
end

function ncreader_write_egc(n, egc)
    @ccall libnotcurses.ncreader_write_egc(n::Ptr{ncreader}, egc::Ptr{Cchar})::Cint
end

function ncreader_contents(n)
    @ccall libnotcurses.ncreader_contents(n::Ptr{ncreader})::Ptr{Cchar}
end

function ncreader_destroy(n, contents)
    @ccall libnotcurses.ncreader_destroy(n::Ptr{ncreader}, contents::Ptr{Ptr{Cchar}})::Cvoid
end

function notcurses_accountname()
    @ccall libnotcurses.notcurses_accountname()::Ptr{Cchar}
end

function notcurses_hostname()
    @ccall libnotcurses.notcurses_hostname()::Ptr{Cchar}
end

function notcurses_osversion()
    @ccall libnotcurses.notcurses_osversion()::Ptr{Cchar}
end

function notcurses_debug(nc, debugfp)
    @ccall libnotcurses.notcurses_debug(nc::Ptr{notcurses}, debugfp::Ptr{Libc.FILE})::Cvoid
end

function ncdirect_init(termtype, fp, flags)
    @ccall libnotcurses.ncdirect_init(termtype::Ptr{Cchar}, fp::Ptr{Libc.FILE}, flags::UInt64)::Ptr{ncdirect}
end

function ncdirect_core_init(termtype, fp, flags)
    @ccall libnotcurses.ncdirect_core_init(termtype::Ptr{Cchar}, fp::Ptr{Libc.FILE}, flags::UInt64)::Ptr{ncdirect}
end

function ncdirect_readline(nc, prompt)
    @ccall libnotcurses.ncdirect_readline(nc::Ptr{ncdirect}, prompt::Ptr{Cchar})::Ptr{Cchar}
end

function ncdirect_set_fg_rgb(nc, rgb)
    @ccall libnotcurses.ncdirect_set_fg_rgb(nc::Ptr{ncdirect}, rgb::Cuint)::Cint
end

function ncdirect_set_bg_rgb(nc, rgb)
    @ccall libnotcurses.ncdirect_set_bg_rgb(nc::Ptr{ncdirect}, rgb::Cuint)::Cint
end

function ncdirect_set_fg_palindex(nc, pidx)
    @ccall libnotcurses.ncdirect_set_fg_palindex(nc::Ptr{ncdirect}, pidx::Cint)::Cint
end

function ncdirect_set_bg_palindex(nc, pidx)
    @ccall libnotcurses.ncdirect_set_bg_palindex(nc::Ptr{ncdirect}, pidx::Cint)::Cint
end

function ncdirect_palette_size(nc)
    @ccall libnotcurses.ncdirect_palette_size(nc::Ptr{ncdirect})::Cuint
end

function ncdirect_putstr(nc, channels, utf8)
    @ccall libnotcurses.ncdirect_putstr(nc::Ptr{ncdirect}, channels::UInt64, utf8::Ptr{Cchar})::Cint
end

function ncdirect_putegc(nc, channels, utf8, sbytes)
    @ccall libnotcurses.ncdirect_putegc(nc::Ptr{ncdirect}, channels::UInt64, utf8::Ptr{Cchar}, sbytes::Ptr{Cint})::Cint
end

function ncdirect_flush(nc)
    @ccall libnotcurses.ncdirect_flush(nc::Ptr{ncdirect})::Cint
end

function ncdirect_set_bg_rgb8(nc, r, g, b)
    @ccall libnotcurses.ncdirect_set_bg_rgb8(nc::Ptr{ncdirect}, r::Cuint, g::Cuint, b::Cuint)::Cint
end

function ncdirect_set_fg_rgb8(nc, r, g, b)
    @ccall libnotcurses.ncdirect_set_fg_rgb8(nc::Ptr{ncdirect}, r::Cuint, g::Cuint, b::Cuint)::Cint
end

function ncdirect_set_fg_default(nc)
    @ccall libnotcurses.ncdirect_set_fg_default(nc::Ptr{ncdirect})::Cint
end

function ncdirect_set_bg_default(nc)
    @ccall libnotcurses.ncdirect_set_bg_default(nc::Ptr{ncdirect})::Cint
end

function ncdirect_dim_x(nc)
    @ccall libnotcurses.ncdirect_dim_x(nc::Ptr{ncdirect})::Cuint
end

function ncdirect_dim_y(nc)
    @ccall libnotcurses.ncdirect_dim_y(nc::Ptr{ncdirect})::Cuint
end

function ncdirect_supported_styles(nc)
    @ccall libnotcurses.ncdirect_supported_styles(nc::Ptr{ncdirect})::UInt16
end

function ncdirect_set_styles(n, stylebits)
    @ccall libnotcurses.ncdirect_set_styles(n::Ptr{ncdirect}, stylebits::Cuint)::Cint
end

function ncdirect_on_styles(n, stylebits)
    @ccall libnotcurses.ncdirect_on_styles(n::Ptr{ncdirect}, stylebits::Cuint)::Cint
end

function ncdirect_off_styles(n, stylebits)
    @ccall libnotcurses.ncdirect_off_styles(n::Ptr{ncdirect}, stylebits::Cuint)::Cint
end

function ncdirect_styles(n)
    @ccall libnotcurses.ncdirect_styles(n::Ptr{ncdirect})::UInt16
end

function ncdirect_cursor_move_yx(n, y, x)
    @ccall libnotcurses.ncdirect_cursor_move_yx(n::Ptr{ncdirect}, y::Cint, x::Cint)::Cint
end

function ncdirect_cursor_enable(nc)
    @ccall libnotcurses.ncdirect_cursor_enable(nc::Ptr{ncdirect})::Cint
end

function ncdirect_cursor_disable(nc)
    @ccall libnotcurses.ncdirect_cursor_disable(nc::Ptr{ncdirect})::Cint
end

function ncdirect_cursor_up(nc, num)
    @ccall libnotcurses.ncdirect_cursor_up(nc::Ptr{ncdirect}, num::Cint)::Cint
end

function ncdirect_cursor_left(nc, num)
    @ccall libnotcurses.ncdirect_cursor_left(nc::Ptr{ncdirect}, num::Cint)::Cint
end

function ncdirect_cursor_right(nc, num)
    @ccall libnotcurses.ncdirect_cursor_right(nc::Ptr{ncdirect}, num::Cint)::Cint
end

function ncdirect_cursor_down(nc, num)
    @ccall libnotcurses.ncdirect_cursor_down(nc::Ptr{ncdirect}, num::Cint)::Cint
end

function ncdirect_cursor_yx(n, y, x)
    @ccall libnotcurses.ncdirect_cursor_yx(n::Ptr{ncdirect}, y::Ptr{Cuint}, x::Ptr{Cuint})::Cint
end

function ncdirect_cursor_push(n)
    @ccall libnotcurses.ncdirect_cursor_push(n::Ptr{ncdirect})::Cint
end

function ncdirect_cursor_pop(n)
    @ccall libnotcurses.ncdirect_cursor_pop(n::Ptr{ncdirect})::Cint
end

function ncdirect_clear(nc)
    @ccall libnotcurses.ncdirect_clear(nc::Ptr{ncdirect})::Cint
end

function ncdirect_capabilities(n)
    @ccall libnotcurses.ncdirect_capabilities(n::Ptr{ncdirect})::Ptr{nccapabilities}
end

function ncdirect_hline_interp(n, egc, len, h1, h2)
    @ccall libnotcurses.ncdirect_hline_interp(n::Ptr{ncdirect}, egc::Ptr{Cchar}, len::Cuint, h1::UInt64, h2::UInt64)::Cint
end

function ncdirect_vline_interp(n, egc, len, h1, h2)
    @ccall libnotcurses.ncdirect_vline_interp(n::Ptr{ncdirect}, egc::Ptr{Cchar}, len::Cuint, h1::UInt64, h2::UInt64)::Cint
end

function ncdirect_box(n, ul, ur, ll, lr, wchars, ylen, xlen, ctlword)
    @ccall libnotcurses.ncdirect_box(n::Ptr{ncdirect}, ul::UInt64, ur::UInt64, ll::UInt64, lr::UInt64, wchars::Ptr{Cwchar_t}, ylen::Cuint, xlen::Cuint, ctlword::Cuint)::Cint
end

function ncdirect_light_box(n, ul, ur, ll, lr, ylen, xlen, ctlword)
    @ccall libnotcurses.ncdirect_light_box(n::Ptr{ncdirect}, ul::UInt64, ur::UInt64, ll::UInt64, lr::UInt64, ylen::Cuint, xlen::Cuint, ctlword::Cuint)::Cint
end

function ncdirect_heavy_box(n, ul, ur, ll, lr, ylen, xlen, ctlword)
    @ccall libnotcurses.ncdirect_heavy_box(n::Ptr{ncdirect}, ul::UInt64, ur::UInt64, ll::UInt64, lr::UInt64, ylen::Cuint, xlen::Cuint, ctlword::Cuint)::Cint
end

function ncdirect_ascii_box(n, ul, ur, ll, lr, ylen, xlen, ctlword)
    @ccall libnotcurses.ncdirect_ascii_box(n::Ptr{ncdirect}, ul::UInt64, ur::UInt64, ll::UInt64, lr::UInt64, ylen::Cuint, xlen::Cuint, ctlword::Cuint)::Cint
end

function ncdirect_rounded_box(n, ul, ur, ll, lr, ylen, xlen, ctlword)
    @ccall libnotcurses.ncdirect_rounded_box(n::Ptr{ncdirect}, ul::UInt64, ur::UInt64, ll::UInt64, lr::UInt64, ylen::Cuint, xlen::Cuint, ctlword::Cuint)::Cint
end

function ncdirect_double_box(n, ul, ur, ll, lr, ylen, xlen, ctlword)
    @ccall libnotcurses.ncdirect_double_box(n::Ptr{ncdirect}, ul::UInt64, ur::UInt64, ll::UInt64, lr::UInt64, ylen::Cuint, xlen::Cuint, ctlword::Cuint)::Cint
end

function ncdirect_get(n, absdl, ni)
    @ccall libnotcurses.ncdirect_get(n::Ptr{ncdirect}, absdl::Ptr{Cvoid}, ni::Ptr{ncinput})::UInt32
end

function ncdirect_inputready_fd(n)
    @ccall libnotcurses.ncdirect_inputready_fd(n::Ptr{ncdirect})::Cint
end

function ncdirect_get_nblock(n, ni)
    @ccall libnotcurses.ncdirect_get_nblock(n::Ptr{ncdirect}, ni::Ptr{ncinput})::UInt32
end

function ncdirect_get_blocking(n, ni)
    @ccall libnotcurses.ncdirect_get_blocking(n::Ptr{ncdirect}, ni::Ptr{ncinput})::UInt32
end

function ncdirect_stop(nc)
    @ccall libnotcurses.ncdirect_stop(nc::Ptr{ncdirect})::Cint
end

const ncdirectv = ncplane

const ncdirectf = ncvisual

function ncdirect_render_image(n, filename, align, blitter, scale)
    @ccall libnotcurses.ncdirect_render_image(n::Ptr{ncdirect}, filename::Ptr{Cchar}, align::ncalign_e, blitter::ncblitter_e, scale::ncscale_e)::Cint
end

function ncdirect_render_frame(n, filename, blitter, scale, maxy, maxx)
    @ccall libnotcurses.ncdirect_render_frame(n::Ptr{ncdirect}, filename::Ptr{Cchar}, blitter::ncblitter_e, scale::ncscale_e, maxy::Cint, maxx::Cint)::Ptr{ncdirectv}
end

function ncdirect_raster_frame(n, ncdv, align)
    @ccall libnotcurses.ncdirect_raster_frame(n::Ptr{ncdirect}, ncdv::Ptr{ncdirectv}, align::ncalign_e)::Cint
end

function ncdirectf_from_file(n, filename)
    @ccall libnotcurses.ncdirectf_from_file(n::Ptr{ncdirect}, filename::Ptr{Cchar})::Ptr{ncdirectf}
end

function ncdirectf_free(frame)
    @ccall libnotcurses.ncdirectf_free(frame::Ptr{ncdirectf})::Cvoid
end

function ncdirectf_render(n, frame, vopts)
    @ccall libnotcurses.ncdirectf_render(n::Ptr{ncdirect}, frame::Ptr{ncdirectf}, vopts::Ptr{ncvisual_options})::Ptr{ncdirectv}
end

function ncdirectf_geom(n, frame, vopts, geom)
    @ccall libnotcurses.ncdirectf_geom(n::Ptr{ncdirect}, frame::Ptr{ncdirectf}, vopts::Ptr{ncvisual_options}, geom::Ptr{ncvgeom})::Cint
end

function ncdirect_stream(n, filename, streamer, vopts, curry)
    @ccall libnotcurses.ncdirect_stream(n::Ptr{ncdirect}, filename::Ptr{Cchar}, streamer::ncstreamcb, vopts::Ptr{ncvisual_options}, curry::Ptr{Cvoid})::Cint
end

function ncdirect_detected_terminal(n)
    @ccall libnotcurses.ncdirect_detected_terminal(n::Ptr{ncdirect})::Ptr{Cchar}
end

function ncdirect_cantruecolor(n)
    @ccall libnotcurses.ncdirect_cantruecolor(n::Ptr{ncdirect})::Bool
end

function ncdirect_canchangecolor(n)
    @ccall libnotcurses.ncdirect_canchangecolor(n::Ptr{ncdirect})::Bool
end

function ncdirect_canfade(n)
    @ccall libnotcurses.ncdirect_canfade(n::Ptr{ncdirect})::Bool
end

function ncdirect_canopen_images(n)
    @ccall libnotcurses.ncdirect_canopen_images(n::Ptr{ncdirect})::Bool
end

function ncdirect_canopen_videos(n)
    @ccall libnotcurses.ncdirect_canopen_videos(n::Ptr{ncdirect})::Bool
end

function ncdirect_canutf8(n)
    @ccall libnotcurses.ncdirect_canutf8(n::Ptr{ncdirect})::Bool
end

function ncdirect_check_pixel_support(n)
    @ccall libnotcurses.ncdirect_check_pixel_support(n::Ptr{ncdirect})::Cint
end

function ncdirect_canhalfblock(nc)
    @ccall libnotcurses.ncdirect_canhalfblock(nc::Ptr{ncdirect})::Bool
end

function ncdirect_canquadrant(nc)
    @ccall libnotcurses.ncdirect_canquadrant(nc::Ptr{ncdirect})::Bool
end

function ncdirect_cansextant(nc)
    @ccall libnotcurses.ncdirect_cansextant(nc::Ptr{ncdirect})::Bool
end

function ncdirect_canbraille(nc)
    @ccall libnotcurses.ncdirect_canbraille(nc::Ptr{ncdirect})::Bool
end

function ncdirect_canget_cursor(nc)
    @ccall libnotcurses.ncdirect_canget_cursor(nc::Ptr{ncdirect})::Bool
end

htole(x) = __bswap_32(htonl(x))

const PRETERUNICODEBASE = 1115000

preterunicode(w) = w + PRETERUNICODEBASE

const NCKEY_INVALID = preterunicode(0)

const NCKEY_RESIZE = preterunicode(1)

const NCKEY_UP = preterunicode(2)

const NCKEY_RIGHT = preterunicode(3)

const NCKEY_DOWN = preterunicode(4)

const NCKEY_LEFT = preterunicode(5)

const NCKEY_INS = preterunicode(6)

const NCKEY_DEL = preterunicode(7)

const NCKEY_BACKSPACE = preterunicode(8)

const NCKEY_PGDOWN = preterunicode(9)

const NCKEY_PGUP = preterunicode(10)

const NCKEY_HOME = preterunicode(11)

const NCKEY_END = preterunicode(12)

const NCKEY_F00 = preterunicode(20)

const NCKEY_F01 = preterunicode(21)

const NCKEY_F02 = preterunicode(22)

const NCKEY_F03 = preterunicode(23)

const NCKEY_F04 = preterunicode(24)

const NCKEY_F05 = preterunicode(25)

const NCKEY_F06 = preterunicode(26)

const NCKEY_F07 = preterunicode(27)

const NCKEY_F08 = preterunicode(28)

const NCKEY_F09 = preterunicode(29)

const NCKEY_F10 = preterunicode(30)

const NCKEY_F11 = preterunicode(31)

const NCKEY_F12 = preterunicode(32)

const NCKEY_F13 = preterunicode(33)

const NCKEY_F14 = preterunicode(34)

const NCKEY_F15 = preterunicode(35)

const NCKEY_F16 = preterunicode(36)

const NCKEY_F17 = preterunicode(37)

const NCKEY_F18 = preterunicode(38)

const NCKEY_F19 = preterunicode(39)

const NCKEY_F20 = preterunicode(40)

const NCKEY_F21 = preterunicode(41)

const NCKEY_F22 = preterunicode(42)

const NCKEY_F23 = preterunicode(43)

const NCKEY_F24 = preterunicode(44)

const NCKEY_F25 = preterunicode(45)

const NCKEY_F26 = preterunicode(46)

const NCKEY_F27 = preterunicode(47)

const NCKEY_F28 = preterunicode(48)

const NCKEY_F29 = preterunicode(49)

const NCKEY_F30 = preterunicode(50)

const NCKEY_F31 = preterunicode(51)

const NCKEY_F32 = preterunicode(52)

const NCKEY_F33 = preterunicode(53)

const NCKEY_F34 = preterunicode(54)

const NCKEY_F35 = preterunicode(55)

const NCKEY_F36 = preterunicode(56)

const NCKEY_F37 = preterunicode(57)

const NCKEY_F38 = preterunicode(58)

const NCKEY_F39 = preterunicode(59)

const NCKEY_F40 = preterunicode(60)

const NCKEY_F41 = preterunicode(61)

const NCKEY_F42 = preterunicode(62)

const NCKEY_F43 = preterunicode(63)

const NCKEY_F44 = preterunicode(64)

const NCKEY_F45 = preterunicode(65)

const NCKEY_F46 = preterunicode(66)

const NCKEY_F47 = preterunicode(67)

const NCKEY_F48 = preterunicode(68)

const NCKEY_F49 = preterunicode(69)

const NCKEY_F50 = preterunicode(70)

const NCKEY_F51 = preterunicode(71)

const NCKEY_F52 = preterunicode(72)

const NCKEY_F53 = preterunicode(73)

const NCKEY_F54 = preterunicode(74)

const NCKEY_F55 = preterunicode(75)

const NCKEY_F56 = preterunicode(76)

const NCKEY_F57 = preterunicode(77)

const NCKEY_F58 = preterunicode(78)

const NCKEY_F59 = preterunicode(79)

const NCKEY_F60 = preterunicode(80)

const NCKEY_ENTER = preterunicode(121)

const NCKEY_CLS = preterunicode(122)

const NCKEY_DLEFT = preterunicode(123)

const NCKEY_DRIGHT = preterunicode(124)

const NCKEY_ULEFT = preterunicode(125)

const NCKEY_URIGHT = preterunicode(126)

const NCKEY_CENTER = preterunicode(127)

const NCKEY_BEGIN = preterunicode(128)

const NCKEY_CANCEL = preterunicode(129)

const NCKEY_CLOSE = preterunicode(130)

const NCKEY_COMMAND = preterunicode(131)

const NCKEY_COPY = preterunicode(132)

const NCKEY_EXIT = preterunicode(133)

const NCKEY_PRINT = preterunicode(134)

const NCKEY_REFRESH = preterunicode(135)

const NCKEY_SEPARATOR = preterunicode(136)

const NCKEY_CAPS_LOCK = preterunicode(150)

const NCKEY_SCROLL_LOCK = preterunicode(151)

const NCKEY_NUM_LOCK = preterunicode(152)

const NCKEY_PRINT_SCREEN = preterunicode(153)

const NCKEY_PAUSE = preterunicode(154)

const NCKEY_MENU = preterunicode(155)

const NCKEY_MEDIA_PLAY = preterunicode(158)

const NCKEY_MEDIA_PAUSE = preterunicode(159)

const NCKEY_MEDIA_PPAUSE = preterunicode(160)

const NCKEY_MEDIA_REV = preterunicode(161)

const NCKEY_MEDIA_STOP = preterunicode(162)

const NCKEY_MEDIA_FF = preterunicode(163)

const NCKEY_MEDIA_REWIND = preterunicode(164)

const NCKEY_MEDIA_NEXT = preterunicode(165)

const NCKEY_MEDIA_PREV = preterunicode(166)

const NCKEY_MEDIA_RECORD = preterunicode(167)

const NCKEY_MEDIA_LVOL = preterunicode(168)

const NCKEY_MEDIA_RVOL = preterunicode(169)

const NCKEY_MEDIA_MUTE = preterunicode(170)

const NCKEY_LSHIFT = preterunicode(171)

const NCKEY_LCTRL = preterunicode(172)

const NCKEY_LALT = preterunicode(173)

const NCKEY_LSUPER = preterunicode(174)

const NCKEY_LHYPER = preterunicode(175)

const NCKEY_LMETA = preterunicode(176)

const NCKEY_RSHIFT = preterunicode(177)

const NCKEY_RCTRL = preterunicode(178)

const NCKEY_RALT = preterunicode(179)

const NCKEY_RSUPER = preterunicode(180)

const NCKEY_RHYPER = preterunicode(181)

const NCKEY_RMETA = preterunicode(182)

const NCKEY_L3SHIFT = preterunicode(183)

const NCKEY_L5SHIFT = preterunicode(184)

const NCKEY_MOTION = preterunicode(200)

const NCKEY_BUTTON1 = preterunicode(201)

const NCKEY_BUTTON2 = preterunicode(202)

const NCKEY_BUTTON3 = preterunicode(203)

const NCKEY_BUTTON4 = preterunicode(204)

const NCKEY_BUTTON5 = preterunicode(205)

const NCKEY_BUTTON6 = preterunicode(206)

const NCKEY_BUTTON7 = preterunicode(207)

const NCKEY_BUTTON8 = preterunicode(208)

const NCKEY_BUTTON9 = preterunicode(209)

const NCKEY_BUTTON10 = preterunicode(210)

const NCKEY_BUTTON11 = preterunicode(211)

const NCKEY_SIGNAL = preterunicode(400)

const NCKEY_EOF = preterunicode(500)

const NCKEY_SCROLL_UP = NCKEY_BUTTON4

const NCKEY_SCROLL_DOWN = NCKEY_BUTTON5

const NCKEY_RETURN = NCKEY_ENTER

const NCKEY_TAB = 0x09

const NCKEY_ESC = 0x1b

const NCKEY_SPACE = 0x20

# Skipping MacroDefinition: API __attribute__ ( ( visibility ( "default" ) ) )

# Skipping MacroDefinition: ALLOC __attribute__ ( ( malloc ) ) __attribute__ ( ( warn_unused_result ) )

const NCALIGN_TOP = NCALIGN_LEFT

const NCALIGN_BOTTOM = NCALIGN_RIGHT

const NCALPHA_HIGHCONTRAST = Culonglong(0x30000000)

const NCALPHA_TRANSPARENT = Culonglong(0x20000000)

const NCALPHA_BLEND = Culonglong(0x10000000)

const NCALPHA_OPAQUE = Culonglong(0x00000000)

const NCPALETTESIZE = 256

const NC_NOBACKGROUND_MASK = Culonglong(0x8700000000000000)

const NC_BGDEFAULT_MASK = Culonglong(0x0000000040000000)

const NC_BG_RGB_MASK = Culonglong(0x0000000000ffffff)

const NC_BG_PALETTE = Culonglong(0x0000000008000000)

const NC_BG_ALPHA_MASK = Culonglong(0x30000000)

NCCHANNEL_INITIALIZER(r, g, b) = uint32_t(r) << Cuint(16) + uint32_t(g) << Cuint(8) + b + NC_BGDEFAULT_MASK

NCCHANNELS_INITIALIZER(fr, fg, fb, br, bg, bb) = NCCHANNEL_INITIALIZER(fr, fg, fb) << Culonglong(32) + NCCHANNEL_INITIALIZER(br, bg, bb)

const WCHAR_MAX_UTF8BYTES = 4

# Skipping MacroDefinition: NCCELL_INITIALIZER ( c , s , chan ) { . gcluster = ( htole ( c ) ) , . gcluster_backstop = 0 , . width = ( uint8_t ) ( ( wcwidth ( c ) < 0 || ! c ) ? 1 : wcwidth ( c ) ) , . stylemask = ( s ) , . channels = ( chan ) , }

# Skipping MacroDefinition: NCCELL_CHAR_INITIALIZER ( c ) { . gcluster = ( htole ( c ) ) , . gcluster_backstop = 0 , . width = ( uint8_t ) ( ( wcwidth ( c ) < 0 || ! c ) ? 1 : wcwidth ( c ) ) , . stylemask = 0 , . channels = 0 , }

# Skipping MacroDefinition: NCCELL_TRIVIAL_INITIALIZER { . gcluster = 0 , . gcluster_backstop = 0 , . width = 1 , . stylemask = 0 , . channels = 0 , }

const NCSTYLE_MASK = Cuint(0xffff)

const NCSTYLE_ITALIC = Cuint(0x0010)

const NCSTYLE_UNDERLINE = Cuint(0x0008)

const NCSTYLE_UNDERCURL = Cuint(0x0004)

const NCSTYLE_BOLD = Cuint(0x0002)

const NCSTYLE_STRUCK = Cuint(0x0001)

const NCSTYLE_NONE = 0

const NCOPTION_INHIBIT_SETLOCALE = Culonglong(0x0001)

const NCOPTION_NO_CLEAR_BITMAPS = Culonglong(0x0002)

const NCOPTION_NO_WINCH_SIGHANDLER = Culonglong(0x0004)

const NCOPTION_NO_QUIT_SIGHANDLERS = Culonglong(0x0008)

const NCOPTION_PRESERVE_CURSOR = Culonglong(0x0010)

const NCOPTION_SUPPRESS_BANNERS = Culonglong(0x0020)

const NCOPTION_NO_ALTERNATE_SCREEN = Culonglong(0x0040)

const NCOPTION_NO_FONT_CHANGES = Culonglong(0x0080)

const NCOPTION_DRAIN_INPUT = Culonglong(0x0100)

const NCMICE_NO_EVENTS = 0

const NCMICE_MOVE_EVENT = 0x01

const NCMICE_BUTTON_EVENT = 0x02

const NCMICE_DRAG_EVENT = 0x04

const NCMICE_ALL_EVENTS = 0x07

const NCPLANE_OPTION_HORALIGNED = Culonglong(0x0001)

const NCPLANE_OPTION_VERALIGNED = Culonglong(0x0002)

const NCPLANE_OPTION_MARGINALIZED = Culonglong(0x0004)

const NCPLANE_OPTION_FIXED = Culonglong(0x0008)

const NCPLANE_OPTION_AUTOGROW = Culonglong(0x0010)

const NCPLANE_OPTION_VSCROLL = Culonglong(0x0020)

const NCBOXMASK_TOP = 0x0001

const NCBOXMASK_RIGHT = 0x0002

const NCBOXMASK_BOTTOM = 0x0004

const NCBOXMASK_LEFT = 0x0008

const NCBOXGRAD_TOP = 0x0010

const NCBOXGRAD_RIGHT = 0x0020

const NCBOXGRAD_BOTTOM = 0x0040

const NCBOXGRAD_LEFT = 0x0080

const NCBOXCORNER_MASK = 0x0300

const NCBOXCORNER_SHIFT = Cuint(8)

const NCVISUAL_OPTION_NODEGRADE = Culonglong(0x0001)

const NCVISUAL_OPTION_BLEND = Culonglong(0x0002)

const NCVISUAL_OPTION_HORALIGNED = Culonglong(0x0004)

const NCVISUAL_OPTION_VERALIGNED = Culonglong(0x0008)

const NCVISUAL_OPTION_ADDALPHA = Culonglong(0x0010)

const NCVISUAL_OPTION_CHILDPLANE = Culonglong(0x0020)

const NCVISUAL_OPTION_NOINTERPOLATE = Culonglong(0x0040)

const NCREEL_OPTION_INFINITESCROLL = Culonglong(0x0001)

const NCREEL_OPTION_CIRCULAR = Culonglong(0x0002)

const NCPREFIXCOLUMNS = 7

const NCIPREFIXCOLUMNS = 8

const NCBPREFIXCOLUMNS = 9

const NCPREFIXSTRLEN = NCPREFIXCOLUMNS + 1

const NCIPREFIXSTRLEN = NCIPREFIXCOLUMNS + 1

const NCBPREFIXSTRLEN = NCBPREFIXCOLUMNS + 1

NCMETRICFWIDTH(x, cols) = Cint((strlen(x) - ncstrwidth(x, NULL, NULL)) + cols)

NCPREFIXFMT(x) = (NCMETRICFWIDTH(x, NCPREFIXCOLUMNS), x)

NCIPREFIXFMT(x) = (NCMETRIXFWIDTH(x, NCIPREFIXCOLUMNS), x)

NCBPREFIXFMT(x) = (NCMETRICFWIDTH(x, NCBPREFIXCOLUMNS), x)

const NCMENU_OPTION_BOTTOM = Culonglong(0x0001)

const NCMENU_OPTION_HIDING = Culonglong(0x0002)

const NCPROGBAR_OPTION_RETROGRADE = Cuint(0x0001)

const NCTABBED_OPTION_BOTTOM = Culonglong(0x0001)

const NCPLOT_OPTION_LABELTICKSD = Cuint(0x0001)

const NCPLOT_OPTION_EXPONENTIALD = Cuint(0x0002)

const NCPLOT_OPTION_VERTICALI = Cuint(0x0004)

const NCPLOT_OPTION_NODEGRADE = Cuint(0x0008)

const NCPLOT_OPTION_DETECTMAXONLY = Cuint(0x0010)

const NCPLOT_OPTION_PRINTSAMPLE = Cuint(0x0020)

const NCREADER_OPTION_HORSCROLL = Culonglong(0x0001)

const NCREADER_OPTION_VERSCROLL = Culonglong(0x0002)

const NCREADER_OPTION_NOCMDKEYS = Culonglong(0x0004)

const NCREADER_OPTION_CURSOR = Culonglong(0x0008)

const NCDIRECT_OPTION_INHIBIT_SETLOCALE = Culonglong(0x0001)

const NCDIRECT_OPTION_INHIBIT_CBREAK = Culonglong(0x0002)

const NCDIRECT_OPTION_DRAIN_INPUT = Culonglong(0x0004)

const NCDIRECT_OPTION_NO_QUIT_SIGHANDLERS = Culonglong(0x0008)

const NCDIRECT_OPTION_VERBOSE = Culonglong(0x0010)

const NCDIRECT_OPTION_VERY_VERBOSE = Culonglong(0x0020)

# exports
const PREFIXES = ["nc"]
for name in names(@__MODULE__; all=true), prefix in PREFIXES
    if startswith(string(name), prefix)
        @eval export $name
    end
end

end # module
