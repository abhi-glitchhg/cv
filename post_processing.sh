#!/bin/sh

#bash script that does adds changes to git and updates the drive file.


GREEN='\033[0;32m'
NC='\033[0m' 
RED='\033[0;31m'
if  [ -e latex/cv.pdf ]; then 
    sudo rm -rf $PWD/latex/cv.aux 
    sudo rm -rf $PWD/latex/cv.fls
    sudo rm -rf $PWD/latex/cv.log
    sudo rm -rf $PWD/latex/cv.out
    sudo rm -rf $PWD/latex/cv.fdb_latexmk
    sudo rm -rf $PWD/latex/cv.synctex.gz
    sudo rm -rf $PWD/token_drive_v3

    echo -e "\n \n ${GREEN}removed log files${NC} \n \n" 

    echo "$1: is the commit message"

    sudo rm -rf $PWD/pdf/cv.pdf

    mv $PWD/latex/cv.pdf $PWD/pdf/cv.pdf

    GIT='git --git-dir='$PWD'/.git'
    $GIT add .
    $GIT commit -m "$1"
    $GIT push 



    echo -e "${GREEN} Updating the file in drive. ${NC} \n \n \n"

    source ~/anaconda3/etc/profile.d/conda.sh
    conda activate cv_drive
    python drive_update.py
    conda deactivate
    sudo rm -rf $PWD/token_drive_v3

else 

    echo -e "${RED}No pdf file- ${FILE}  exists in latex folder, please compile the tex file again and then run bash /.post_processing.sh .${NC} "
fi 