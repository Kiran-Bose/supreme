# SUpreme <sup>TM</sup>
![Logo](https://github.com/Kiran-Bose/supreme/blob/master/SUpreme_Logo.jpg)

SUpreme is a command line file manager written in shell script.

SUpreme supports file management operations on phone(android),usb drive,cloud storage and local drive(Tested for ubuntu 18.04).

![Logo](https://github.com/Kiran-Bose/supreme/blob/master/SUpreme-1.3.9_Home.png)

## Dependencies

<details>
<summary>rclone</summary>
Supreme(>v1.1.22) uses package 'rclone'(>=v1.42) for cloud storage operations. rclone will be downloaded and installed automatically.

#### Incase rclone fails to install. 
* Get rclone [here](https://rclone.org/downloads/) 

</details>

<details>
<summary>jq</summary>
jq is a lightweight and flexible command-line JSON processor. jq will be downloaded and installed automatically.

#### Incase jq fails to install. 
* Get jq [here](https://stedolan.github.io/jq/download/)

</details>

<details>
<summary>curl</summary>
command line tool and library for transferring data with URLs. curl comes inbuilt in most of the Linux distros. If not curl will be downloaded and installed automatically.

#### Incase curl fails to install. 
* Get curl [here](https://curl.haxx.se/download.html)

</details>

## Usage

Type 'supreme' and hit enter in the bash terminal. Follow the instructions 

## Functionality Overview

<details>
<summary>(1)Manage Apps</summary>

    ----Open Apps                                  
    ----Configure App List

</details>

<details>
<summary>(2)Manage Files</summary>

    ----Search                        
    ----Navigate                
    ----Quick access         
    
                    |----Select File(s)
                    |----Select all
                    |----Inverse Selection
                    |----Range Selection
                    |----Make directory
                    |----Make file
                    |----back
                    |----home
                                                 
                                                  |----Open
                                                  |----Copy
                                                  |----Move
                                                  |----Delete
                                                  |----Rename
                                                  |----Send to Device
                                                  |----Upload to Cloud
                                                  |----Move to Cloud
                                                  |----Properties
                                                  |----Compress
                                                  |----Extract
                                                  |----Go Home



</details>


<details>
<summary>(3)Manage Phone</summary>

    ----Phone File Explorer           
    ----Sync
    ----Configure sync                          

</details>


<details>
<summary>(4)Manage USB</summary>

    ----USB File Explorer
    ----Format
    ----Sync
    ----Configure sync
    ----Create bootable USB

</details>


<details>
<summary>(5)Manage Cloud</summary>

    ----Cloud File Explorer
    ----Sync
    ----Configure sync
    ----Configure Cloud

</details>


<details>
<summary>(6)Manage Custom Scripts</summary>

    ----Add Script
    ----Remove Script(s)
    ----Modify Script
    ----Execute Script
    ----Run Commands

</details>

<details>
<summary>(p)Preferences</summary>

    ----Configure Quick Access Folders
    ----Themes

</details>

<details>
<summary>(X)Exit</summary>
</details>



## Install

<details>
<summary>Debian package install</summary>

```bash
Download debian package amd64.deb/i386.deb from release tab to any debian based Linux
install
```

</details>

<details>
<summary>Apt Package Manager</summary>

### For bionic and xenial

```bash
sudo add-apt-repository ppa:kiran.kb/supreme
sudo apt-get update
sudo apt-get install supreme
```
### For other ubuntu versions,this PPA can be added to your system manually by copying the lines below and adding them to your system's software sources.

```bash
deb http://ppa.launchpad.net/kiran.kb/supreme/ubuntu bionic main 
deb-src http://ppa.launchpad.net/kiran.kb/supreme/ubuntu bionic main
```
### And then run the following

```bash
sudo apt-get update
sudo apt-get install supreme
```
#### If it throws error, run the following

```bash
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys E021E2DC3302D8CE
sudo apt-get update
sudo apt-get install supreme
```
</details>

<details>
<summary>Git Install</summary>

* First clone the repository:  
```bash
git clone https://github.com/Kiran-Bose/supreme
```

* Then cd into the cloned directory:
```bash
cd supreme
```

* Run the guided install script with
```bash
. install.sh
```

</details>




## Update

<details>
<summary>Apt Package Manager</summary>

```bash
sudo apt update
sudo apt upgrade
```

</details>

<details>
<summary>Git Update</summary>

#### If the package is installed running '. install.sh' mentioned in Git install section, running it again will prompt for update if any.

* cd into the cloned directory:
```bash
cd supreme
```

* Run the guided install script with
```bash
. install.sh
```
</details>

#### Incase update fail. Uninstall and then install latest version.



## Uninstall

</details>

<details>
<summary>Apt Package Manager/Debian package uninstall</summary>

```bash
sudo apt remove supreme
```
	OR

```bash
sudo apt purge supreme
```

</details>

<details>
<summary>Git Uninstall</summary>


* If you don't have the supreme folder anymore clone the repository:  
```bash
git clone https://github.com/Kiran-Bose/supreme
```

* cd into the supreme directory:
```bash
cd supreme
```
* run the below command
```bash
. uninstall.sh
```

</details>


## Copyright

Copyright (C) 2019 by kiran Bose kiran.vkvr@gmail.com

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
 


