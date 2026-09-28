// Feather disable all

function __SpartaBatchCreate(_particleCount)
{
    static _system = __SpartaSystem();
    
    with (_system)
    {
        var _buffer = buffer_create(_particleCount * 24, buffer_fixed, 1);
        
        var _i = 0;
        repeat (_particleCount)
        {
            for (var _j = 2; _j >= 0; _j--)
            {
                buffer_write(_buffer, buffer_u32, _i | (_j << 24));
            }
            
            for (var _j = 1; _j < 4; _j++)
            {
                buffer_write(_buffer, buffer_u32, _i | (_j << 24));
            }
            
            _i++;
        }
        
        var _vertexBuffer = vertex_create_buffer_from_buffer(_buffer, __particleFormat);
        vertex_freeze(_vertexBuffer);
        buffer_delete(_buffer);
        
        __vertexBatches[$ _particleCount] = _vertexBuffer;
        
        return _vertexBuffer;
    }
}