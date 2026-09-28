// Feather disable all
__SpartaSystem();

function __SpartaSystem()
{
    static _system = undefined;
    if (_system != undefined) return _system;
    
    _system = {  };
    with (_system)
    {
        __vertexBatches = {  };
        __sprites = {  };
        __meshes = [  ];
        
        vertex_format_begin();
        vertex_format_add_color();
        __particleFormat = vertex_format_end();
        
        vertex_format_begin();
        vertex_format_add_color();
        vertex_format_add_color();
        __meshFormat = vertex_format_end();
        
        __primaryInterface = new __SpartaPrimaryInterface();
        __secondaryInterface = new __SpartaSecondaryInterface();
        __meshInterface = undefined;
        
        __particleSystem = new __SpartaClassSystem([256, 512, 1024, 2048, 4096, 8192]);
        
        __SpartaTrace($"Welcome to Sparta by TheSnidr and modified by Alun Jones. This is version {SPARTA_VERSION} {SPARTA_DATE}");
    }
    
    return _system;
}