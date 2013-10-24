/** 
@mainpage KerMor Software Documentation

KerMor is a MATLAB&copy; library providing routines for model order reduction
of dynamical systems using subspace projection and kernels methods.
Check out the Modules pages to get an overview of the different functionalities.

KerMor makes extensive use of object oriented programming (OOP), basic information can be found
at http://www.mathworks.com/products/matlab/object_oriented_programming.html 
and advanced techniques can be found at http://www.advancedmcode.org/object-oriented-programming-in-matlab.html.

Checkout the @ref gettingstarted "getting started" page to get up & running.

@section licensing KerMor license conditions
This software is available partly by the GNU GPL and BSD license

The KerMor framework as a whole is published under the GNU GPL license stated below.

However, some source files are especially published under the BSD license
(see http://www.opensource.org/licenses/bsd-license.php) and are marked appropriately.

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>

@page gettingstarted How To get started
@section mp_dl Downloading KerMor
 - Obtain a copy via git using @verbatim git clone <agh-root-folder>/git/kermor <somelocalfolder>@endverbatim
 - Check out the @ref testing and @ref models sections.

@section mp_install Installation
When first downloading the KerMor software you need to run the installation script KerMor.setup from the matlab console.
This will set up necessary environment variables and compile any mex functions used within KerMor.
You will be asked for some directories during the installation script.

In order to use 3rdParty programs you need to compile them externally and place appropriate symlinks in the @verbatim <source>/3rdparty @endverbatim directories.

@section mp_docs Documentation
- If desired create your own documentation: details can be found at the @ref docpage page
- Check out the @ref newfeat and @ref changelog pages for latest informations

@section mp_startup Start of KerMor
KerMor comes with a startup script KerMor.start that initializes any variables, static classes and parallel computing at the beginning.
If you have an automatically called script upon matlab startup you can add the path of your KerMor source directory to the PATH variable and call KerMor.start directly.

When you stop working with KerMor it is recommended to call KerMor.stop in order to cleanly shut down the application and free resources. However,
if you quit matlab after that anyways you dont need to call the stop method.

*/
