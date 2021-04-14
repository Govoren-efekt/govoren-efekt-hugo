#!/bin/bash
#===============================================================================
#
#          FILE:  deploy.sh
# 
#         USAGE:  ./deploy.sh 
# 
#   DESCRIPTION:  
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Dan Radunchev (), dan@govorenefekt.bg
#       COMPANY:  Govoren efekt EOOD
#       VERSION:  1.0
#       CREATED:  2021-04-14 07:27:34 EEST
#      REVISION:  ---
#===============================================================================


echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project.
hugo --minify  --cleanDestinationDir # if using a theme, replace by `hugo -t <yourtheme>`

# Go To Public folder
cd public
# Add changes to git.
git add -A

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
    then msg="$1"
    fi
    git commit -m "$msg"

# Push source and build repos.
git push origin main

# Come Back
cd ..
