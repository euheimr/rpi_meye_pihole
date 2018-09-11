
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
#	09/10/2018	Added motioneye information 
# 	09/10/2018 	Added required packages for motion and motioneye.
#				Reformatted script to use functions for -ALL- install procedures.
#				
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
#		Ref: https://motion-project.github.io/motion_build.html
#
#	MOTIONEYE:
#		https://github.com/ccrisan/motioneye/wiki/Installation
#		
#		Ref: https://github.com/ccrisan/motioneye/wiki/Install-On-Raspbian
#
# -----------------------------------------------------------------------------------------



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



# -----------------------------------------------------------------------------------------
# 	FUNCTIONS 
# -----------------------------------------------------------------------------------------

#Install everything listed in this script.



install_pihole(){
	#NOTE: EXTERNAL SCRIPT
	curl -sSL https://install.pi-hole.net | bash 
}
# -----------------------------------------------------------------------------------------
#	SECTION 1 - MOTION SETUP
# -----------------------------------------------------------------------------------------
install_motion(){
	#motion libraries - base packages - always install these
	sudo apt-get install autoconf automake build-essential pkgconf libtool git libzip-dev libjpeg-dev
	cd ~ 
	git clone https://github.com/Motion-Project/motion.git 
	cd motion 
	autoreconf -fiv 
}
# -----------------------------------------------------------------------------------------
#	SECTION 1 - MOTION OPTIONS SETUP
# -----------------------------------------------------------------------------------------
preferred_options(){
	#mysql
	install_mysql();
	#FFMpeg (Required for creating movies, using network cameras, etc.)
	sudo apt-get install libavformat-dev libavcodec-dev libavutil-dev libswscale-dev libavdevice-dev

	#PostgreSQL
	sudo apt-get install libpq-dev

	#SQLite3
	sudo apt-get install libsqlite3-dev

	#JPEG turbo
	sudo apt-get install libjpeg-turbo8 libjpeg-turbo8-dev

	#Webp Image Support
	sudo apt-get install libwebp-dev

}

# -----------------------------------------------------------------------------------------
#	MYSQL	TODO
# -----------------------------------------------------------------------------------------

install_mysql(){
	echo "Install MySql? ( y / n )."
	read ans
	do
	case $ans in 
		y)
		sudo apt-get install mysql-server libmysqlclient-dev
		;;
		n)
		;;
		*)
		echo "Invalid input."
		break;;
	
}

install_sqlite3(){
	echo "Install SQLite3? ( y / n )."
	read ans
}

# -----------------------------------------------------------------------------------------
#	INSTALL CORE OPTIONS
#	
#	options: 
#	FFMpeg (Required for creating movies, using network cameras, etc.)
#	PostgreSQL
#	JPEG turbo
#	Webp Image Support
# -----------------------------------------------------------------------------------------
###### TODO
#

./configure 
make 
make install

