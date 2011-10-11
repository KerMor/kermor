/**
 * @class rowvector
 * @brief A matlab row vector.
 *
 * This class is an artificial construct to allow more precise type declarations
 *
 */

class handle {
	/**
		@class "handle"
		@brief Matlab's base handle class (documentation generation substitute)

		As doxygen does not know the class "handle" from itself, many classes do not get rendered within the documentation and the correct root class is not even displayed.
		This workaround guarantees a correct (also graphical) representation of the class hierarchy within KerMor.
	*/
public:
/** @brief  Creates a listener for the specified event and assigns a callback function to execute when the event occurs.
  * @sa notify
 */
tuple<general::regression::ScalarEpsSVR_SMO, handle> addlistener;


/**
	@brief Broadcast a notice that a specific event is occurring on a specified handle object or array of handle objects.
*/
matlabtypesubstitute notify;

/**
	@brief Handle object destructor method that is called when the object's lifecycle ends.
*/
matlabtypesubstitute delete;

/**
	@brief Handle object disp method which is called by the display method. See the MATLAB disp function.
*/
matlabtypesubstitute disp;

/**
	@brief Handle object display method called when MATLAB software interprets an expression returning a handle object that is not terminated by a semicolon. See the MATLAB display function.
*/
matlabtypesubstitute display;

/**
	@brief Finds objects matching the specified conditions from the input array of handle objects.
*/
matlabtypesubstitute findobj;

/**
	@brief Returns a meta.property objects associated with the specified property name.
*/
matlabtypesubstitute findprop;

/**
	@brief Returns a cell array of string containing the names of public properties.
*/
matlabtypesubstitute fields;

/**
	@brief Returns a cell array of string containing the names of public properties. See the MATLAB fieldnames function.
*/
matlabtypesubstitute fieldnames;

/**
	@brief Returns a logical array in which elements are true if the corresponding elements in the input array are valid handles.
	This method is Sealed so you cannot override it in a handle subclass.
*/
matlabtypesubstitute isvalid;

/**
	@brief Relational functions example. See details for more information.
	
	@par Other possible relational operators:
		-ne
		-lt
		-le
		-gt
		-ge

	Relational functions return a logical array of the same size as the pair of input handle object arrays. Comparisons use a number associated with each handle. You can assume that the same two handles will compare as equal and the repeated comparison of any two handles will yield the same result in the same MATLAB session. Different handles are always not-equal. The order of handles is purely arbitrary, but consistent.
*/
matlabtypesubstitute eq;

/**
	@brief Transposes the elements of the handle object array.
*/
matlabtypesubstitute transpose;

/**
	@brief Rearranges the dimensions of the handle object array. See the MATLAB permute function.
*/
matlabtypesubstitute permute;

/**
	@brief hanges the dimensions of the handle object array to the specified dimensions. See the MATLAB reshape function.
*/
matlabtypesubstitute reshape;

/**
	@brief ort the handle objects in any array in ascending or descending order. 

	The order of handles is purely arbitrary, but reproducible in a given MATLAB session. See the MATLAB sort function.
*/
matlabtypesubstitute sort;
}