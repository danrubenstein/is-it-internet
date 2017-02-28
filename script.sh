#!/bin/bash

# isit{x}.com?
# License found in license.md
# Word list courtesy of https://github.com/dwyl/english-words

sleepInterval=0.01; 
wordsFile=words.txt;
outputFile=output.csv;
wordsURL=https://raw.githubusercontent.com/dwyl/english-words/master/words.txt

# Getting the words list 
curl -s -o $wordsFile $wordsURL; 
if [[ ! $? -eq 0 ]]
	then 
		echo "Couldn't get the words file"; 
		exit -1; 
fi 

# Checking to see if the output file exists 
if [ -e "$outputFile" ]
	then 
		echo "Overwriting the output file $outputFile"; 
		rm $outputFile; 

fi
touch $outputFile; 

# Make the headers 
echo "Word, Successful Ping" >> $outputFile; 

# Check every word
while read -r var;
	do 
		ping -o -q -t 2 isit$var.com > /dev/null 2>&1; 
		if [[ ! $? -eq 0 || $? -eq 2 ]]
			then 
				echo "$var, 0" >> $outputFile; 
			else 
				echo "$var, 1" >> $outputFile; 

		fi 
		sleep $sleepInterval; 
done < $wordsFile

# Cleanup 
if [[ -e $wordsFile ]]
	then 
		rm $wordsFile
fi