/*
 * @package approx
 * @short Nonlinearity approximation algorithms and base classes
 *
 * This package contains classes for different algorithms that can be used
 * to approximate the system's nonlinear functions @f$ f(x) @f$.
 *
 * For more details see @ref g_approx
 *
 * @package sampling
 * @short Classes for different parameter space sampling strategies
 *
 * Contains a base sampling class as interface and all classes that generate parameter samples from the
 * space @f$D@f$.
 *
 * For more details see @ref g_sampling
 *
 * @package dscomponents 
 * @short Classes that represent all main dynamical system components
 *
 * This package is a collection of any components a dynamical system may be composed of.
 * Additionally, some interface classes like IProjectable are also included to enable interchangeability
 * of components.
 *
 * For more details see @ref g_components.
 *
 * @package spacereduction 
 * @short Subspace computation algorithms
 *
 * @package testing  
 * @short Unit testing for MatLab sourcecode
 *
 * @package kernels 
 * @short All kernel implementations available to KerMor
 *
 */

/*
 * @package solvers
 * @short Base package for solvers
 * This package contains any solvers contained in KerMor.
 *
 * @package solvers.ode
 * @short Collection of ODE solvers
 *
 * Self-implemented ODE solvers and builtin matlab-solver wrappers (MLWrapper).
 *
 * For more details see @ref g_main.
 *
 * @package solvers.qp
 * @short Various quadratic program solvers
 *
 * Different 3rd-Party solvers are wrapped via BaseQPSolver.
 *
 * For more details see @ref g_main.
 *
 */

/*
 * @package error
 * @short Error estimator base classes and implementations
 *
 * Different a-posteriori error estimators for certain types of nonlinear dynamical systems are
 * implemented in this package.
 *
 * For more details see @ref g_errorest
 */

/*
 *
 * @package general 
 * @short Collection of classes and functions for general multipurpose usage
 *
 * This package contains utility functions for i.e. combinatoric or matrix operations occuring in the
 * field of dynamical systems and model reduction.
 * For example, the POD algorithm is used in @ref spacereduction classes.
 *
 * @see spacereduction g_main
 *
 * @package general.interpolation
 * @short Collection of classes for (kernel-) interpolation
 *
 * So far only kernel interpolation is implemented. Those algorithms are used in the approx package
 *
 * @see approx g_approximation
 *
 * @package general.regression
 * @short Collection of classes for (kernel-) regression
 *
 * Several regression algorithms like kernel least squares or SVM's are available in this package.
 *
 * @see approx g_approximation
 *
 * @package general.collections
 * @short Contains common data structures like lists and dictionaries
 *
 * @package general.geometry
 * @short Contains classes which are related to spatial geometries
 */

/*
 *
 * @package models
 * @short The main model package
 *
 * @package models.pcd
 * @short Package for the programmed cell death model (M.Daub)
 *
 * @package models.rbmatlab
 * @short Package for any wrapped rbmatlab-models
 * 
 * @package models.synth
 * @short Package containing synthetic (testing) models
 *
 * @package models.circ
 * @short Package containing (nonlinear) circuit models
*/ 
