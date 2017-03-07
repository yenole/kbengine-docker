#!/bin/bash
echo KBE_ROOT = \"${KBE_ROOT}\"
echo KBE_RES_PATH = \"${KBE_RES_PATH}\"
echo KBE_BIN_PATH = \"${KBE_BIN_PATH}\"

start(){
	$KBE_BIN_PATH/logger 		--cid=1129653375331859700 --gus=1&
	$KBE_BIN_PATH/interfaces 	--cid=1129652375332859700 --gus=2&
	$KBE_BIN_PATH/machine 		--cid=2129652375332859700 --gus=3&
	$KBE_BIN_PATH/dbmgr 		--cid=3129652375332859700 --gus=4&
	$KBE_BIN_PATH/baseappmgr 	--cid=4129652375332859700 --gus=5&
	$KBE_BIN_PATH/cellappmgr 	--cid=5129652375332859700 --gus=6&
	$KBE_BIN_PATH/cellapp 		--cid=7129652375332859700 --gus=8&
	$KBE_BIN_PATH/loginapp 		--cid=8129652375332859700 --gus=9&
	$KBE_BIN_PATH/baseapp 		--cid=6129652375332859700 --gus=7
}


stop(){
	pkill -9 machine
	pkill -9 dbmgr
	pkill -9 cellappmgr
	pkill -9 baseappmgr
	pkill -9 cellapp
	pkill -9 baseapp
	pkill -9 loginapp
	pkill -9 bots
	pkill -9 logger
	pkill -9 interfaces
	sleep 2
}

while true; do
	stop
	start
done

