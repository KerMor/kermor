// ##################### Documentation creation page ########################
/**
@page docpage Documentation creation
@short Guidlines for creating and maintaining this documentation

@section dp_user User instructions
Once the application is installed  you can create the KerMor documentation by calling KerMor.createDocs. See the functions documentation for a list of optional parameters.

@section dp_devel Developer information: Complete file list of documentation creation related files
This section contains information for KerMor developers. The matlab-script KerMor.createDocs basically calls the 
script \c make.sh within the \c /documentation folder. Optionally, a parameter \c uml can be passed and
@verbatim ./make.sh uml @endverbatim generates graphical class visualizations that are UML-Style. This feature actually corresponds to the 
setting \c UMLSWITCH i.e. \c UML_LOOK in the Doxyfile.m4.

The following list of files gives a short overview about their individual role:
@li \c make.sh - Main documentation creation script.
@li \c Commands.tex - Place any custom commands you want to use within your in-code latex environment inside this file.
@li \c development.c - Documentation for active developers
@li \c DocumentationGuide - This is an example class showing how to document matlab classes in order to have them displayed most sensibly using doxygen.
@li \c Doxyfile.m4 - The configuration file for doxygen. Is parsed using the m4 preprocessor to insert correct paths.
@li \c doxygen_todo.m - A matlab file containing some tasks yet to investigate regarding the doxygen documentation creation.
@li \c groups.c - Documentation of Modules
@li \c handle_substitute.c - A C file that contains a fake handle class description as the native matlab handle class is not found/parsed by doxygen.
@li \c kermor.jpg - The logo of KerMor
@li \c kermorlatex.m4 - The style file included into the _formulas.tex file when latex is run. Add any additional package declarations here (or in Commands.tex)
Will be processed by m4 for correct path substitution.
@li \c mainpage.c - The main page source documentation file
@li \c relatedpages.c - The source file for all related pages with short content
@li \c changelogs.c - The manual source files for the changelog pages
@li \c mtoc - M to C preprocessing binary (Thanks to M. Drohmann, Univ. of Münster!)
@li \c mtoc.conf - M to C configuration file mtoc.conf
@li \c packages.c - The package documentation C file
@li \c postprocess - Binary for postprocessing any generated html files (removes matlabtypesubstitute etc)
For more details on some files see the following paragraphs.

@par Groups documentation groups.c

@par M to C configuration file mtoc.conf

@todo write description
*/

// ##################### MUnit testing page ########################
/**
 * @page unittesting The KerMor testing framework MUnit
 * @short Guidlines on how to test MatLab-Code using MUnit
 * @par MUnit class file documentation
 * 
 * For all details @ref testing.MUnit !
 * 
 * @copydoc testing::MUnit
*/

// ##################### Licensing ########################
/**
* @page licensing KerMor license conditions
* @short This software is available under the GNU GPL license
*
* This program is free software: you can redistribute it and/or modify 
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
* 
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
* 
* You should have received a copy of the GNU General Public License
* along with this program.  If not, see <http://www.gnu.org/licenses/>
*/

// ##################### System scaling ########################
/**
 * @page scaling Scaling of KerMor models
 * @short Describes how scaling is implemented in KerMor.
 *
 * Oftentimes appropriate scaling is important when dealing with physical constants etc.
 * KerMor allows to scale both state space and time.
 *
 * @section state_scaling State space scaling
 * The base dynamical system structure of KerMor is as follows:
 * @f{align}{
 *  x'(t) &= f(x(t),t,\mu) + B(t,\mu)u(t)\\
 *  x(0) &= x_0(\mu)\\
 *  y(t) &= C(t,\mu)x(t)
 * @f}
 *
 * Now scaling can be performed on `x(t)` level. The models.BaseDynSystem.StateScaling 
 * property can be set either to a scalar value or a vector of the size of system's full dimension,
 * denoting the scaling of each dimension individually.
 *
 * When state space scaling is used, the given initial values will be transformed according to the scaling, and the resulting
 * output will be fed with the re-scaled state variables. This is realized by a diagonal matrix `S` in the following way:
 *
 * @f{align}{
 *  x'(t) &= f(x(t),t,\mu) + B(t,\mu)u(t)\\
 *  x(0) &= S^{-1}x_0(\mu)\\
 *  y(t) &= C(t,\mu)Sx(t)
 * @f}
 *
 * @attention Given the above scaling procedure, one must notice that the models.BaseModel.computeTrajectory will always return
 * the ''scaled'' state space vectors. Hence, training of subspaces etc. is performed on the scaled version of the model.
 * Using the models.BaseModel.simulate method will yield the re-scaled (possibly output-transformed) values.
 *
 * @subsection projected_state_scaling Scaling in reduced models
 * When reduced models are created from full models, the scaling is included in the reduced model, as the 
 * scaling process is possibly of a high dimension and thus not suitable for online computations.
 * The system below shows how the online matrices are computed for reduced models:
 * @f{align}{
 *  z'(t) &= W^tf(Vz(t),t,\mu) + \underbrace{W^tB(t,\mu)}_{\tilde{B(t,\mu)}}u(t)\\
 *  z(0) &= \underbrace{W^tS^{-1}}_{\tilde{W_s}}x_0(\mu)\\
 *  y(t) &= \underbrace{C(t,\mu)SV}_{\tilde{C(t,\mu)}}z(t)
 * @f}
 * 
 * @section time_scaling Time scaling
 * Time scaling in KerMor is easy. The models.BaseModel.dt and models.BaseModel.T determine the real simulation times, and the 
 * models.BaseModel.tau scalar the time scaling. The scaled times are used automatically inside the simulations.
 * This means all components must expect scaled times if scaling is used.
 *
 * @attention Given the above scaling procedure, one must notice that the models.BaseModel.computeTrajectory will always return
 * the ''scaled'' times `t_i`. Using the models.BaseModel.simulate method will yield the re-scaled time steps.
 */