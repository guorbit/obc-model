#!/bin/bash

CAPELLA_VER=5.1.0

# The first commandline argument contains the folder which shall have the
# outputs of the export.
results_folder=${1:-/workdir}
mkdir -p ${results_folder}
# mkdir -p "/workdir/docs/validation"

# Import the project into the workspace and validate it
xvfb-run -s "-screen 0 1280x720x24" \
capella -nosplash -consoleLog \
-application org.polarsys.capella.core.commandline.core \
-appid org.polarsys.capella.core.validation.commandline \
-data /capella-workspace \
-import "/workdir" \
-input "/workdir/obc-model.aird" \
-outputfolder "/workdir/validation" \
-logfile ${results_folder}/log.html \
-forceoutputfoldercreation

# Export the model as HTML
# Note: It seems that Capella has a bug in this function that does not allow
# to use the import flag here.
xvfb-run -s "-screen 0 1280x720x24" \
capella -nosplash -consoleLog \
-application org.polarsys.capella.core.commandline.core \
-appid org.polarsys.kitalpha.doc.gen.business.capella.commandline \
-data /capella-workspace \
-filepath "/workdir/obc-model.aird" \
-outputfolder "/workdir/html" \
-logfile ${results_folder}/log.html \
-forceoutputfoldercreation

# Copy the validation and html output to the ${results_folder}/ that is mapped as a volume
cp -r "/workdir/html" ${results_folder}/html_export
cp -r "/workdir/validation" ${results_folder}/validation

# Create index.html from stub
sed 's/obc-model/g' index_stub.html > ${results_folder}/index.html
