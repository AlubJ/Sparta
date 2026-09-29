// Feather disable all

///
/// Set the mesh ambient color of a particle type.
///
/// @param {Struct.__SpartaClassType} type
/// @param {Constant.Color} ambientColor
function SpartaTypeSetMeshAmbientColor(_type, _ambientColor)
{
    if (!__SpartaEnsureType(_type))
    {
        __SpartaError($"Particle type passed in is invalid.");
    }
    
    _type.SetMeshAmbientColor(_ambientColor);
}