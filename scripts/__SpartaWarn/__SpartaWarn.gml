// Feather disable all

/// @ignore
function __SpartaWarn(_string)
{
    if (SPARTA_RUNNING_FROM_IDE)
    {
        show_error($" \nSparta:\n{_string}\n ", true);
    }
    else
    {
        show_debug_message($"Sparta: Warning! {_string}");
    }
}