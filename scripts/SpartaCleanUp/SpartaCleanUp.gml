// Feather disable all

/// 
/// Cleans up the entirety of Sparta and all cached memory. Be mindful when clearing.
/// 
function SpartaCleanUp()
{
    static _system = __SpartaSystem();
    
    with (_system)
    {
        struct_foreach(__sprites, function(_name, _sprite)
        {
            sprite_delete(_sprite);
        });
        __sprites = {  };
        
        struct_foreach(__vertexBatches, function(_name, _vertexBuffer)
        {
            if (_vertexBuffer != undefined && vertex_buffer_exists(_vertexBuffer))
            {
                vertex_delete_buffer(_vertexBuffer);
            }
        });
        __vertexBatches = {  };
        
        array_foreach(__meshes, function(_index, _vertexBuffer)
        {
            if (_vertexBuffer != undefined && vertex_buffer_exists(_vertexBuffer))
            {
                vertex_delete_buffer(_vertexBuffer);
            }
        });
        __meshes = [  ];
    }
}