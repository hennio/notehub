# ABOUT #
Notehub is a central point to create journals and notes. Synced on your own locations. 


# INSTALL #

Edit localsettings-default.env for your local folders and save as .env

The folders are:

cloudjournal + cloudnotes
	this folder should link to your favorite cloudservice. Preferably an Owncloud-folder.
	same location, except a folder for your notes
localjournal + localnotes
	the path to your local (host) folder to store your journal you do not trust in your cloudservice (eg work-stuff)
scripts
	this is de path to your personal bash-scripts, this path is appended to your $PATH. 
exports
	when you export to PDF, this is the location to look in (for both local and cloud)


# RUN #

Within the folder: 

docker container run notehub

# LIST OF COMMANDS #

makenote

makejournal

export2pdf 


