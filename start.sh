#!/bin/bash
echo KBE_DT = \"${KBE_DT}\"
echo KBE_ROOT = \"${KBE_ROOT}\"
echo KBE_RES_PATH = \"${KBE_RES_PATH}\"
echo KBE_BIN_PATH = \"${KBE_BIN_PATH}\"

start(){
    idx=1
    for i in 'logger' 'machine' 'dbmgr' 'baseappmgr' 'cellappmgr'; do
        $KBE_BIN_PATH/$i            --cid=$idx'129653375331859700' --gus=$idx&
        idx=$[idx+1]   
    done
    for i in `seq 1 $KBE_LOGIN_NUM`; do
        $KBE_BIN_PATH/loginapp      --cid=$idx'129653375331859700' --gus=$idx&
        idx=$[idx+1]
    done
    $KBE_BIN_PATH/baseapp           --cid=$idx'129653375331859700' --gus=$idx
}

start