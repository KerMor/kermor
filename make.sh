#!/bin/bash
###################################################################################
########################## DO NOT MODIFY ##########################################
###################################################################################

# Source directory
if [ ! -n "$KERMOR_SOURCE" ]; then
echo "No source directory specified (have you started a new shell since installation?). Aborting."
exit 0
fi
# Documentation output directory (log files and html)
# Note: This path is inserted in the Doxyfile at both the OUTPUT_DIRECTORY and HTML_DIRECTORY settings.
if [ ! -n "$KERMOR_DOCS" ]; then
echo "No output directory specified (have you started a new shell since installation?). Aborting."
exit 0
fi
# The doxygen binary to use
if [ ! -n "$KERMOR_DOXYBIN" ]; then
echo "No doxygen binary specified. Trying to use default command 'doxygen'..."
KERMOR_DOXYBIN="doxygen"
fi

if [ $# -lt 1 ]; then
  echo "No KerMor version argument given. Aborting.";
  exit
fi

# Check for mtoc++ installation
mtocppbin=mtocpp
postprocessbin=postprocess
if [ ! -n which $mtocpp -o ! -n which $postprocessbin ]; then
  echo "MtoC++ not installed. Aborting.";
  exit
fi

# Path to the base directory containing e.g mtoc binaries and configuration files
BaseDir="$KERMOR_SOURCE/documentation"
# New: all binaries, settings and extra documentation sources are in the same folder.
#BaseDir="$PWD"

# Check for doxygen's config file
if [ ! -f $BaseDir/Doxyfile.m4 ]; then
    echo "Error: $BaseDir/Doxyfile.m4 (configuration file) is missing!"
    exit 1;
fi

# Cleanup
echo "Deleting old files..."
#rm -rf $KERMOR_DOCS/html
rm -f $KERMOR_DOCS/warnings.log

echo "Creating shell scripts.."
# Create bash script that's excecuted in Doxygen
# mtocconv.sh is used as preprocessor in doxygen for m-files
# and simply wraps $BaseDir/mtoc
echo "#!/bin/bash
$mtocppbin \$1 $BaseDir/mtoc.conf" > $BaseDir/mtocconv.sh
chmod +x $BaseDir/mtocconv.sh

# Create bash script that runs latex in nonstopmode
echo "#!/bin/bash
latex --interaction=nonstopmode \$*" > $BaseDir/latexnonstop.sh
chmod +x $BaseDir/latexnonstop.sh

# Parse config file (Directly define macros here)
echo "Parsing configuration.."
m4params="-D OutputDirectory=$KERMOR_DOCS -D SourceDirectory=$KERMOR_SOURCE -D BaseDirectory=$BaseDir -D KERMORVERSION=$1"
if [ $# -eq 2 -a "$2" = "uml" ]; then
	echo "Uml-switch on: Generating UML-Style Diagrams!" 
	m4params+=" -D UMLSWITCH=UML_LOOK=YES"
else
	m4params+=" -D UMLSWITCH=UML_LOOK=NO"
fi
# Parse the Doxygen configuration
m4 $m4params $BaseDir/Doxyfile.m4 > $BaseDir/Doxyfile
# Parse the kermorlatex include style file
m4 -D BaseDirectory=$BaseDir $BaseDir/kermorlatex.m4 > $BaseDir/kermorlatex.sty

echo "Running doxygen.."
$KERMOR_DOXYBIN $BaseDir/Doxyfile 2>&1 1>$KERMOR_DOCS/doxygen.log | grep -v synupdate | grep -v docupdate | grep -v display | grep -v subsref | tee $KERMOR_DOCS/doxygen.err

echo "Postprocessing.."
cd $KERMOR_DOCS;
for i in *.html; do 
	$postprocessbin $i; 
done

echo "Deleting temporary files.."
rm $BaseDir/mtocconv.sh
rm $BaseDir/latexnonstop.sh
rm $BaseDir/Doxyfile
rm $BaseDir/kermorlatex.sty

if [ -s "$KERMOR_DOCS/warnings.log" ]; then
	#echo "Encountered warnings, opening log file.."
	#xdg-open $KERMOR_DOCS/warnings.log&
	echo "Logged warnings:"
	cat $KERMOR_DOCS/warnings.log
	echo "Complete log file in $KERMOR_DOCS/warnings.log"
else
	echo "No warnings issued!"
fi
echo "All done."