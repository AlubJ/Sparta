// Feather disable all

function __SpartaMeshBatchCreate(_instanceBuffer, _instanceSize, _meshCountPerBatch)
{
    var _particleBuffer = buffer_create(_instanceSize * _meshCountPerBatch, buffer_fixed, 1);
    var _vertexCount = _instanceSize / 8;
    
    var _j = 0;
    repeat (_meshCountPerBatch)
    {
        buffer_copy(_instanceBuffer, 0, _instanceSize, _particleBuffer, _instanceSize * _j);
        
        var _i = 0;
        repeat (_vertexCount)
        {
            buffer_poke(_particleBuffer, _instanceSize * _j + 8 * _i + 3, buffer_u8, _j);
            _i++;
        }
        
        _j++;
    }
    
    return _particleBuffer;
}