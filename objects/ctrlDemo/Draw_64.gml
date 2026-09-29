/// @desc Draw debugging stats

var _stats = "";

_stats += $"Estimated Particle Count: {global.system.GetParticleCount()} | Draw Calls: {global.system.GetDrawCalls()}\n";

draw_text(16, 16, _stats);

draw_set_valign(fa_bottom);
draw_text(16, window_get_height() - 16, "Controls:\nMouse down and drag: Orbit camera\nMouse wheel: Zoom in/out");
draw_set_valign(fa_top);

if (!global.docsDemo)
{
    draw_set_halign(fa_right);
    draw_text(window_get_width() - 16, 16, global.roomsString);
    draw_set_halign(fa_left);
}