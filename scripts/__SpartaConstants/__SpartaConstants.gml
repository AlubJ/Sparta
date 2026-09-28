// Feather disable all

#macro SPARTA_VERSION "1.0.0"
#macro SPARTA_DATE "28-09-27"

#macro SPARTA_RUNNING_FROM_IDE (GM_build_type == "run")

// Emitter types
#macro SPARTA_EMITTER_NONE 0
#macro SPARTA_EMITTER_STREAM 1
#macro SPARTA_EMITTER_RETIRED 2
#macro SPARTA_EMITTER_DYNAMIC 3

// Emitter shapes
#macro SPARTA_SHAPE_CUBE 0
#macro SPARTA_SHAPE_CIRCLE 1
#macro SPARTA_SHAPE_CYLINDER 2
#macro SPARTA_SHAPE_SPHERE 3

// Emitter distribution
#macro SPARTA_DISTR_LINEAR ps_distr_linear
#macro SPARTA_DISTR_GAUSSIAN ps_distr_gaussian
#macro SPARTA_DISTR_INVGAUSSIAN ps_distr_invgaussian

// Particle type type
#macro SPARTA_TYPE_SPRITE 0
#macro SPARTA_TYPE_MESH 1

#macro SPARTA_MAX_BURST_COUNT 99999