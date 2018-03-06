#!/bin/bash
#################################################
# COMPILAR COSILLAS
#################################################

#################################################
# crear los tar.gz de las carpetas de packages
#################################################

# read -p "Do you want to make tar/zip packages (y/n)? " -n 1 -r
# echo    # (optional) move to a new line
# if [[ ! $REPLY =~ ^[Yy]$ ]];then

read -r -p "Do you want to make RPi Cores packages? [y/n] " response
case $response in
    [yY][eE][sS]|[yY]) 
       
    echo "Compilamos las carpetas de packages..."
	cd packages && tar -zcvf libretro-cores-RPi.tar.gz libretro-cores-RPi/ && cd ..
	cd packages && split -b 24M libretro-cores-RPi.tar.gz "libretro-cores-RPi.tar.gz.part." && cd ..
	rm packages/libretro-cores-RPi.tar.gz

        ;;
    # *)
        # do_something_else
        # ;;
esac

read -r -p "Do you want to make s812 Cores packages? [y/n] " response
case $response in
    [yY][eE][sS]|[yY]) 
       
    echo "Compilamos las carpetas de packages..."
	cd packages && tar -zcvf libretro-cores-s812.tar.gz libretro-cores-RPi/ && cd ..
	cd packages && split -b 24M libretro-cores-s812.tar.gz "libretro-cores-s812.tar.gz.part." && cd ..
	rm packages/libretro-cores-s812.tar.gz

        ;;
    # *)
        # do_something_else
        # ;;
esac

read -r -p "Do you want to make Generic Cores packages? [y/n] " response
case $response in
    [yY][eE][sS]|[yY]) 
       
    echo "Compilamos las carpetas de packages..."
	cd packages && tar -zcvf libretro-cores-Gen.tar.gz libretro-cores-Gen/ && cd ..
	cd packages && split -b 24M libretro-cores-Gen.tar.gz "libretro-cores-Gen.tar.gz.part." && cd ..
	rm packages/libretro-cores-Gen.tar.gz

        ;;
    # *)
        # do_something_else
        # ;;
esac


read -r -p "Do you want to make AEL asset package? [y/n] " response
case $response in
    [yY][eE][sS]|[yY]) 
       
    echo "Compilamos la carpeta de assets de AEL..."
	cd packages/emulators && tar -zcvf ael-assets.tar.gz ael-assets/ 
    mv ael-assets.tar.gz ../ && cd ..
        ;;
    # *)
        # do_something_else
        # ;;
esac


#################################################
# crear los zips de las versiones del addon con los zips de data
#################################################

# ADDON_VERSION="OLE"
# ADDON_VERSION="LE8alpha"
# ADDON_VERSION=$1

# read -r -p "Do you want to make addon zip file for "$1"? [y/n] " response
# case $response in
#     [yY][eE][sS]|[yY]) 
	
# 	echo "Compilamos las carpetas de data..."
# 	mkdir script.gamestarter/resources/data/
# 	# advancedemulatorlauncher.tar.gz | advancedlauncher.tar.gz | emulators.tar.gz | libretro-part1.tar.gz | libretro-part2.tar.gz | retroarch.tar.gz
# 	# subir cada package actualizando el existente
# 	# cd packages && tar -zcvf ../script.gamestarter/resources/data/emulators.tar.gz emulators/ && cd ..
# 	cp -R packages/emulators emulators
# 	rm -rf emulators/roms/ports
# 	# cd packages && tar -zcvf ../script.gamestarter/resources/data/emulators.tar.gz emulators/ && cd ..
# 	tar -zcvf script.gamestarter/resources/data/emulators.tar.gz emulators/
# 	rm -rf emulators
# 	cd packages && tar -zcvf ../script.gamestarter/resources/data/plugin.program.advanced.emulator.launcher.tar.gz plugin.program.advanced.emulator.launcher/ && cd ..
# 	cd packages && tar -zcvf ../script.gamestarter/resources/data/plugin.program.advanced.launcher.tar.gz plugin.program.advanced.launcher/ && cd ..
	
# 	mkdir retroarch
# 	# mkdir packages/retroarch-temp/playlists
# 	cp -R packages/retroarch/. retroarch
# 	rm retroarch/retroarch_OLE
# 	rm retroarch/retroarch_LE8
# 	tar -zcvf script.gamestarter/resources/data/retroarch.tar.gz retroarch/
# 	rm -rf packages/retroarch/playlists
# 	rm -rf retroarch

# 	cd packages && tar -zcvf ../script.gamestarter/resources/data/frontend-assets.tar.gz frontend-assets/ && cd ..
# 	cd packages && tar -zcvf ../script.gamestarter/resources/data/libretro-cores.tar.gz libretro-cores/ && cd ..
# 	cd script.gamestarter/resources/data/ && split -b 24M libretro-cores.tar.gz "libretro-cores.tar.gz.part." && cd ../../../
# 	rm script.gamestarter/resources/data/libretro-cores.tar.gz
# 	cp packages/plugin.program.advanced.emulator.launcher.zip script.gamestarter/resources/data
# 	cp packages/advanced-launcher-2.5.8.zip script.gamestarter/resources/data


# 	echo "compilamos los zips..."
# 	mkdir -p builds/script.gamestarter
# 	cp -R script.gamestarter builds/

# 	if [ "$ADDON_VERSION" = "OLE" ]; then
# 		echo "Compilamos el addon para "$ADDON_VERSION" ..."
# 		# OLE
# 		# install.sh ADDON_VERSION
# 		sed -i '/#versionstart/,/#versionend/s/ADDON_VERSION="XXX"/ADDON_VERSION="OLE"/' builds/script.gamestarter/resources/bin/install.sh

# 		# retroarch OLE
# 		# mv builds/script.gamestarter/resources/bin/retroarch_1.5.0_OE6 builds/script.gamestarter/resources/bin/retroarch
# 		cp packages/retroarch/retroarch_OLE builds/script.gamestarter/resources/bin/retroarch
# 		# rm builds/script.gamestarter/resources/bin/retroarch_1.5.0_LE8
		
# 		# seleccionar advanced launcher
# 		rm builds/script.gamestarter/resources/data/plugin.program.advanced.emulator.launcher.tar.gz
# 		rm builds/script.gamestarter/resources/data/plugin.program.advanced.emulator.launcher.zip

# 		# dejar las libs necesarias: /lib/libbrcmEGL.so y /lib/libbrcmGLESv2.so para glupen64
# 		# rm builds/script.gamestarter/lib/README.md
# 		# quitar las libs -> nuevo core compilado no las necesita
# 		rm -rf builds/script.gamestarter/lib

# 	else
# 		echo "Compilamos el addon para "$ADDON_VERSION" ..."
# 		# LE8alpha:
# 		# install.sh ADDON_VERSION
# 		sed -i '/#versionstart/,/#versionend/s/ADDON_VERSION="XXX"/ADDON_VERSION="LE8"/' builds/script.gamestarter/resources/bin/install.sh

# 		# retroarch LE8
# 		cp packages/retroarch/retroarch_LE8 builds/script.gamestarter/resources/bin/retroarch
# 		# mv builds/script.gamestarter/resources/bin/retroarch_1.5.0_LE8 builds/script.gamestarter/resources/bin/retroarch
# 		# rm builds/script.gamestarter/resources/bin/retroarch_1.5.0_OE6

# 		# seleccionar advanced emulator launcher
# 		rm builds/script.gamestarter/resources/data/plugin.program.advanced.launcher.tar.gz
# 		rm builds/script.gamestarter/resources/data/advanced-launcher-2.5.8.zip

# 		# quitar las libs
# 		rm -rf builds/script.gamestarter/lib

# 	fi

# 	# crear el zip
# 	# TIMESTAMP=`date +%Y%m%d%k%M%S`
# 	TIMESTAMP=`date +%Y%m%d%H%M%S`
# 	cd builds && zip -r script.gamestarter-$ADDON_VERSION-$TIMESTAMP.zip script.gamestarter/ && cd ..
# 	rm -rf builds/script.gamestarter/
# 	rm -rf script.gamestarter/resources/data
# esac


echo "done!"
