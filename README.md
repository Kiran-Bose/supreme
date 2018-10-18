# supreme
Supreme is a command line file manager written in shell script.

Supreme supports file management operations on phone(android),usb drive,cloud storage and local drive(Tested for ubuntu 18.04).

Download the deb package to any debian based system and install

Supreme(>V1.1.22) uses package 'rclone'(1.42) for cloud storage operations.  rclone will be downloaded and installed automatically.

    visit below link to download latest version of rclone incase rclone fails to install. 
  https://rclone.org/downloads/ 

You may also add supreme from PPA:
For bionic and xenial, do the following:

    sudo add-apt-repository ppa:kiran.kb/supreme
    sudo apt-get update
    sudo apt-get install supreme
    
 For other ubuntu versions,this PPA can be added to your system manually by copying the lines below and adding them to your system's software sources.

    deb http://ppa.launchpad.net/kiran.kb/supreme/ubuntu bionic main 
    deb-src http://ppa.launchpad.net/kiran.kb/supreme/ubuntu bionic main
    
   If it throws error for gpg keys, run the following in a terminal window
   
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys E021E2DC3302D8CE

Usage: Type 'supreme' and hit enter in the bash terminal. Follow the instructions

Functionality overview

(1)Open Apps  


    ----Firefox                                  
    ----Calculator          
    ----Settings               
    
(2)Manage Files   


    ----Search                        
    ----Navigate                
    ----Quick access         
    
                    |----Select File(s)
                    |----Select all
                    |----Inverse Selection
                    |----Make directory
                    |----Make file
                    |----Go back
                    |----Go home
                                                 
                                                  |----Open
                                                  |----Copy
                                                  |----Move
                                                  |----Delete
                                                  |----Rename
                                                  |----Send to Device
                                                  |----Upload to cloud
                                                  |----Properties


(3)Manage Phone    


    ----Move/Copy from phone          
    ----Move/Copy to phone            
    ----Sync folders                          
    
(4)Manage USB 


    ----Move/Copy from USB        
    ----Move/Copy to USB  
  
 (5)Manage Cloud
 
    ----Upload to cloud
    ----Download from cloud
    ----Delete from cloud
    ----Move/copy cloud resource
    ----Configure cloud
    
 (6)Manage Custom Scripts
 
    ----Add Script
    ----Remove Script(s)
    ----Modify Script
    ----Execute Script
    ----Run Commands
