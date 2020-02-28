#!/usr/bin/Rscript
#Rename_Files.R
#rename files matching pattern in specified directory
#Nicholas Clifton 
#19 Feb 2020

##################################
# Set the working directory here #
##################################

setwd("~/Documents/Bioinformatics/Matlab/Jack_Peter/C2/")


######################
# Load the filenames #
######################

# This might need changing if there is a different pattern common to all of your files.
# This assumes all your files contain '.tiff'.

old_filenames <- dir(pattern = "*.tif*")

########################
# Adjust the filenames #
########################

# if you want to keep any other special characters, just add them after the '_'

# new_filenames <- gsub("[^[:alnum:]+_]", "", old_filenames)
new_filenames <- gsub("(.*_ome_)(.*).tif", "\\1tiff_\\2_tif.tif", old_filenames)

######################
# Apply to the files #
######################

file.rename(old_filenames, new_filenames)

