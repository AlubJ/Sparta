function __SpartaGetBatchIndex(_particleSystem, _particleCount)
{
    var _indexCount = array_length(_particleSystem.__batchSize);
    var _index = 0;
    
    while (_index < _indexCount - 1 && _particleCount > _particleSystem.__batchSize[_index])
    {
        _index++;
    }
    
    return _index;
}