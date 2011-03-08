classdef DocumentationGuide < models.BaseFullModel
    % Documentation guidlines example class
    %
    % This is the documentation guideline file for class and function
    % documentation.
    %
    % Changes can be tracked version-based via using
    % @verbatim
    % @change{<mainversionnumber>,<mainversionnumber>[, <date>]} <change-text>
    % @endverbatim
    %
    % For example, writing
    % @verbatim
    % @change{0,1} Added a fancy new feature! (Changelog Example)
    % @endverbatim
    % results in
    % @change{0,1} Added a fancy new feature! (Changelog Example)
    %
    % Or to add a date write
    % @verbatim
    % @change{0,1,2011-01-01} Added a fancy new feature on new year's! (Changelog Example)
    % @endverbatim
    % results in
    % @change{0,1,2011-01-01} Added a fancy new feature on new year's!
    % (Changelog Example)
    %
    % and a new related page called @ref changelog01 listing these
    % items. To refer to that Changelog page, use the keyword \c changelog
    % together with both plainly concatenated numbers: 
    % @verbatim
    % @ref changelog01
    % @endverbatim
    % gives @ref changelog01
    
    properties(SetAccess=private)
        
        % Some comment on the property SomeClass.
        %
        % @type testing.MUnit
        %
        % See also: testing.MUnit
        SomeClass = testing.MUnit;
    end
    
    properties
        % Summary comment for SomeProp
        %
        % Detailed comment for SomeProp. Here you can write more detailed
        % text for the SomeProp property.
        %
        % @type int
        % @default 0
        SomeProp = 0;
    end
    
    properties(Dependent)
        % equals someprop times five.
        SomeDepProp;
    end
    
    
    methods
        function set.SomeProp(this, value)
            % Brief setter method description
            %
            % More details on the setter
            this.SomeProp = value;
        end
        
        function v = get.SomeProp(this)
            % Getter brief description
            %
            % More details on the getter!
            v = this.SomeProp;
        end
        
        function rv = doxygen_documentation(this, param1, param2)%#ok
            % function rv = doxygen_documentation(this, param1, param2) is ignored
            % First line: short description text for function
            %
            % After the first empty documentation line, paragraphs of the detailed
            % description begin.
            %
            %
            % Here, you have the following formatting possibilites:
            % Adding LaTeX code in the text with \verbatim @f$ \sum_{n=0}^N \frac{1}{n} @f$ \endverbatim
            % @f$ \sum_{n=0}^N \frac{1}{n} @f$ or as an
            % equation block with @verbatim @f[ \sum_{n=0}^N \frac{1}{n}. @f] @endverbatim.
            % @f[ \sum_{n=0}^N \frac{1}{n}. @f] Doxygen commands
            % always begin with an at-character(\@) OR a backslash(\\).
            %
            % Words prepended by \\c are written in a \c type-writer font.
            % Words prepended by \\b are written in a \b bold font.
            % Words prepended by \\em are written in an \em emphasized font.
            %
            % Blocks starting with @@verbatim or @@code and are ended with @@endverbatim or
            % @@endcode are written unformatted in a type-writer font and are not
            % interpreted by doxygen.
            %
            % Example:
            % @verbatim
            %                /| |\
            %               ( |-| )
            %                ) " (
            %               (>(Y)<)
            %                )   (
            %               /     \
            %              ( (m|m) )  hjw
            %            ,-.),___.(,-.\`97
            %            \`---\'   \`---\'
            % @endverbatim
            %
            % Paragaphs starting with line ending with a double-colon:
            % are started with a bold title line
            %
            % If, however, a double-colon at the end of a line is succeeded by:
            % whitespace characters, like spaces or tabulators the line is not written in a
            % bold font.
            %
            % @note As regularly commands like @verbatim \c @f$, @f$ @f[, @f] @endverbatim
            % look too distracting in matlab documentation output, the following shortcust
            % exist: The doxygen filter translates
            %  - @verbatim 'word' to \c word @endverbatim resulting in the output: 'word',
            %  - @verbatim `x` to @f$x@f$ @endverbatim resulting in the output: `x` and
            %  - @verbatim ``x`` to @f[x.@f] @endverbatim resulting in the output: ``x``.
            %
            % You therefore need to be careful with the use of characters @verbatim ' `
            % @endverbatim. If you want to say something about the transposed of a Matrix
            % 'A', better do it in a Tex-Environment as `A' * B'` or in a verbatim/code
            % environment as
            % @code A' * B' @endcode
            %
            % Listings can be added by prepending lines with a dash(-)
            %  - list 1 item which can also include
            %   newlines
            %  - list 2 item
            %    - and they can be nested
            %    - subitem 2
            %    .
            %  - list 3 item
            %
            % and they are ended by an empty documentation line.
            %
            % Enumerations can be added by prepending lines with a dash and hash (-#)
            %  -# first item
            %  -# second item
            %  -# third item
            %
            % Lines beginning with the words "Parameters" or "Return values" start a block
            % of argument respectively return argument descriptions.
            %
            % Parameters:
            %  param1: first parameter
            %
            % Return values:
            %  rv: return value
            %
            % A line beginning with the words "Required fields of", "optional fields of" or
            % "generated fields of" start a block for descriptions for fields used by the
            % parameters or generated for the return values.
            %
            % Required fields of param1:
            %  test: Description for required field param1.test
            %
            % Optional fields of param2:
            %  test2: Description for optional field param2.test2
            %
            % Generated fields of rv:
            %  RB: Description for generated field rv.RB
            %
            
            % After the first non-comment line the function body begins:
            
            %| Comment blocks starting with %| are interpreted as Doxygen documentation
            % blocks and can include doxygen commands like
            
            %| \todo There needs to be done something in this file
            
            % fields of parameters that are used in the function body are added to the
            % required fileds list automatically, if they are not documentated yet.
            param1.auto_added;
            
            param2.auto_added;
            
            % fields of return values that are assigned somewhere in the function body are
            % also added automatically to the list of generated fields
            rv.auto_added  = 1;
            
            %| \docupdate Do something!
            
            function set.SomeProp(this, value)
                % Some function
                if value > 0
                    this.SomeProp = value;
                else
                    error('buh');
                end
            end
            
            
            function v = get.SomeProp(this)
                % Some redundant method's short description
                %
                % Some more comment!
                v = this.SomeProp;
            end
            
            function v = get.SomeDepProp(this)
                v = this.SomeProp * 5;
            end
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

