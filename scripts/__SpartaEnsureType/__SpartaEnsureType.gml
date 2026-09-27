function __SpartaEnsureType(_type)
{
    if (!is_struct(_type) || _type.__type == undefined)
    {
        return false;
    }
    else
    {
        return true;
    }
}