#!/bin/bash
###################################################################################
###################### Adjust PATHs here ##########################################
###################################################################################
# Source directory
SourceDir="/home/dwirtz/aghhome/Software/KerMor/Source"

# Documentation output directory (log files and html)
# Note: This path is inserted in the Doxyfile at both the OUTPUT_DIRECTORY and HTML_DIRECTORY settings.
OutDir="/afs/.mathe/public/www/ians/agh/documentation/kermor"

# The doxygen binary to use
doxybin="/afs/.mathe/project/agh/shared_software/doxygen/bin/doxygen"


###################################################################################
########################## DO NOT MODIFY ##########################################
###################################################################################
# Path to the base directory containing e.g mtoc binaries and configuration files
#BaseDir="$SourceDir/documentation"
# New: all binaries, settings and extra documentation sources are in the same folder.
BaseDir="$PWD"

# Check for doxygen's config file
if [ ! -f $BaseDir/Doxyfile.m4 ]; then
    echo "Error: $BaseDir/Doxyfile.m4 (configuration file) is missing!"
    exit 1;
fi

# Cleanup
echo "Deleting old files..."
#rm -rf $OutDir/html
rm -f $OutDir/warnings.log

echo "Creating shell scripts.."
# Create bash script that's excecuted in Doxygen
# mtocconv.sh is used as preprocessor in doxygen for m-files
# and simply wraps $BaseDir/mtoc
echo "#!/bin/bash
$BaseDir/mtoc \$1 0 $BaseDir/mtoc.conf" > $BaseDir/mtocconv.sh
chmod +x $BaseDir/mtocconv.sh

# Create bash script that runs latex in nonstopmode
echo "#!/bin/bash
latex --interaction=nonstopmode \$*" > $BaseDir/latexnonstop.sh
chmod +x $BaseDir/latexnonstop.sh

# Parse config file (Directly define macros here)
echo "Parsing configuration.."
m4params="-D OutputDirectory=$OutDir -D SourceDirectory=$SourceDir -D BaseDirectory=$BaseDir"
if [ $# -eq 1 -a "$1" = "uml" ]; then
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
$doxybin $BaseDir/Doxyfile 2>&1 1>$OutDir/doxygen.log | grep -v synupdate | grep -v docupdate | grep -v display | grep -v subsref | tee $OutDir/doxygen.err

echo "Postprocessing.."
cd $OutDir;
for i in *.html; do 
	$BaseDir/postprocess $i; 
done

echo "Deleting temporary files.."
rm $BaseDir/mtocconv.sh
rm $BaseDir/latexnonstop.sh
rm $BaseDir/Doxyfile
rm $BaseDir/kermorlatex.sty

if [ -s "$OutDir/warnings.log" ]; then
	echo "Encountered warnings, opening log file.."
	kwrite $OutDir/warnings.log&
else
	echo "No warnings issued!"
fi
echo "All done."