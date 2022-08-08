#!/bin/sh

#bash script that does everything. 


GREEN='\033[0;32m'
NC='\033[0m' 
RED='\033[0;31m'
if  [ -e latex/cv.pdf ]; then 
    sudo rm -rf ~/cv/latex/cv.aux 
    sudo rm -rf ~/cv/latex/cv.fls
    sudo rm -rf ~/cv/latex/cv.log
    sudo rm -rf ~/cv/latex/cv.out
    sudo rm -rf ~/cv/latex/cv.fdb_latexmk
    sudo rm -rf ~/cv/latex/cv.synctex.gz
    sudo rm -rf ~/cv/token_drive_v3

    echo -e "\n \n ${GREEN}removed log files${NC} \n \n" 

    echo "$1: is the commit message"

    sudo rm -rf ~/cv/pdf/cv.pdf

    mv ~/cv/latex/cv.pdf ~/cv/pdf/cv.pdf
    sudo rm -rf ~/cv/token_drive_v3
    GIT='git --git-dir='$PWD'/.git'
    $GIT add .
    $GIT commit -m "$1"
    $GIT push 


    echo -e "\n \n ${GREEN}cv file will be deleted in website${NC} \n \n"
    pushd ~/vscode/youtube/mywebsite/abhi-glitchhg/files
    sudo rm -rf ~/vscode/youtube/mywebsite/abhi-glitchhg/files/cv.pdf
    popd 

    cp ~/cv/pdf/cv.pdf ~/vscode/youtube/mywebsite/abhi-glitchhg/files/cv.pdf
    echo -e "\n \n${GREEN}Updated CV has been moved to the Website directory,${NC}\n\n"

    pushd ~/vscode/youtube/mywebsite/abhi-glitchhg
    GIT='git --git-dir=/home/abhijit/vscode/youtube/mywebsite/abhi-glitchhg/.git'
    $GIT add .
    $GIT commit -m "$1 but in website :) "
    $GIT push 
    echo -e "\n \n ${GREEN}hopefully website will be updated... ${NC} \n \n \n "
    popd 

    echo -e "${GREEN} Updating the file in drive. ${NC} \n \n \n"

    source ~/anaconda3/etc/profile.d/conda.sh
    conda activate cv_drive
    python drive_update.py
    conda deactivate
    sudo rm -rf ~/cv/token_drive_v3

else 

    echo -e "${RED}No pdf file- ${FILE}  exists in latex folder, please compile the tex file again and then run bash /.post_processing.sh .${NC} "
fi 