% @section doxytodo Doxygen ToDo
% done - schlie�endes } f�r klassen
% done - abstract-methoden
% done - vererbung in packages (: public pack1.pack2.classname) schmeisst fehler!
% done - alle vererbten methoden anzeigen (link auf seite �ffnet komplette
% liste)
% done - f�r z.B. das package "dscomponents" gibt es eine lange liste der enthaltenen Klassen, die aber in der �bersicht alle mit "dscomponents" benannt werden.
% @todo \@type-tags: f�r properties einfach den string hinter "\@type" im c-code anstelle von "matlabtypesubstitute" einsetzen.
% @todo readonly-tag: jeder innerhalb eines "Dependent" blocks definierten property einfach einen tag a la @verbatim @par "This property is readonly" @endverbatim hinzuzuf�gen. und da es sich in diesem falle eh um Methoden mit "get.<somename>" handelt w�re in einem solchen fall auch der hinweis "Getter is implemented" redundant/�berfl�ssig.
% done - "See also:" oder "See also" tags: diese sollte man ersetzen durch "\@sa". damit ist gew�hrleistet das die von Matlab selbst erzeugte dokumentation per "doc ." auch noch einigerma�en funktioniert.
% @todo Static methods: bei statischen methoden darf der erste parameter nicht weggenommen werden! das ist ja sonst "this", aber z.B. in der Klasse MatUtils gibt es eine static methode aus der der parameter "stencil" entfernt wird; dies gibt bei doxygen sp�ter ne fehlermeldung.
% @todo events in dokumentation einf�gen.
% @todo Adding folder to "glob" in mtoc.conf should also add all top-level functions with \@ingroup "name" to that module (adds a method summary)
% @todo The file list for each module should contain the full relative path within the project (subfolder/mfilename) 
% @todo allow detection of nested field parameters , i.e. if a param "model" is given, a reference to model.field1.subfield should be detected and "field1.subfield" be added to the required fields list.
% @todo luxus-version: if a field of the param "model" is used like "varname = model.structfield" any statement like "varname.field1" should result in a new entry "model.structfield.field1" in the required fields list (recursively)
% @todo if subroutines refer to a fcn param in the outer function's context, the call to any used field should be registered,too and the field added to the "required" list
% @todo einfache wiederholung der \@brief-zeile innerhalb der detailbeschreibungen!
% @todo f�r abstract-funktionen noch die kommentare mit einf�gen (sollten
% in der dokumentation oben dr�ber stehen..
% @todo den \@copydoc-befehl ggf. bei implementierungen von
% interface-funktionen oder abstracts einf�gen und die doku in einen
% eigenen \@par einf�gen ("Documentation from original declaration:")
% @todo nice-to-have: aufruf einer �berschriebenen superklassen-methode aus
% neuer methode f�gt kommentare aus superklassenmethode ein? oder zumindest
% ein hinweis + link auf originalmethode..
% @todo \@default-Tag f�r properties einf�hren
% @todo mtoc.conf -> m�glichkeit f�r add(returns) wie add(params)?
% @todo Bug: kommentare zwischen zwei funktionen in method-bl�cken geben
% nen parse error!
% @todo Scheinbar kann der parser zwar mehrfachvererbung, aber nur 2
% klassen (ein "&" zeichen). Das k�nnen aber mehrere sein!
% dinge wie "properties(Access=private);" mit ";" am ende geben nen parse
% error; matlab selbst juckts aber nicht. vielleicht einen hinweis einbauen
% oder am besten gleich ignorieren?
% @todo thismatlabtypesubstitute -> wird falls vorhanden wohl als typ f�r
% alle parameter angenommen! einfacher: den parameter einfach verschwinden
% lassen.
% @todo Kommentare zwischen function-bl�cken innerhalb von method-bl�cken
% (auskommentierte funktionen) f�hren zu parse errors
% @todo bei mehr als einem sub-package in der klassendeklaration bei
% vererbung (class1 < pck1.pck2.someclass & pck3.pck4.someotherclass)
% gibt's nen parse error nach "&"
% @todo einen @type-tag einf�hren, der bei properties den angegebenen Typ
% voranf�gt
% @todo code-umgebung funktioniert nicht in property-descriptions;
% @verbatim<code>some code</code>@endverbatim geht aber.
%
% @todo genestete funktionen werden geparst. sollten einfach gar nicht
% auftauchen..? sind ja private
%
% @todo r�ckgabeparameter f�r abstract-funktionen funktionieren nicht
% (parse error)
%
% @todo fhold zu wenig beim parsen des funktionennamens f�r abstracts; das
% erste zeichen wird abgeschnitten. (solver -> olver)
%
% @todo kein doxybody-parsing bei abstract functions
%
% @todo kopiere bei klassen, funktionen und properties die erste textzeile
% nochmal in die detailbeschreibung!
%
% @todo check welche LaTeX-funktionalit�ten man erreichen kann (idee: ein
% commandos/usepackage-file einbinden f�r mehr zeichen etc)
%
% @todo include getter&setter function comments (if set) into the documentation at
% the corresponding places
%
% @todo in class functions: do not remove the first function argument when
% the current method is an abstract method (only for functions with body)
%
% @todo konvention f�r mex-files: eine datei gleichen namens (wg.
% matlab-konvention) im ordner anlegen, die als erste zeile die
% methodensignatur enth�lt. diese wird von mtoc gelesen und als funktion
% hinzugef�gt! ''Achtung'' manchmal kann man im klassenfile auch
% verschiedene sichtbarkeiten f�r die methode deklarieren; in diesem fall
% wird die methode per mtoc schon zur klasse hinzugef�gt, allerdings ohne
% kommentar. matlab zeigt dann auch keine hilfe an (weil anderer access als
% public), aber die dokumentation kann ja beschreibungen anzeigen falls man
% welche hinzuf�gt; das macht vor allem bei protected-methoden sinn, da
% sollte man ja schon hilfe sehen k�nnen.
%
% @todo ausschalten der automatischen parameter- und r�ckgabewerte
% dokumentationsgenerierung durch mtoc falls der befehl @copydoc (oder
% @copydetail) im sonstigen kommentarfeld verwendet wird.
%
% @todo handling von events (event keyword f�r klassen) mit einbauen?!
%
% @todo gibt es eine sch�ne m�glichkeit default-werte f�r parameter mit
% einzubauen? f�r properties gibt es das ja schon, nur f�r optionale
% parameter w�re das keyword '@@default' ja auch ganz nett!
%
% @todo scheinbar mag mtoc so etwas wie @code
% SomeProp = struct('xi',[],'ti',[],'mui',[]); @endcode nicht! ist (war) in
% klasse AKernelCoreFun, parse error output:
% @verbatim
% Message: Grrrr!!!!
% Next 20 characters to parse: 
% [],'ti',[],'mui',[])
% ------------------------------------
% States are: ClassPart: Property
% PropParams: constant = 0
% MethodParams: 
% AccessStruct: full = Public get  = Public set  = Public
% @endverbatim
%
% @todo Definitionen wie @code classdef(Sealed) @endcode f�hren zu parse errors.
% Es gibt ein paar solcher direktiven f�r klassen, die zun�chst mal einfach �bergangen werden k�nnen
% oder ansonsten auch (falls sinnvoll �bertragbar) zu entsprechenden deklarationen in C �bersetzt
% werden sollten.



somevar = 1;