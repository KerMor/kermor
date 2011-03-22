classdef DocumentationGuideSubclass < DocumentationGuide
    % Doxygen documentation guidlines example subclass
    %
    % To refer to other classes / methods / properties in superclasses one
    % can use the @@copydoc, @@copybrief and @@copydetail doxygen
    % commands. 
    % For example the brief description of the superclass is:
    % @copybrief DocumentationGuide
    %
    % Here could be some additional information regarding the subclass.
    %
    % @new{0,2,dw,2011-03-17} Added this subclass to extend the
    % documentation examples.
    
    properties
        % New property in subclass!
        %
        % Detailed comment for SomeProp. Here you can write more detailed
        % text for the SomeProp property.
        %
        % @type int
        % @default 0
        SomeProp = 0;
    end
    
    properties(Dependent)
        % Short description for a dependent property.
        %
        % Equals SomeProp times five.
        %
        % See also: SomeProp
        % @see SomeProp
        SomeDepProp;
    end
    
    
    methods
        function returnarg = iwillbeoverridden(this, arg1)
            % Overrides the method in the base class.
            %
            % With the command
            % @code 
            % @copydoc DocumentationGuide::iwillbeoverridden()
            % @endcode
            % the documentation of the superclass method can be copied
            % to this location (red framed)
            % <div style="border:solid 2px red">
            % @copydoc DocumentationGuide::iwillbeoverridden()
            % </div>
            
            % Call superclass method
            returnarg = iwillbeoverridden@DocumentationGuide(this, arg1);
            
            % Do some more computations
            returnarg = returnarg + 10;
        end
    end
    
    methods(Sealed,Access=private)
        function noRealArguments(this)
            % This is the function brief description.
            %
            % Here are more details on the no real arguments function.
            % And even some more!
        end
    end
    
    %     events
    %         % This is the Test event's commentary.
    %         Test;
    %     end
    
end

