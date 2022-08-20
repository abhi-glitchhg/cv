## CV template
 
 Original author: [Trey Hunner](http://www.treyhunner.com/) 

:smile:

Built with `LaTex Workshop` Vscode extension. [Github repo](https://github.com/James-Yu/LaTeX-Workshop)
 
### Uploading cv to drive. 

Each time you update your cv/resume and upload it on drive, new file id is created for each file. You can avoid this and keep using same file id (that is same url) for your updated cv/resumes. Further you embed the drive file in personal websites.

You will need to upload the cv for first time, and then note down the file id for the cv. We will use it later. 
if the link for the file is https://drive.google.com/file/d/1fI1IJBeQgKoasgluF17P9Ys2zU6eC2WX ; the file id wil be: `1fI1IJBeQgKoasgluF17P9Ys2zU6eC2WX`
Make sure you have latex packages installed, you can install texmaker
1) Make sure you have python and anaconda installed. If not, visit [this](https://www.python.org/downloads/) and [this](https://anaconda.org/)
2) Open command prompt and navigate to the parent directory for cv directory. In my case this is 
```bash
~/cv >  
```
3) Install the dependancies by running  
```bash 
conda create --name cv_env python
pip install -r requirements.txt
```
4) Go to the drive api console and create a new project. Read more about it [here](https://developers.google.com/drive/api/guides/enable-drive-api)
5) In the left side bar of the console, you will find `library` button, click on it and add `google drive api` library to the project.
6) Again in the left side bar of the cosolde, you will find the `credentials` button, click on it and select OAth client Id, fill in the information  and after finishing it, download the secret json keys (Dont share/upload this file in public forums.) We will assume that you have saved the json file as  `secret.json`. If you have saved with some other name, please updat the 54th line of `update_drive.py` script accordingly. 

7) Remember the file id for the file uploaded on the drive? Replace the 65th line in the  `drive_update.py` with appropriate file id. Also make sure that you have added name of your secret files in `.gitignore`.

8) Make appropriate changes in tex file, saving this tex file will generate log files and also compile `cv.pdf`. 


9)When you are satisfied with the changes, just run 
```bash
bash ./post_processing.sh "add commit message here"
```
This will cleanup the log files, add and push files to git. It will also try to update the file in drive. After finishing the authentication, file will be updated.



