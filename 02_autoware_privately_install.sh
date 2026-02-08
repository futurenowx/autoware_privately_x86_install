#!/bin/bash

set -e  # stop on error


# Go to home directory
cd "$HOME"


# Check if folder exists
if [ -d "autoware.privately-owned-vehicles" ]; then
    mv autoware.privately-owned-vehicles autoware.privately-owned-vehicles_old
    echo "✅ Folder renamed to autoware.privately-owned-vehicles_old"
else
    echo "ℹ️ Folder autoware.privately-owned-vehicles not found, skipping rename"
fi

cd "$HOME"

# Clone Autoware repository
git clone https://github.com/autowarefoundation/autoware.privately-owned-vehicles.git

# Rename Models folder
mv autoware.privately-owned-vehicles/Models/visualizations \
   autoware.privately-owned-vehicles/Models/visualizations_old
   

# Go to $HOME/autoware_privately_x86_install folder
cd "$HOME/autoware_privately_x86_install" || { echo "❌ Cannot enter $Home folder"; exit 1; }


# Clone the repo (rename old folder if exists)
#if [ -d "autoware_privately_x86_install" ]; then
#    mv autoware_privately_x86_install_old
#    echo "Existing folder renamed to autoware_privately_temp_old"
#fi
# Enter the cloned repo
#cd autoware_privately_x86_install || { echo "❌ folder autoware_privately_temp do not exist"; exit 1; }
#git clone https://github.com/futurenowx/autoware_privately_install.git


# copy folder visualization to autoware.privately-owned-vehicles/Models

SOURCE="autoware_projetcs"
DEST="$HOME"

if [ -d "$SOURCE" ]; then
    cp -r "$SOURCE" "$DEST"
    echo "Folder copied successfully"
else
    echo "Error: Source folder does not exist"
    exit 1
fi


# copy folder visualization to $HOME

SOURCE="visualization"
DEST="$HOME/autoware.privately-owned-vehicles/Models"

if [ -d "$SOURCE" ]; then
    cp -r "$SOURCE" "$DEST"
    echo "Folder copied successfully"
else
    echo "Error: Source folder does not exist"
    exit 1
fi

echo "✅ Step1 install completed successfully, now download the weights and run 03_autoware_weights_install.sh.
Please check the install.txt!"
