// ##################### Developer page ########################
/**
 * @page development KerMor Development
 * @short Useful notes for KerMor developers
 * 
 * For a list of currently involved developers see the @subpage developers page.
 *
 * For hints on how to work with and maintain this documentation see @ref docpage.
 *
 * @section codingguidelines Coding guidlines
 * Here you can find some information about how to write new code 
 * for the KerMor framework.
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
 * (http://www.mathworks.com/help/techdoc/matlab_oop/f2-74190.html#f2-85430) keyword
 * in order to avoid problems during loading.
 * A detailed example on how to utilize this property attribute is given at
 * http://www.mathworks.com/help/techdoc/matlab_oop/brzypp0.html#brzy2f2, for example.
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
 * 
 * Hello! For contact details visit <a href="http://www.agh.ians.uni-stuttgart.de/orga/people/wirtz" target="_blank">my homepage</a>
 * 
 * @section sa Syed Ammar
 * Hello! My name is Syed Ammar.
 */