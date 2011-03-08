/** 
@mainpage KerMor Software Documentation
@section intro Introduction
KerMor is a MATLAB&copy; library providing routines for model order reduction
of dynamical systems using subspace projection and kernels methods.
The overall reduction process structure is
-# @ref sampling "Sampling of parameter domains"
 - Grid sampling,
 - Random sampling
-# @ref snapshot Snapshot generation
-# @ref reduction "Reduced subspace computation"
  - @ref pod "POD methods"
-# @ref models "Implementations of models"
  - @ref pcd "Programmed Cell Death"
-# @ref testing "Testing of KerMor components"

@section learning How To get started
-# Get KerMor
 - Obtain a copy via git using @verbatim git clone <agh-root-folder>/git/kermor <somelocalfolder>@endverbatim
 - Check out the @ref testing and @ref models sections.
-# Adjust the paths txt in startup_kermor
-# Compile 3rdParty programs / mex files
-# If desired create your own documentation: details can be found at the @ref docpage page
-# Check out the @ref changelog page for latest informations
*/