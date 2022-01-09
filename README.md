# Introduction to Interactive Prototyping for anyone

This is an introductory course to microcontrollers, sensors, and actuators using Arduino Nano 33 BLE Sense. Originally created for Malmo University students in the Spring term 2021.

## Why the Arduino Nano 33 BLE Sense

The Arduino Nano 33 BLE Sense comes with embedded sensors, BLE connectivity, and enough computing power to perform edge machine learning operations.

![Official Arduino Nano 33 BLE pinout](https://docs.arduino.cc/static/c18e027f826663ba9f16ffd94b60500f/ABX00031-pinout.png)

## Access the content

Content will be populated as time goes by. Check:

[THE INDEX FILE](course/en/course_index.md)

## Build the content

The content's scaffolding is created by running the build process. Check:

[THE BUILD FILE](BUILD.md)

## Updates

### 20220109: template generator

* De:bug the objectives were not checked, but the parts when rendering objectives. FIXED
* De:bug the header detection was only working the first time, now works also the other two times it shows up in the code. FIXED
* License removed from template as text and made into a variable. In the future it will be taken from a config file (like, most likely, all of the other variables like folder names and the like)
* Add *locale* folder for templates, opening the work towards courses with multiple translations
* Revised the *BUILD* file to reflect the addition of locales in the render
* NEW: added a template generator from a *CSV* file. This will allow for super simple localisation of the course structure, you will still need to translate the content, though ;-)

### 20220108: patching the folders

* Fixed the folder structure from hard-coded to variables to better support portability
* Removed any kind of content being empty from being rendered, this will allow for content to slowly show in the pages as it is being added to the spreadsheet (cool-to-have feature when slowly releasing courses)
* Added extra fields to the dataset to support all remaining information to fill in the templates
* Added code to render the new fields into the template
* Cleaned up multiple EOLs in the exercises appearing upon removal of unused fields

### 20220107: edit from Libreoffice

* Added headers to the data columns, added ability to jump over the header line in the dataset when iterating through the content
* Editing in Libreoffice implies converting numbers with leading zeroes into pure **ints**, this requires adding a leading zero addition to the numbering string when the index is below 10
* Added folder for local images, illustration of circuits, etc
* Added subfolder for images to specific exercises. Just to keep'm tidy


### 20220106: remove repetition

* Remove video prefix and suffix from the *CSV* file and put it into the script as variables. This reduces the dataset's size by 30%
* Tested (successfully) the usage of Libreoffice for editing the *CSV* file, exporting and bringing it back into the workflow

### 20220105: circuit bending

* Remove the circuit component if there is no circuit to show
* Updated the dataset to include the hasCircuit field
* Added an image to test in the breadboard exercise

### 20220104: the big separation

* Modified the separator in the *CSV* file to support text with commas
* Added parts to the exercises and the substitution in the creation script
* Separated exercise number from the filename, which will  allow ordering the articles in different ways by changing the number, sorting the dataset, and rendering the content
* Added a field to determine whether exercises have - or not - Arduino code. If not, removes it from the template

### 20220103: get an objective

* Includes objectives in the articles
* No video link? Remove it entirely from the template

### 20220102: the indexing commit

* Generates an index file
* Generates a navigation bar
* Basic rendering to *dcuartielles.github.io*

### 20220101: initial commit

* Script to render a new course starting from a *CSV* file including information about lecture names and video material
* Uses templates for code files and for articles
* Code is stored in the *src* folder
* Lectures are stored in the *course* folder
* Ready to support multi-language by storing original files under the *course/en* subfolder
* Creation code is under the *build* folder
* Configuration is under the *build/config* folder, including templates and *CSV* files
* Run the creation script if you make changes in the code, it will update the articles without having to copy-paste into the articles
* Fills in title of all code example files
* Fills in title and video information of all lecture materials

