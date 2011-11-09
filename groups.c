/** 
@defgroup g_main KerMor Main Module
@short Short main group description

Some details on main group
 *
 *
 * @defgroup g_visual Visualization tools
 * @ingroup g_main
 * 
 * KerMor also comes along with some basic visualization tools to investigate the approximated functions.

@defgroup g_sampling Parameter sampling
@ingroup g_main

This module is concerned with sampling a system's parameter domain @f$P@f$

@defgroup g_approx Function approximation
@ingroup g_main

This module is concerned with approximating a system's nonlinearity @f$f@f$

@defgroup g_components Dynamical System Components
@ingroup g_main

Any basic components of a dynamical system can be found here

@defgroup g_errorest Error Estimators
@ingroup g_main

Any error estimators for reduced models are described here (soon :-))

@defgroup s_grid Regular grid sampling
 Samples from the parameter domain @f$P@f$ are taken creating a regular grid.
 @sa s_rand
 @ingroup sampling

@defgroup s_rand Random parameter sampling
 Samples from the parameter domain @f$P@f$ are taken using random vectors.
 @sa s_grid
 @ingroup sampling

@defgroup general General functions and algorithms
@ingroup g_main
 This Module contains general functions that can be used independently of the KerMor framework.

@defgroup interpolation Kernel Interpolation functions
@ingroup g_main
	Kernel-based function interpolation
	@ingroup general
	@sa general

@defgroup snapshot Snapshot generation
@ingroup g_main
@defgroup reduction Reduced Space Computations
@ingroup g_main
@defgroup pod POD subspace computation
@ingroup g_main
	@ingroup reduction
@defgroup models Contains the base models and dynamical systems.
@ingroup g_main
	This Module contains all pre-defined models of KerMor.
@defgroup pcd Programmed Cell Death
	@ingroup models
	The programmed cell death models from Markus Daub, IADM
*/

