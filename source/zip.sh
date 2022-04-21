#!/bin/sh
# Zip PDF files into a portfolio archive of the same name as the folder
# copied to the root of the project, one level below.
#
# Parameters:
#   $1 - name or relative path to the folder to zip
#   $2 - optional, pattern of files to include.
#        Defaults to '*.pdf'.
#   $3 - optional, relative path to the destination file.
#        Defaults to "../$1.zip".
folderName="$1"
filesPattern="${2:-*.pdf}"
destinationZip="${3:-../$1.zip}"

if test -z "$folderName"
then
  echo "Usage: $0 folderName [filesPattern] [destinationZip]"  >&2
  exit 1
fi

cd "$(dirname "$0")"

if test -f "$destinationZip"
then
  echo "Delete $destinationZip"
  rm "$destinationZip"
fi

echo "Zip $filesPattern into $destinationZip..."
zip "$destinationZip" "$folderName"/$filesPattern

echo "Done."
