#!/bin/bash

CAPELLA_VER=6.0.0

# The first commandline argument contains the folder which shall have the
# outputs of the export.
results_folder=${1:-/workdir}
mkdir -p ${results_folder}

# Import the project into the workspace and validate it
xvfb-run -s "-screen 0 1280x720x24" \
capella -nosplash -consoleLog \
-application org.polarsys.capella.core.commandline.core \
-appid org.polarsys.capella.core.validation.commandline \
-data /capella-workspace \
-import "/workdir/obc-model" \
-input "/obc-model/obc-model.aird" \
-outputfolder "/obc-model/validation" \
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
-input "/obc-model/obc-model.aird" \
-outputfolder "/obc-model/html" \
-logfile ${results_folder}/log.html \
-forceoutputfoldercreation

# Copy the validation and html output to the ${results_folder}/ that is mapped as a volume
cp -r "/workdir/obc-model/html" ${results_folder}/html_export
cp -r "/workdir/obc-model/validation" ${results_folder}/validation

