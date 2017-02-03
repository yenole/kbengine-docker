#!/bin/bash
echo KBE_ROOT = \"${KBE_ROOT}\"
echo KBE_RES_PATH = \"${KBE_RES_PATH}\"
echo KBE_BIN_PATH = \"${KBE_BIN_PATH}\"

$KBE_BIN_PATH/logger 		--cid=1129653375331859700 --gus=1&
$KBE_BIN_PATH/interfaces 	--cid=1129652375332859700 --gus=2&
$KBE_BIN_PATH/machine 		--cid=2129652375332859700 --gus=3&
$KBE_BIN_PATH/dbmgr 		--cid=3129652375332859700 --gus=4&
$KBE_BIN_PATH/baseappmgr 	--cid=4129652375332859700 --gus=5&
$KBE_BIN_PATH/cellappmgr 	--cid=5129652375332859700 --gus=6&
$KBE_BIN_PATH/baseapp 		--cid=6129652375332859700 --gus=7&
$KBE_BIN_PATH/cellapp 		--cid=7129652375332859700 --gus=8&
$KBE_BIN_PATH/loginapp 		--cid=8129652375332859700 --gus=9&

bcid=6129652375332859700
ccid=7129652375332859700

while true; do
	sleep 60
	num=`ps -ef | grep baseapp | grep -v 'grep' | grep -v 'mgr' |wc -l`
	if [ $num = 0 ]; then
		echo 'Baseapp start...'
		$KBE_BIN_PATH/baseapp --cid=$(($bcid+1)) --gus=7&
	fi
	num=`ps -ef | grep cellapp | grep -v 'grep' | grep -v 'mgr' |wc -l`
	if [ $num = 0 ]; then
		echo 'Cellapp start...'
		$KBE_BIN_PATH/cellapp --cid=$(($ccid+1)) --gus=8&
	fi
done