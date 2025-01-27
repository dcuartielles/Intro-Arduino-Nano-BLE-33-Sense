# Build the project

## Install dependencies

If you are willing to export your sites to anything that is not Markdown, you will need to use the *pandoc* universal translation tool. It will allow converting the generator's outputs into HTML, PDF, LaTeX, amongst others.

`sudo apt install pandoc`

## Build the templates

Prior to creating a course, you need to define the templates you will be using. The call for the template generation goes as follows:

`./create_templates.sh -d config -c config -f templates.csv`

and you have to call it inside the *build* folder. It will create a series of subfolders inside the *config* folder. First it will try to create *config* folder itself; this is done to allow testing the script. Next it will create a subfolder called *templates*. Inside that one, it will create a folder called *pages*, and inside that one, it will create one subfolder for each locale such as *en*, *es*, etc.

The different templates can be defined in the *CSV* file *templates.csv*. Creating a new template structure and thus a new site for a new translation is as easy as adding a new record to the file for each template design.

It is possible to create templates using all default parameters with `./create_templates.sh`

## Create the site's scaffolding

You will create a site by calling the *empty_site.sh* script as follows:

`./empty_site.sh -d config -c config -f templates.csv -l en`

which will create a series of subfolders inside the *config* folder. It will create a folder called *site*, with subfolder *pages*. Inside *pages* the system will create a folder for the locale, in the example *en*. That final folder will contain the *pages.csv* file which is the output of this script.

This file will contain the information about the default templates used in the header. The *header* is contained in the first three rows of the *CSV* file.

The default configuration considers *config* as default setting for destination and setup folders, *templates.csv* as the file to be generated, and *en* as the default locale. Therefore, calling `./empty_site.sh` with no parameters will have the same effect.

## Build the facade

Use the *populate_site.sh* script to add records to the *pages.csv* file automatically or manually (field by field). I recommend the semiautomatic mode by typing:

`./populate_site.sh -l e
n -c config -f pages.csv -m semiautomatic`

You will just get the question of how many records you want to add to the file and which is the template to use for each record.

Possible modes are: `automatic`, `semiautomatic` and `manual`

The fastest way to create a site with 10 pages would be:

`./populate_site.sh -n 10`

## Edit the pages file

You need to add your content to the *en/pages.csv* file. Make sure you include the properties needed for each type of content.

## Build the site

Once the templates have been created, render the markdown of the site by simply calling:

`./render_site.sh -l en -r .. -c config -f pages.csv`

inside the *build* folder. It will create all of the folders, *MD*, and code files based on templates. From there you will have the opportunity of modifying the content once more. Use the editor of your choice.

The parameters for the *render_site.sh* script are:

* l, locale: en, es, etc.
* r, render: folder where the site will be rendered into
* c, config: name of the folder with templates and the like, typically *config*
* f, file: name of the *CSV* file containing the course

You will have to call it once per locale, which also means you should need the actual *CSV* file for the corresponding language.

## Export your site to other formats

The way information is built in the form of Markdown files requires some considerations depending on which kind of outputs you might expect from the generator. For example, if you are looking at having an HTML site, you will have to convert each one of the *\*.md* files separately, index included. On the other hand, if you are looking at making a printing-ready PDF, you might have to download all of the images, compose everything into a single file, and then call the *pandoc* script with the options to generate a *TOC* (table of contents).

The export script is wrapping the call to *pandoc* after making some preparation work with the file. Call it as follows:

`./export_site.sh -t HTML -r ..`

The parameter for the *export_site.sh* script are:

* l, locale: en, es, etc.
* t, type of output: HTML, PDF
* r, render: folder where the site was rendered into
* p, pandoc parameters: a string containing the non-default settings for *pandoc*

## Note

* The *CSV* separator in use is the **¤** symbol in order to have commas within the text
* Current version of the code does not entertain the idea of localised code (but might happen)
