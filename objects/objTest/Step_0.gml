//SpartaEmitterSetRegionPosition(emitter, dsin(current_time / 20) * 2, 0, 0);
SpartaSystemStep(SpartaSystemGetGlobal(), 1 / 60);
camera.stepEditorThird([0, 0, window_get_width(), window_get_height()]);