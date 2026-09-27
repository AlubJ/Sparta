function __SpartaEnsureEmitter(_emitter)
{
    if (!is_struct(_emitter) || _emitter.__shape == undefined)
    {
        return false;
    }
    else
    {
        return true;
    }
}