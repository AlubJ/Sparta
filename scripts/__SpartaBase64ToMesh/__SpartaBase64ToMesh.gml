// Feather disable all

function __SpartaBase64ToMesh(_base64)
{
    static _system = __SpartaSystem();
    
    var _buffer = buffer_base64_decode(_base64);
    var _vertexBuffer = vertex_create_buffer_from_buffer(_buffer, _system.__meshFormat);
    buffer_delete(_buffer);
    
    return _vertexBuffer;
}