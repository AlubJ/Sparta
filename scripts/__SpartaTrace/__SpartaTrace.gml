// Feather disable all

/// @ignore
function __SpartaTrace()
{
    var _string = "Sparta: ";
    
    var _i = 0;
    repeat(argument_count)
    {
        _string += argument[_i];
        ++_i;
    }
    
    show_debug_message(_string);
    
    return _string;
}