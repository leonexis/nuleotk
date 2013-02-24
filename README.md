Nuleo Toolkit
=============
The Nuleo Toolkit (NTK) provides a development environment for working with 
microcontrollers. Its purpose is to take care of all the toolchain, debugging, 
and dependency requirements so a MCU project need only contain a small number 
of project-specific files.

Current Scope
-------------
Currently, NTK is runs under a Linux environment and only contains rules for 
the TI Stellaris Launchpad using the LM4F120H5QR MCU. Other ARM (and perhaps 
others) MCUs may be supported later. If you want NTK to support other MCUs, 
feel free fork the repository and submit pull requests when you finished 
adding those rules. If you don't want to code it yourself, sending the 
primary developer a developer board to play with wont hurt.

Installation
------------
Clone the repository anywhere you like and run:

	make

By default, it will download and compile the basic tools needed to compile a 
project and flash it to the Launchpad.

Creating a Project
------------------
Progress is being made on creating a project skeleton that includes no files 
under the TI click-rap license. Until then, you can create a project based on 
TI's example project yourself and remove the IPATH, VPATH, and ROOT 
variables and add the following:

	NTK_ROOT = ../nuleotk
	
	# set the default rule BEFORE including
	all:
	
	include $(NTK_ROOT)/definitions.mk
	
	flash_target = $(COMPILER)/blinky.bin
	flash: $(flash_target)
		$(LM4FLASH) $(flash_target)

Of course, this is subject to change once I have a skeleton project completed.
