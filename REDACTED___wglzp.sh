#!/bin/bash

# Thank you PanicAcid and Elkentaro for sharing their work on this scripted upload
# Original - here >  https://github.com/panicacid/BabyDriver/blob/main/shutdown.sh


# Stop Kismet
 sudo supervisorctl stop all

echo "sleep 15"
sleep 15

# Process csv files to a zip 

# Get the current date and time
current_date=$(date +'%Y%m%d_%H%M%S')

# Source directory containing .wiglecsv files
source_dir="/mnt/ksmtlogs"

# Zip all .csv files into a single file
zip_file="${source_dir}/wigle_csv_${current_date}.zip"
find "$source_dir" -type f -name "*.wiglecsv" -exec zip -q "$zip_file" {} +

echo "All .csv files in $source_dir have been zipped into: $zip_file"

# Time to upload them to Wigle!

FILES2GO="/mnt/ksmtlogs/*.zip"

for f in $FILES2GO

do
APIName=
APIToken=
curl -X POST "https://api.wigle.net/api/v2/file/upload" -H "accept: application/json" -H "Content-Type: multipart/for>
done

# archive files 
# Source and destination folders
SOURCE_FOLDER="/mnt/ksmtlogs"
DESTINATION_FOLDER="/mnt/ksmtarchive"

# Move files from source to destination
mv "$SOURCE_FOLDER"/* "$DESTINATION_FOLDER"