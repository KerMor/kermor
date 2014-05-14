// ##################### Developer page ########################
/**
 *
 * @page development KerMor Development
 * @short Useful notes for KerMor developers
 * 
 * For a list of currently involved developers see the @ref developers page.
 *
 * The current TODO list can be found @ref todo "here".
 *
 * For hints on how to work with and maintain this documentation see @ref docpage.
 * Check out pages where the documentation needs to be updated @ref docupdate "here".
 * 
 * @section codingguidelines Coding guidlines
 * Here you can find some information about how to write new code 
 * for the KerMor framework.
 *
 * @subsection create_files Creating new classes and functions 
 * An extra class Devel has been created to aid @ref developers creating new files in the manner of KerMor.
 *
 * This class has two static methods Devel.newClass and Devel.newFun which can be used to create the 
 * respective files in the current folder. When calling those functions, either the files template_class and template_fun
 * from the KerMor root directory are parsed and their output is used as new file. This allows to automatically create 
 * class/function skeletons matching the current developer and KerMor version.
 *
 * Please make sure you use the Devel class in order to keep the line of KerMor development.
 *
 * @subsection getter_setter Getter & Setter
 * Writing getter & setter methods for your classes can usually be done straightforwardly.
 * As setters allow to check for a required type of a property, custom methods and
 * actions may be required to validate the value to be set. However, extreme care
 * must be taken when implementing custom setters as the save/load cycle managed
 * by matlab does not check or guarantee any order in which the properties are loaded.
 * As the setter is invoked for every property customized code may fail to work
 * or validate wrong when other properties (even in remote classes!) may not yet
 * have been set. In order to avoid this, MatLab offers the Dependent 
 * keyword in order to avoid problems during loading.
 * A detailed example on how to utilize this property attribute is given in the official MatLab TechDocs, for example.
 *
 * An example within the KerMor framework is the property models.ReducedModel.ErrorEstimator.
 * Setting this property calls a validation method if this error estimator is
 * applicable to the given model, and thus accesses many remote object's properties.
 * Upon load, this must not be executed as some values aren't loaded yet. So declaring
 * this property as Dependent avoids this value to be set by the builtin load
 * method. 
 *  
 * @par Further examples:
 * - dscomponents.AKernelCoreFun
 * - models.BaseModel
 *
 * @page developers KerMor Developers
 * @short Introduces the developers of KerMor
 * 
 * @section dw Daniel Wirtz
 * KerMor main developer.
 *
 * For contact details visit <a href="http://www.mathematik.uni-stuttgart.de/fak8/ians/lehrstuhl/agh/orga/people/wirtz/index.html" target="_blank">my homepage</a>
 * 
 * @section ts Timm Strecker
 * Student assistant for KerMor maintenance.
 *
 * @section sa Syed Ammar
 * Syed was involved in KerMor as scientific assistant until mid 2011.
 *
 * @section CS Christoph Strohmeyer
 * Works mainly on the models.beam package and models.
 *
 * Visit http://www.mso.math.uni-erlangen.de/optimization/applied-mathematics-2/staff-members/strohmeyer-christoph/dipl-technomath-christoph-strohmeyer.html
 * for more details.
 */

/**
@page docpage Documentation creation
@short Guidlines for creating and maintaining this documentation
 *
 * KerMor uses the FEX submission "mtoc++ - Doxygen filter for Matlab and tools" http://www.mathworks.com/matlabcentral/fileexchange/33826 to create the
 * documentation using doxygen.
 * Once KerMor is installed  you can create the KerMor documentation by calling @code MatlabDocMaker.create @endcode from within MatLab. That's it!
 *
 * Please see the documentation on the MatlabDocMaker for detailed options.
 
Please refer to the @subpage docupdate "Required documentation updates site" to see where the current documentation is outdated or not yet written.

@section dp_devel Developer information: Complete file list of documentation creation related files
This section contains information for KerMor developers.

 * The following list of files gives a short overview about their individual role:
@li \c development.c - Documentation for active developers
@li \c DocumentationGuide - This is an example class showing how to document matlab classes in order to have them displayed most sensibly using doxygen.
@li \c Doxyfile.template - The configuration file for doxygen. Is preprocessed to insert correct paths.
@li \c doxygen_todo.m - A matlab file containing some tasks yet to investigate regarding the doxygen documentation creation.
@li \c class_substitute.c - A C file that contains a fake handle class description as the native matlab handle class is not found/parsed by doxygen.
@li \c kermor.jpg - The logo of KerMor
@li \c mathjax_cmds - MathJax inclusion for dynamic latex parsing in the HTML output
@li \c latexextras.template - The style file included into the _formulas.tex file when latex is run. Add any additional package declarations here (or in Commands.tex)
Will be preprocessed for correct path substitution.
@li \c mainpage.c - The main page source documentation file
@li \c newfeat_changelog.c - The manual source files for the changelog pages
@li \c mtocpp.conf - The mtoc++-configuration for this project
@li \c quality.c - Notes on how to ensure/support simulation quality with KerMor
@li \c scaling.c - Explanation of scaling in KerMor
@li \c literature.bib - BibTex database for references used in KerMor documentation
*/

/**
 * @page docupdate Documentation needs to be updated
 * @short A list of places where the documentation needs to be updated
 *
 * @page todo Todo list
 * @short The KerMor ToDo list
 */
