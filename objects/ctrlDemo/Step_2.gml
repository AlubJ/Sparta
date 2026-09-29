/// @desc Room changing
if (!global.docsDemo)
{
    if (keyboard_check_pressed(vk_anykey))
    {
        var _string = chr(keyboard_lastkey);
        if (_string == keyboard_lastchar && array_length(global.rooms) >= real(_string))
        {
            global.currentRoom = real(_string) - 1;
            room_goto(global.rooms[global.currentRoom].id);
        }
    }
}