/// @desc Room changing
if (!global.docsDemo)
{
    if (keyboard_check_pressed(vk_anykey))
    {
        if (is_real(real(keyboard_lastchar)) && array_length(global.rooms) >= real(keyboard_lastchar))
        {
            global.currentRoom = real(keyboard_lastchar) - 1;
            room_goto(global.rooms[global.currentRoom].id);
        }
    }
}