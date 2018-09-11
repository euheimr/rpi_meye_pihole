
#!/bin/bash
# -----------------------------------------------------------------------------------------
# rpi_meye_pihole.sh - Pi-hole & Motioneye Service auto-install script
# -----------------------------------------------------------------------------------------
# 	!!!IMPORTANT!!!
#	This script does NOT support docker or docker containers!
#	Use this script on a targeted raspbian RPI via SSH and let the magic happen.
#
# 	Author: Jacob Betz
#		https://github.com/jacobbetz
#	
# 	Revision history:
# 	09/10/2018 	Added required packages for motion and motioneye.
#				Reformatted script to use functions for -ALL- installs.
# 	09/09/2018 	Created the script
#
#
# -----------------------------------------------------------------------------------------
#	Referenced Packages & Links
# -----------------------------------------------------------------------------------------
#
#	PI-HOLE AD BLOCKER
#		https://pi-hole.net/
#		PLEASE NOTE: This script pipes to bash using pi-hole's curl script
#			located here: https://install.pi-hole.net
#
#	MOTION PROJECT:
#		https://motion-project.github.io/
#		Reference material: https://motion-project.github.io/motion_build.html
#
#
#
# -----------------------------------------------------------------------------------------
# 	SECTION 0 - TODO
# -----------------------------------------------------------------------------------------
#   * Ask to install certain packages (y / n)
#	* Check if docker or not?
#
#
#
#
# -----------------------------------------------------------------------------------------
# 	FUNCTIONS 
# -----------------------------------------------------------------------------------------

#Install everything listed in this script.
install_all(){
	sudo -i
	install_pihole();
	install_motion();
	install_motion_options();
}

install_pihole(){
	
	#start the config and install.
	#see abo
	curl -sSL https://install.pi-hole.net | bash 
	
}
# -----------------------------------------------------------------------------------------
#	SECTION 1 - MOTION SETUP
# -----------------------------------------------------------------------------------------
install_motion(){
	#motion libraries - base packages - always install these
	sudo apt-get install autoconf automake build-essential pkgconf libtool libzip-dev libjpeg-dev git libavformat-dev libavcodec-dev libavutil-dev libswscale-dev libavdevice-dev libwebp-dev
}
# -----------------------------------------------------------------------------------------
#	SECTION 1 - MOTION OPTIONS SETUP
# -----------------------------------------------------------------------------------------
install_motion_options(){
	install_mysql();
}

# -----------------------------------------------------------------------------------------
#	MYSQL	TODO
# -----------------------------------------------------------------------------------------

install_mysql(){
	echo "Install MySql? ( y / n )."
	read 
	do
	read INPUT_STRING
	case $INPUT_STRING in 
		y)
		sudo apt-get install mysql-server libmysqlclient-dev
		n)
	

}

#
#
#
# -----------------------------------------------------------------------------------------
# -----------------------------------------------------------------------------------------

sudo apt-get install pkgconf libtool libzip-dev libjpeg-dev git libavformat-dev libavcodec-dev libavutil-dev libswscale-dev libavdevice-dev libwebp-dev
#motion libraries - FFMpeg Functionality
#(Required for creating movies, using network cameras, etc.)
sudo apt-get install libavformat-dev libavcodec-dev libavutil-dev libswscale-dev libavdevice-dev



cd ~ 
git clone https://github.com/Motion-Project/motion.git 
cd motion 
autoreconf -fiv 
./configure 
make 
make install

