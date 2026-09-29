// Feather disable all

///
/// Set the mesh texture of a particle type.
///
/// @param {Struct.__SpartaClassType} type
/// @param {Asset.Sprite} sprite
function SpartaTypeSetMeshTexture(_type, _sprite)
{
    if (!__SpartaEnsureType(_type))
    {
        __SpartaError($"Particle type passed in is invalid.");
    }
    
    _type.SetMeshTexture(_sprite);
}