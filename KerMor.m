classdef KerMor < handle
    % Global configuration class for all KerMor run-time settings.
    %
    % Software documentation can be found at
    % http://www.morepas.org/software/kermor/index.html
    %
    % Any KerMor developers should check out the pages @ref development for coding guidelines and
    % conventions.
    %
    % @author Daniel Wirtz @date 2011-03-04
    %
    % @new{0,8,dw,2014-04-09} Started KerMor 0.8 and introduced a new file
    % structure and git submodules. Most importantly, the core files are
    % now separated from the already existing models in KerMor.
    %
    % @change{0,7,dw,2014-01-17} Removed the Flag
    % "UseMatlabParallelComputing" as this should/must be set up separately
    % on each machine. Instead, manually opening the matlabpool is
    % required. Moreover, the flags models.BaseFullModel.ComputeParallel
    % are used to determine the way of execution.
    %
    % @change{0,7,dw,2013-07-09} Removed the TempDirectory as customizable property and simply
    % using "DataDirectory/tmp" now.
    %
    % @change{0,7,dw,2013-01-23} Done some restructuring in KerMor
    % - Removed thee QP-Solver packages and extern/ folders as they are effectively no longer
    % used
    % - Removed associated tests
    % - Moved the ODE solvers from \c solvers.ode to \c solvers
    % - Moved the IClassConfig interface to \c +general
    % - Adopted the KerMor install script to the changes
    % - Removed two no longer used approx.algorithms classes (MinMax and VectorialOMP2Step)
    %
    % @change{0,7,dw,2012-11-16}
    % - Moved some tools from the extern folder into a new separate git repo "MatlabTools",
    % including the previous general.collections package
    % - Changed the warning for missing mosek quadprog
    % - Adjusted the directories that are being added to PATH at startup
    %
    % @new{0,7,dw,2012-11-07} Started KerMor 0.7 to congratulate President Obama for his
    % re-election :-)
    %
    % @new{0,6,dw,2012-05-3} Added a getGitBranch function to easily access
    % the current branch. This is intended to be helpful on figuring out
    % under which commit a certain simulation was run (and saved)
    %
    % @change{0,6,CS,2011-12-05} Removed external folders from PATH (supervised by dw)
    %
    % @change{0,6,dw,2011-11-21} Implemented fake loadobj and saveobj methods so that
    % accidential storing of KerMor instances inside save files does not corrupt the KerMor app
    % singleton.
    %
    % @new{0,6,dw,2011-11-14} Included 'dbstop if error' in the KerMor start script. No more
    % lost data! :-)
    %
    % @new{0,6,dw,2011-11-09} Started KerMor Version 0.6
    %
    % @change{0,5,dw,2011-11-08}
    % - Renamed "install" to "setup".
    % - Removed the initDirectories method and moved them to the setup.
    % - Upon subsequent calls to setup, KerMor asks if to keep previously set values for
    % rbmatlab of JKerMor paths.
    %
    % @change{0,5,dw,2011-11-08} Changed the name of the install method to
    % setup and refactored the setup routine. Now using the new mtoc++
    % MatlabDocMaker and running setup again does propose previously set
    % values as first guess.
    %
    % @change{0,5,dw,2011-10-13} Moved all documentation related stuff to
    % an own class "MatlabDocMaker" (now hidden from docs as in extern folder).
    %
    % @new{0,5,dw,2011-08-04} Added flag UseDPCM to switch the default property changed system
    % on/off.
    %
    % @change{0,5,dw,2011-07-28} Setting the DefaultFigurePosition at runtime now directly changes
    % the root setting (so far only upon restart of KerMor/Matlab)
    %
    % @change{0,5,dw,2011-07-07} New property DefaultFigurePosition.
    %
    % @change{0,5,dw,2011-06-20} Started KerMor version 0.5
    %
    % @change{0,4,dw,2011-05-03} 
    % - Committed KerMor version 0.3 to GIT.
    % - Different documentation creation subroutines for unix and windows now, windows not supported
    % yet
    % - Version Number now gets passed to the documentation creation script
    %
    % @new{0,3,dw,2011-04-26} Added a new property DocumentationLocation.
    %
    % @change{0,3,sa,2011-04-14} Implemented UseMatlabParallelComputing functionality
    %
    % @change{0,3,dw,2011-04-12} 
    % - Included the setup script for Devel in the installation procedure.
    % - Added new properties MainVersion and SubVersion to this class for global versioning.
    %
    % @new{0,3,dw,2011-04-05} Added a new property KerMor.DesktopLayout. As with KDE4 matlab seems
    % to start with a pretty random layout this property enables the developer to specify a
    % (previously saved) desktop layout to be associated with KerMor.
    %
    % @change{0,3,dw,2011-03-22} Modified the GIT repository so that branches now reflect the KerMor
    % versions.
    %
    % @change{0,2,dw,2011-03-21} Nicer color output for the KerMor.createDocs command and the log
    % file is printed directly in MatLab.
    %
    % @new{0,2,dw,2011-03-17} Added the fields @ref KerMor.Hasrbmatlab and KerMor.rbmatlabDirectory.
    % This allows to register a copy of rbmatlab located at the 'rbmatlabDirectory' with KerMor.
    % Without having setup this directory any models.rbmatlab classes will not work correctly.
    %
    % @change{0,2,dw,2011-03-09} Included a developer key parameter into the '@@new' and
    % '@@change{0' tags to create a link to the author of the new features or changes.
    %
    % @new{0,2,dw,2011-03-09}
    % - Added installation routines for unix systems. Now one can download the sources from a git
    % repository and simply call KerMor.install to prepare the environment & compile any included
    % mex files.
    % - Added a KerMor.createDocs static method to create the documentation from within the matlab
    % environment.
    %
    % @new{0,2,dw,2011-03-08} Created a new Doxygen keyword '@@new' for new
    % feature versioning lists
    %
    % @change{0,2,dw,2011-03-04} Moved startup and shutdown functions into
    % this class
    %
    % @change{0,1,dw} Initial version. @new{0,1,dw} Initial version.
    %
    % To-Do's for KerMor:
    % @todo
    % - message-system ?ber alle berechnungen hinaus (ungew?hliche dinge
    % berichten, exit flags etc). hier eine zentrale logging-funktion die
    % je nach verbose sachen direkt plottet oder (immer!) in ein log-file
    % schreibt.. das ganze mit verbose-leveln kombinieren!
    % - laufzeittests f?r reduzierte modelle
    % - interface f?r ModelData/Snapshots -> entweder arbeiten auf der
    % Festplatte oder in 4D-Array .. (f?r gro?e simulationen) -> KerMor hat
    % string f?r globales datenverzeichnis!
    % generell datenhaltung auf festplatte (mu,inputidx-indiziert) (?) =>
    %   - berechnung kernmatrix in teilen...
    %   - hashfunktion bernard / ggf eigene interface-fkt f?r eindeutige
    %   dirnames
    %   -speichermanagement: gro?e matrizen / etc virtuell auf festplatte
    %   laden/speichern
    %
    % @todo mehr tests / anwendungen f?r mehrere inputs aber keine parameter!
    %
    % @todo Verbose-Level benutzen / anpassen
    %
    % @todo test f?r rotationssensitive kerne!
    %
    % @todo: snapshotgenerierung -> mit fehlersch?tzer ausw?hlen! (3-4
    % zuf?llig, dann approx, fehler -> neuen snapshot beim gr??ten fehler etc)
    %
    % @todo: moving least squares (mit gewichtsfkt) f?r general.regression ..
    % -> book scattered data approx
    %
    % @todo: fft-approximation (?)
    %
    % @todo: use new matlab classes possibilities!
    %
    % @todo: Kern mit `\K(x,y) = (1-||x-y||_2)_+` oder so
    %
    % @todo: p-partitioning
    %
    % @todo: adaptive svr (impl. `\nu`-SVR, dann snapshots adden bis tol
    % erreicht)
    %
    % @todo: zusammenlegen von funktionen / erstellen eines general-modules f?r
    % KerMor/rbmatlab?
    %
    % @todo: try..catch langsam?
    %
    % @todo zeitabh?ngige outputconvertierung?
    % testing.MUnit auch f?r "nicht-packages"
    %
    %
    % @todo: parfor f?r sampling / comp-wise approximation? (snaphshot-generation/approx)
    %
    % @todo benchmarks von
    % http://portal.uni-freiburg.de/imteksimulation/downloads/benchmark
    % einlesbar machen / einbauen!
    %
    % @todo Beispiele von ODE's aus Matlab-Docs? (verficiation)
    %
    % @todo Fehlersch?tzer auf Output beschr?nken/erweitern!
    %
    % @todo Mehr ODE-Solver (implizit) einbauen, ggf. eigenen RK23 oder so.
    %
    % @todo LaGrange-koeffizientenfunktionen bei kerninterpolation berechnen!
    % ist insgesamt billiger falls `N<<n`
    %
    % @todo: test f?r newton-iteration!
    %
    % @todo Implementierung Balanced Truncation (mit base class) f?r
    % LinearCoreFuns, dann implementierung balanced truncation f?r empirical
    % gramians nach paper Lall et al. -> neue subspace reduction method f?r
    % nonlin-systems mit inputs! (geht ggf. auch f?r systeme ohne inputs? probieren!)
    %
    % @todo vielleicht so etwas wie "isValid" f?r jede modellkomponente, das
    % vor start von teuren berechnungen pr?ft ob alles so durchgeht und keine
    % inkompatibilit?ten auftreten (z.B. krylov - LinearCoreFun)
    %
    % @todo check ob es eine m?glichkeit gibt zu pr?fen ob alle unterklassen
    % von projizierbaren klassen die project-methode der oberklasse aufrufen!?
    % k?nnte sonst zu komischen fehlern f?hren..
    %
    % @todo check warum der error estimator nach einem save vom reduzierten
    % modell nicht gespeichert wird.
    %
    % @todo 16.09.2010: f?r skalarprodukt-kerne eigenes interface
    % implementieren und dann ggf. f?r W=V korrekt projezieren + TEST
    % schreiben!
    %
    % @todo cacher aus RBMatlab portieren/?bertragen!
    %
    % @todo t-partitioning f?r KerMor? ideen mit markus austauschen!
    %
    % @todo MUnit erweitern um benchmark-mode, so das anstelle von "test_"
    % prefix-fkt alle mit "bench_" ausgef?hrt werden; (r?ckgabe ist in dem fall
    % ggf ein struct mit algorithmus und zeiten)
    %
    % @todo eigene POD-Basen f?r verschiedene Teile des systems denen andere
    % physik zugrunde liegt (i.e. f(x) => [f_1(x); f_2(x)]), mit einzelner
    % auswertung? dazu m?sste man indexmatrizen einrichten die die
    % verschiedenen teile von f bezeichnen... (Motivation: "Application of POD
    % and DEIM for MOR of Nonl. Miscible Viscous Flow, Chaturantabut/Sorensen)
    %
    % @todo fehlersch?tzer gegen die volle, nicht projizierte
    % kernelapproximation einrichten? damit kann man den aktuell besch?tzten
    % fehler besser bekommen..
    %
    % @todo sekantenabsch?tzung per kernregression vorab f?r 1D berechnen? dann
    % entf?llt das newton-problem l?sen. interpolation z.B. geht auch f?r
    % fehlerabsch?tzung um die rigorosit?t zu erhalten.
    %
    % @todo timedirty ?berarbeiten / rausnehmen etc, sollte auch einzelaufrufe
    % zu offX checken.
    %
    % @todo umstellen von simulate(mu,inputidx) auf simulate +
    % setMu,setInputidx -> faster evaluation
    % -gegenargument: schlechte parallelisierbarkeit bei zentralem mu/inidx
    %
    % @todo PCAFixspace wieder einbauen, um greedy-basisgen zu erlauben (->
    % generell: greedy-unterraumalgorithmus einbauen)
    %
    % @todo add tests for models with C output and custom G for 1-n
    % dimensions!
    %
    % @todo hierarchical subspace selection? -> bad that approximation is
    % trained on largest subspace, so would have to have more
    % approximations. or any possibility to project approximation into
    % sub-subspace??
    %
    % @todo Store distance matrix for centers (with rotation invariant kernels) and only update
    % kernel matrix from that during iterations! saves a lot of computation time.
    %
    % @todo 
    % - sort demos and +testing directories
    % - sort out "groups" in documentation, probably remove them?
    %
    % @todo 
    % - im setup: typo in "compliling"
    % - hinweis: KerMor kommt mit mtoc++, do you want to configure matlabdocmaker now?
    % (idealerweise: nur nach output fragen?!?)
    %
    % @todo implement CME model from steffen in KerMor!
    %
    % @todo change TempDirectory and DataDirectory to be dependent-only values (read & write
    % directly to preferences), and enforce DIFFERENT folders (ModelData.SimCache
    % uses same prefix etc)
    %
    % @todo KerMor.App.getDir method that saves the last accessed directory if successfully
    % selected
    %
    % @todo: matrix-wertige auswertung/integration f??r alle systeme?
    %
    % @todo: possibility to add custom directories to PATH on startup (managed in kermor prefs)?
    %
    % @todo: incorporate /this.Gamma^2 already in getSqDiffNorm
    %
    % @todo
    % - remove kernel matrix stuff
    % - remove redundant algorithms
    % - remove tests for old stuff
    % - remove kernel interpol as class?
    % - beim setup von docmaker wird version abgefragt: redundant in kermor!
    % - kermor-diary in data-folder unter windows
    % - automatisch den temp-ordner im datadir anlegen
    %
    % @todo model-transfer zwischen rechnern (mit daten)
    
    properties(Constant)
        % The current KerMor main version number
        %
        % Change only AFTER committing the final last version's state.
        % Used in Devel to fill the new class templates etc.
        %
        % @type char
        %
        % See also: SubVersion
        MainVersion = '0';
        
        % The current KerMor sub version number
        %
        % Change only AFTER committing the final last version's state.
        % Used in Devel to fill the new class templates etc.
        %
        % @type char
        %
        % See also: MainVersion
        SubVersion = '7';
        
        % The prefix for the host-dependent preference tags
        %
        % @type char
        %
        % See also: getPrefTag
        PrefTagPrefix = 'KerMor_at_';
    end
      
    properties(Dependent)
        % The directory to use for simulation data storage
        %
        % In this folder large simulation and model data will be stored and
        % read by KerMor. Can be set anytime during runtime. If no value is
        % given the KerMor.start script will ask for it.
        %
        % @default ./data @type char
        DataDirectory = '';
        
        % Switch to determine if the Default Property Changed System shall be used or not.
        %
        % @default true @type logical
        UseDPCM = [];
        
        % The preferred desktop layout to work with.
        %
        % If you work with different desktop layouts or the KDE JUST DOES
        % NOT GET IT you can save your custom desktop layout and set this
        % property to its name. Upon start, KerMor will restore the layout
        % for you automatically. Set to '' to disable.
        %
        % @default '' @type char
        DesktopLayout = '';
        
        % The source directory for a copy of rbmatlab
        %
        % @default [] @type char
        rbmatlabDirectory = '';
        
        % The source directory for JKerMor, if available
        %
        % @default '' @type char
        JKerMorSourceDirectory = '';
        
        % Verbose output level
        %
        % @default 1 @type integer
        Verbose = [];
        
        % The default figure position to use.
        %
        % If none is set, KerMor does not modify the root workspace property
        % 'DefaultFigurePosition' upon startup.
        %
        % @default [] @type rowvec
        DefaultFigurePosition = [];
        
        % Flag that determines if KerMor also enables the 'diary' function upon startup.
        %
        % For each day, a diary named '[Date]_KerMor[Version]Log.txt' is created inside the
        % KerMor.TempDirectory.
        %      
        % @default true @type logical
        UseDiary = [];
    end
    
    properties(SetAccess=private)
        % The KerMor home directory
        HomeDirectory;
    end
    
    properties(SetAccess=private,Dependent)
        % Flag if rbmatlab wrapping functionalities are enabled
        %
        % @default false
        Hasrbmatlab = false;
        
        % The directory to use for temporary simulation data
        %
        % It is located in a "tmp" subfolder of the DataDirectory path.
        % @default DataDirectory/tmp @type char
        TempDirectory = '';
    end
 
    % Getter & Setter
    methods  
        function set.DataDirectory(this, value)
            if ~ischar(value)
                error('DataDirectory must be a char array');
            elseif ~isempty(value) && ~isdir(value)
                fprintf('Creating directory %s\n',value);
                mkdir(value);
            end
            setpref(this.getPrefTag,'DATASTORE',value);
        end
        
        function set.DesktopLayout(this, value)
            setpref(this.getPrefTag,'DESKLAYOUT',value);
        end
        
        function set.rbmatlabDirectory(this, value)
            % Sets the rbmatlab source directory
            %
            % Parameters:
            % ds: The directory of an rbmatlab source. Use empty string or
            % cell to "uninstall" rbmatlab.
            %
            % Throws an exception if the path is invalid or does not
            % contain the rbmatlab startup script.
            if ~isempty(value)
                if ~isdir(value)
                    error('Invalid directory: %s',value);
                end
                if ~exist(fullfile(value,'startup_rbmatlab.m'),'file')
                    error('Invalid rbmatlab directory (no startup script found): %s',value);
                end
            end
            setpref(this.getPrefTag,'RBMATLABDIR',value);
        end
        
        function set.JKerMorSourceDirectory(this, value)
            % Sets the JKerMor source directory
            %
            % Parameters:
            % ds: The directory of an JKerMor source. Use empty string or
            % cell to "uninstall" JKerMor.
            %
            % Throws an exception if the path is invalid or does not
            % contain a selected JKerMor class.
            if ~isempty(value)
                if ~isdir(value)
                    error('Invalid directory: %s',value);
                end
                chk = fullfile(value,['kermor' filesep 'ReducedModel.java']);
                if ~exist(chk,'file')
                    error('Invalid JKerMor directory (no ReducedModel.java found): %s',value);
                end
            end
            setpref(this.getPrefTag,'JKERMORDIR',value);
        end
        
        function h = get.HomeDirectory(this)
            if isempty(this.HomeDirectory)
                this.HomeDirectory = fileparts(which('KerMor'));
            end
            h = this.HomeDirectory;
        end
        
        function h = get.DataDirectory(this)
            h = getpref(this.getPrefTag,'DATASTORE','');
        end
        
        function h = get.TempDirectory(this)
            % Returns the directory for temporary files.
            %
            % It is located in a "tmp" subfolder of the DataDirectory path.
            h = fullfile(this.DataDirectory,'tmp');
            if ~exist(h,'file')
                mkdir(h);
            end
        end
        
        function d = get.DesktopLayout(this)
            d = getpref(this.getPrefTag,'DESKLAYOUT','');
        end
        
        function h = get.rbmatlabDirectory(this)
            h = getpref(this.getPrefTag,'RBMATLABDIR','');
        end
        
        function h = get.JKerMorSourceDirectory(this)
            h = getpref(this.getPrefTag,'JKERMORDIR','');
        end
        
        function flag = get.Hasrbmatlab(this)
            % Indicates if rbmatlab is available and initialized
            %
            % This function checks for a set rbmatlabDirectory and if the
            % rbmatlab script 'rbmatlabhome' is within the current path
            % (=substitute for the rbmatlab startup-script being executed)
            flag = false;
            if ~isempty(this.rbmatlabDirectory)
                flag = ~isempty(which('rbmatlabhome'));
                if ~flag
                    warning('KerMor:App',...
                        ['rbmatlab directory is set, but script'...
                        ' ''rbmatlabhome'' could not be found in current path.\n'...
                        'Unsure if rbmatlab-dependent models will work,'...
                        ' check if rbmatlab version has changed!']);
                end
            end
        end
        
        function value = get.DefaultFigurePosition(this)
            value = getpref(this.getPrefTag,'DefFigPos',...
                get(0,'DefaultFigurePosition'));
        end
        
        function set.DefaultFigurePosition(this, value)
            if numel(value) ~= 4
                error('The figure position must be a four element vector');
            end
            setpref(this.getPrefTag,'DefFigPos',value);
        end
        
        function value = get.UseDPCM(this)
            value = getpref(this.getPrefTag,'UseDPCM',true);
        end
        
        function set.UseDPCM(this, value)
            if ~islogical(value)
                error('The UseDPCM flag must be boolean.');
            end
            setpref(this.getPrefTag,'UseDPCM',value);
        end
        
        function value = get.UseDiary(this)
            value = getpref(this.getPrefTag,'UseDiary',false);
        end
        
        function set.UseDiary(this, value)
            if ~islogical(value)
                error('The UseDiary flag must be boolean.');
            end
            setpref(this.getPrefTag,'UseDiary',value);
        end
        
        function value = get.Verbose(this)
            value = getpref(this.getPrefTag,'Verbose',1);
        end
        
        function set.Verbose(this, value)
            if ~isposintscalar(value)
                error('The Verbose flag must be a positive integer');
            end
            setpref(this.getPrefTag,'Verbose',value);
        end
    end
    
    methods(Access=private)
        
        function initialize(this)
            % Internal main startup script.
            
            disp('<<<<<<<<< Welcome to KerMor! >>>>>>>>>>');

            % Check if preferences are set (i.e. KerMor.setup has been run on this machine)
            disp('Checking environment...')
            pset = ~isempty(getpref(this.getPrefTag,'DATASTORE',[]));
            if ~pset
                if numlabs > 1
                    % For parallel computing case, throw an error as KerMor
                    % must be setup on each machine running parallel jobs!
                    error('You must run KerMor.setup on each machine you want to run parallel jobs with KerMor!');
                else
                    fprintf(2,'No KerMor preferences on this host found. Searching for settings from other hosts...\n');
                    phome = getpref;
                    fn = fieldnames(phome);
                    op = strfind(fn,KerMor.PrefTagPrefix);
                    for i=1:numel(op)
                        if op{i} == 1
                            fprintf('Do you want to copy the following preferences from host "%s"?\n',fn{i}(length(KerMor.PrefTagPrefix)+1:end));
                            disp(phome.(fn{i}));
                            r = lower(input('(Y)es, (N)o or (C)ancel and start KerMor setup: ','s'));
                            % Yes: copy prefs
                            if r == 'y'
                                % Select preferences substruct from host and copy
                                % NOT using Utils.xx here as this is not yet on
                                % the PATH!
                                localp = phome.(fn{i});
                                pfn = fieldnames(localp);
                                for k = 1:numel(pfn)
                                    setpref(this.getPrefTag,pfn{k},localp.(pfn{k}));
                                end
                                pset = true;
                                break;
                                % cancel: start setup
                            elseif r == 'c'
                                break;
                            end
                        end
                    end
                    if ~pset
                        if i == numel(op)
                            fprintf(2,'No preferences copied from other hosts. Have to run setup.\n');
                        end
                        fprintf(2,'Entering KerMor setup...\n');
                        KerMor.setup;
                    end
                end
            else
                fprintf('KerMor preferences/settings found for tag "%s"...\n',this.getPrefTag);
            end
            
            disp('Initializing environment...');
            
            warning off MATLAB:dispatcher:nameConflict;
            
            % Stuff only for single instance mode
            if exist('numlabs','builtin') == 5 && numlabs == 1
                % Preferences & Environment
                setpref('Internet','SMTP_Server','localhost');
                
                % Desktop-only stuff
                if usejava('desktop')
                    % Figure position settings
                    if ~isempty(this.DefaultFigurePosition)
                        set(0,'DefaultFigurePosition',this.DefaultFigurePosition);
                    end

                    if ~isempty(this.DesktopLayout)
                        fprintf('Applying desktop layout %s..\n',this.DesktopLayout);
                        desktop = com.mathworks.mde.desk.MLDesktop.getInstance;
                        desktop.restoreLayout(this.DesktopLayout);
                    end
                end
                
                disp('Calling ''dbstop if error''..');
                dbstop if error;
            end
            
            phome = this.HomeDirectory;
            addpath(phome);
            
            pcore = fullfile(phome,'core');
            
            % Initialize external folders & software
            initextern(phome, pcore); 
            
            % Setup home directory & paths (AFTER extern, to have the path
            % entries search BEFORE externally created ones)
            addpath(fullfile(phome,'documentation'));
            addpath(fullfile(pcore,'visual'));
            addpath(fullfile(pcore,'tools'));
            addpath(fullfile(pcore,'interfaces'));
            addpath(pcore);
            addpath(phome);
            
            initParallelization;
            
            clear('phome','pcore');
            
            if this.UseDiary
                % Fix for non-unix log files
                if isunix || ~isempty(which('ppid'))
                    pid = ppid;
                else
                    pid = 0;
                end
                dfile = sprintf('%s_KerMor%s.%s_pid%d_diary.txt',datestr(now,'yyyy-mm-dd'),...
                    KerMor.MainVersion,KerMor.SubVersion,pid);
                dfile = fullfile(this.TempDirectory,dfile);
                fprintf('Initializing diary in %s..\n',dfile);
                diary(dfile);
            end
            
            % Set more narrow format as default
            format compact;
            
            warning on MATLAB:dispatcher:nameConflict;
            
            disp('<<<<<<<<< Ready to go. >>>>>>>>>>');
            
            function initextern(phome, pcore)
                % Checks for 3rd party software availability
                %
                % @todo include checks for pardiso once pardiso solver is
                % implemented/wrapped
                
                % rbmatlab
                if ~isempty(this.rbmatlabDirectory)
                    disp('<<<<<<<<< Starting rbmatlab >>>>>>>>>>');
                    setenv('RBMATLABTEMP', this.TempDirectory);
                    setenv('RBMATLABHOME', this.rbmatlabDirectory);
                    addpath(this.rbmatlabDirectory);
                    curdir = pwd;
                    evalin('base','startup_rbmatlab;');
                    evalin('base','clear all;');
                    chdir(curdir);
                    disp('<<<<<<<<< Done Starting rbmatlab >>>>>>>>>>');
                end
                
                % Add KerMor-included external software paths
                disp('Initializing external tools...')
                addpath(fullfile(pcore,'extern'));
                addpath(fullfile(pcore,'extern','export_fig'));
                addpath(fullfile(pcore,'extern','compat'));
                addpath(fullfile(phome,'matlabtojarmos'));
                addpath(fullfile(phome,'matlabtools'));
                addpath(fullfile(phome,'dpcm'));
                
                % md5
                d = fullfile(pcore,'extern','calcmd5');
                addpath(d);
                if ~exist(fullfile(d,['CalcMD5.' mexext]),'file')
                    warning('KerMor:init','No compiled CalcMD5 mex file found. Did you run KerMor.setup completely?\nKerMor might not run properly.');
                end
                
                % md5
                d = fullfile(pcore,'extern','typecastx');
                addpath(d);
                if ~exist(fullfile(d,['typecastx.' mexext]),'file')
                    warning('KerMor:init','No compiled typecastx mex file found. Did you run KerMor.setup completely?\nKerMor might not run properly.');
                end
            end   
            
            function initParallelization
                % Initializes variables for parallel computation
                %
                % @todo wrap with try-catch and set flag in KerMor.App
                % class!
                %
                % @note The 'feature' command is undocumented, see
                % http://www.mathworks.com/matlabcentral/newsreader/view_thread/154551
                % for more information.
                
                % Sets the maximum number of threads to create by OpenMP
                % binaries according to the number of cores available on
                % the machine.
                setenv('OMP_NUM_THREADS',num2str(feature('numCores')));
            end
        end        
                  
        function shutdown(this)
            % Ends the current KerMor session.
            
            if this.UseDiary
                disp('Disabling diary..');
                diary off;
            end
            
            dbclear if error;
        end
    end
    
    methods(Static)
        function theinstance = App
            % The singleton KerMor instance
            %
            % Access to the main programs instance via KerMor.App!
            %
            % Return values:
            % theinstance: The singleton instance @type KerMor
            persistent instance;
            if isempty(instance)
                instance = KerMor;
            end
            theinstance = instance;
        end
        
        function setup
            % Performs installation of KerMor on a system
            %
            % Adds variables to the users environment, so far only needed
            % for the documentation creation. Custom paths for data storage
            % are checked and set by the start script.
            %
            % If no rbmatlab directory is already presently set by a
            % previous install, the installation program asks if an
            % rbmatlab-installation should be registered with KerMor.
            %
            % See also: installUnix installWindows
            disp('<<<<<<<<<< Welcome to the KerMor setup script. >>>>>>>>>>');
                        
            a = KerMor.App;
            addpath(a.HomeDirectory);
            addpath(genpath(fullfile(a.HomeDirectory,'documentation')));
            
            %% KerMor directories
            % Setup the data storage directory
            ds = a.DataDirectory;
            word = 'keep';
            if isempty(ds)
                ds = fullfile(a.HomeDirectory,'data');
                word = 'set';
            end
            str = sprintf('Do you want to %s %s as your KerMor data file directory? Choosing "No" opens a directory selection dialog.\n(Y)es/(N)o?: ',word,strrep(ds,'\','\\'));
            if isequal(lower(input(str,'s')),'n')
                d = uigetdir(ds,'Please specify the KerMor data file directory');
                if d == 0
                    error('No KerMor data file directory specified. Aborting setup.');
                end
                ds = d;
            end
            a.DataDirectory = ds;
           
            %% Setup KerMor development
            if isempty(getpref('KERMOR_DEVEL','author',''))
                str = sprintf('Do you want to develop KerMor on this machine?\n(Y)es/(N)o: ');
                ds = lower(input(str,'s'));
                if isequal(ds,'y')
                    addpath(fullfile(a.HomeDirectory,'tools'));
                    Devel.setup;
                    
                    %% Call setup for documentation creation
                    addpath(fullfile(a.HomeDirectory,'extern'));
                    MatlabDocMaker.setup;
                end
            end
            
            %% 3rd party programs
            KerMor.setupextern;
            
            disp('<<<<<<<<<< Setup complete. You can now start KerMor by running "KerMor.start;". >>>>>>>>>>');
        end
        
        function app = start
            % Starts the KerMor application
            %
            % This static method initializes the environment and performs
            % initial availability checks for e.g. 3rd party programs and
            % matlab toolboxes.
            %
            % Additionally, some path variables are tried to be read from
            % environment variables if set. If no settings are made yet the
            % user is prompted to select them!
            %
            % Return values:
            % app: The KerMor instance @type KerMor
            app = KerMor.App;
            app.initialize;
        end
        
        function stop
            % Ends the KerMor application
            %
            % Stores some global property values in environment variables
            % (paths) or text files (misc settings)
            % Closes the matlab-pool for parallel computing is closed
            % if in use.
            KerMor.App.shutdown;
        end
        
        function host = getHost
            % Returns the hostname of the current machine
            try
                host = char(getHostName(java.net.InetAddress.getLocalHost));
            catch ME
                warning('KerMor:hostdetection','Your Host could not be identified. Using "unknown"');
                host = 'unknown';
            end
            host = regexprep(strtrim(host),'[^\d\w]','');
        end
        
        function b = getGitBranch(dir)
            % Returns the current git commit in a descriptive string
            if nargin < 1
                dir = KerMor.App.HomeDirectory;
            end
            olddir = pwd;
            cd(dir);
            %[s, m] = system(sprintf('export TERM=%s; git log -n 1 --pretty=format:"%%H: %%s%%+ai by %%an<%%ae>"',getenv('TERM')));
            [s, msg] = system('git log -n 1 --pretty=format:"%H: %s%+ai by %an<%ae>" > .gitbranch');
            if s == 0
                b = fileread('.gitbranch');
                delete .gitbranch;
            else
                fprintf(2,'KerMor.getGitBranch: %s\n',strrep(msg,char(10),''));
                b = [];
            end            
            cd(olddir);
        end
        
        function d = DocumentationLocation
            % Returns the location of the kermor documentation.
            %
            % Looks up the MatlabDocMaker.getOutputDirectory value and
            % returns the default online documentation URL if no value is
            % set.
            %
            % Return values:
            % d: The docs directory @type char
            d = MatlabDocMaker.getOutputDirectory;
            if isempty(d) || ~exist(fullfile(d,'index.html'),'file')
                d = 'http://www.morepas.org/software/kermor/index.html';
            end
        end
        
        function createLogo
            % Creates the KerMor logo
            h = figure;
            [X,Y] = meshgrid(-10:.5:10);
            Z = exp(-(X.^2+Y.^2-2*X'*Y)/20);% + .5*exp(-(X2.^2+Y2.^2-2*X2'*Y2)/5);
            surfl(X,Y,Z,'Parent',h);
            lighting gouraud;
            colormap autumn;
            grid on;
        end
        
        function tag = getPrefTag
            % Returns the tag used to store the KerMor preferences and settings.
            %
            % Note that the tag is machine/host-dependent.
            % The initialization routine checks for the existence, and if none is found
            % possible configurations from other hosts are suggested if found.
            %
            % Return values:
            % tag: The host-dependent tag used for KerMor preferences
            tag = [KerMor.PrefTagPrefix KerMor.getHost];
        end
        
        function d = getDir
            % Returns a folder selected by a uigetdir command.
            % Remembers the last selected folder (if successful & existing)
            t = KerMor.getPrefTag;
            path = getpref(t,'LASTPATH',KerMor.App.HomeDirectory);
            if exist(path,'dir') ~= 7
                path = fileparts(path);
                if exist(path,'dir') ~= 7
                    path = pwd;
                end
            end
            d = uigetdir(path,'Select directory');
            if ~isequal(d, 0) && exist(d,'dir') == 7
                setpref(t,'LASTPATH',d);
            else
                d = false;
            end
        end
    end
    
    methods(Static, Access=private)
        
        function setupextern
            a = KerMor.App;
            
            %% Optional: rbmatlab
            rbmat = a.rbmatlabDirectory;
            if ~isempty(rbmat)
                str = sprintf('Do you want to keep the local rbmatlab version at %s with KerMor?\n(Y)es/(N)o: ',strrep(rbmat,'\','\\'));
                resp = 'n';
            else
                str = sprintf('Do you want to register a local rbmatlab version with KerMor?\n(Y)es/(N)o: ');
                resp = 'y';
            end
            ds = lower(input(str,'s'));
            if isequal(ds,resp)
                rbmat = uigetdir(pwd,'Please select the rbmatlab source root folder.');
                if rbmat == 0
                    warning('KerMor:setup',['No rbmatlab directory specified. Continuing witout using rbmatlab.\n'...
                        'You can still register a local version of rbmatlab by setting the KerMor.App.rbmatlabDirectory manually.']);
                else
                    a.rbmatlabDirectory = rbmat;
                end
            end
            
            %% Optional: JKerMor
            jk = a.JKerMorSourceDirectory;
            if ~isempty(jk)
                str = sprintf('Do you want to keep the local JKerMor version at %s with KerMor?\n(Y)es/(N)o: ',strrep(jk,'\','\\'));
                resp = 'n';
            else
                str = sprintf('Do you want to register a local JKerMor version with KerMor?\n(Y)es/(N)o: ');
                resp = 'y';
            end
            ds = lower(input(str,'s'));
            if isequal(ds,resp)
                jk = uigetdir(pwd,'Please select the JKerMor source root folder.');
                if jk == 0
                    warning('KerMor:setup',['No JKerMor directory specified. Continuing witout using JKerMor.\n'...
                        'You can still register a local version of JKerMor by setting the KerMor.App.JKerMorSourceDirectory manually.']);
                else
                    a.JKerMorSourceDirectory = jk;
                end
            end
            
            %% Compile MEX files
            warning off MATLAB:dispatcher:nameConflict
            olddir = pwd;
            % CalcMD5
            disp('Compliling CalcMD5..');
            cd(fullfile(a.HomeDirectory,'core','extern','calcmd5'));
            mex CFLAGS="\$CFLAGS -std=c99" CalcMD5.c
            
            % typecast/x
            disp('Compliling typecast/x..');
            cd(fullfile(a.HomeDirectory,'core','extern','typecastx'));
            mex typecast.c
            mex typecastx.c
            
            if isunix
                disp('Compliling ppid..');
                cd(fullfile(a.HomeDirectory,'core','extern'));
                mex ppid.c
            else
                warning('KerMor:setup','No ppid function available (win32 platform)');
            end
            
            warning on MATLAB:dispatcher:nameConflict
            cd(olddir);
        end
        
        function app = loadobj(~)
            % Fake load method. Simply returns the singleton.
            app = KerMor.App;
        end
    end
    
    methods(Access=private)
        function this = KerMor
            % Private constructor: This class is a Singleton.
        end
        
        function obj = saveobj(~)
            % This instance cannot be saved.
            obj = [];
        end
    end
    
end