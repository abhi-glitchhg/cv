# CV Template
 
 Original author: [Trey Hunner](http://www.treyhunner.com/) 
:smile:

 Important note:
 This template requires the `resume.cls` file to be in the same directory as the `cv.tex` file. The resume.cls file provides the resume style used for structuring the document.
 

Built with `LaTex Workshop` Vscode extension. 
 
### Uploading cv to drive. 

Each time you update your cv/resume and upload it on drive, new file id is created for each file. You can avoid this and keep using same file id (that is same url) for your updated cv/resumes. 

You will need to upload the cv for first time, and then note down the file id for the cv. We will use it later. 
if the link for the file is https://drive.google.com/file/d/1fI1IJBeQgKoasgluF17P9Ys2zU6eC2WX ; the file id wil be: 1fI1IJBeQgKoasgluF17P9Ys2zU6eC2WX

1) Make sure you have python installed. If not, visit [this](https://www.python.org/downloads/)
2) Open command prompt and navigate to the parent directory for cv directory. In my case this is 
```bash
~/cv >  
```
3) Install the dependancies by running  
```bash 
# using virtual environment is preferred.
pip install -r requirements.txt
```
4) Go to the drive api console and create a new project. Read more about it [here](https://developers.google.com/drive/api/guides/enable-drive-api)
5) In the left side bar of the console, you will find library button, click on it and add `google drive api` library to the project.
6) Again in the left side bar of the cosolde, you will find the `credentials` button, click on it and select OAth client Id, fill in the information  and after finishing it, download the secret json keys (Dont share/upload this file in public forums.) We will assume that you have saved the json file as  `secret.json`. If you have saved with some other name, please updat the 54th line of `update_drive.py` script accordingly. 

7) Remember the file id for the file uploaded on the drive? Replace the 65th line in the  `drive_update.py` with appropriate file id. 

8) If you have followed all of the steps, you can run 
```bash
python drive_update.py
```
This will pop up authentication and if it is sucessful, the file will be updated. Now you can change your cv for unlimited times, your drive url will remain same (dont forget to run above code block to update the files in the drive :smile:). 


9) Additionally,  you can use git for versioning, But remember to create `.gitignore` file and add `secret.json` or the name for secret json keys in the gitignore file. Exposing the keys in public is definitely not recommended.

