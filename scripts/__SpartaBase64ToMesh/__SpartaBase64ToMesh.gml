// Feather disable all

function __SpartaBase64ToMesh(_base64, _meshCountPerBatch)
{
    static _system = __SpartaSystem();
    
    var _instanceBuffer = buffer_base64_decode(_base64);
    var _particleBuffer = __SpartaMeshBatchCreate(_instanceBuffer, buffer_get_size(_instanceBuffer), _meshCountPerBatch);
    buffer_delete(_instanceBuffer);
    
    var _vertexBuffer = vertex_create_buffer_from_buffer(_particleBuffer, _system.__meshFormat);
    buffer_delete(_particleBuffer);
    
    return _vertexBuffer;
}