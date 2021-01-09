# Monstertov 2021
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )" # Get startup directory / working directory
FILES="${DIR}/*" # List files in working directory
for f in $FILES
do
	if [ "$f" != "${DIR}/update.sh" ]; then # Loop all files except this script
		f=$(basename $f)
		sudo cp $f /etc/init.d/$f # Copy the file to init.d
		sudo chmod +x /etc/init.d/ # Make sure file is executable
		sudo update-rc.d $(basename $f) defaults # Updates the System V style init script links for each file 
	fi
done
