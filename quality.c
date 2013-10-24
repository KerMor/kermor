/**
 * @page quality Ensuring quality of KerMor and Simulations
 * 
 * Assuring a high quality of simulation results is very important. KerMor implements different means
 * to assist the user in assessing the quality and correctness of simulations performed using KerMor.
 *
 * On the one side, unit tests are possible using the @subpage unittesting "MUnit" MatLab tool.
 * With that, built-in algorithms and features can be tested for correct functionality, and own classes can
 * implement the correct interface to be usable as test.
 *
 * On the other side, a @subpage dpcm "Default Property Changed Monitoring" is implemented in KerMor.
 * This allows to check, if all critical or important properties of the applied algorithms have been
 * changed or at least set since the initial creation of the algorithm classes.
 *
 *
 * @page unittesting The KerMor testing framework MUnit
 * @short Guidlines on how to test MatLab-Code using MUnit
 * @par MUnit class file documentation
 * 
 * For all details @ref testing.MUnit !
 * 
 * @copydoc testing::MUnit
 *
 *
 *
 * @page dpcm Default Property Changed Monitoring
 * 
 * @todo write docs
 * 
 * See the @subpage propclasses page for all implemented property classes.
 *
 *
 *
 * @page propclasses Property classes and levels
 * @short KerMor default property changed supervision functionality
 *
 * - @subpage propclass_experimental
 * - @subpage propclass_critical
 * - @subpage propclass_important
 * - @subpage propclass_alglimit
 * - @subpage propclass_scaling
 * - @subpage propclass_optional
 * - @subpage propclass_data
 * - @subpage propclass_verbose
 *
 * @page propclass_experimental Properties with level "Experimental"
 * @short Property level experimental
 *
 * @page propclass_critical Properties with level "Critical"
 * @short Property level critical
 *
 * @page propclass_important Properties with level "Important"
 * @short Property level important
 *
 * @page propclass_alglimit Properties with level "Algorithm Limit"
 * @short Property level alglimit
 *
 * @page propclass_scaling Properties with level "Scaling"
 * @short Property level scaling
 *
 * @page propclass_optional Properties with level "Optional"
 * @short Property level optional
 *
 * @page propclass_data Properties with level "Data"
 * @short Property level data
 *
 * @page propclass_verbose Properties with level "Verbose"
 * @short Property level verbose
 *
 */
