#!/usr/bin/perl -w
#directory.pl,v 0.92 2011/05/03  Steffen Baier $
#
#
# Copyright (c) 2011 Polycom Inc.
#
#
#Additional lines can be added for increased variability when reading the data file. Data file values are read from left to right in the CSV file so place your values carefully!
#Variables as read from the data file. The data file name is defined below. You may change the name of this file if desired but just remember it is case sensitive.
#
#CSV File Setup
#column1	=	First Name
#column2	=	Last Name
#column3	=	Used by the phone to address a remote party in the same way that a string of digits or a SIP URL are dialed manually by the user.
#				This element is also used to associate incoming callers with a particular directory entry . For VVX 1500 phones, the maximum field length is
#				128 characters; for all other phones, the maximum is 128 characters.
#column4	=	speed-dial index Associates a particular entry with a speed dial bin for one-touch dialing or dialing from the speed dial menu.
#				not used in this example.

#ln		- Last Name
#fn		- First Name
#ct		- Extension
#sd		- Speed Dial Index - not used in this example

#use strict ;
#use warnings ;

#Name if the File that contains the User Direcotry Data
open (FILE, 'directory.csv') || die("Could not open the input file directory.csv!\n");
#create if not yet created and/or overwrite existing 000000000000-directory.xml
open (OUTPUTFILE, ">../000000000000-directory.xml") || die("Could not open/create the output file 000000000000-directory.xml!\n");

#below section contains the standard [general] header of the sip.conf

print OUTPUTFILE "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n";
print OUTPUTFILE  "<directory>\n";
print OUTPUTFILE "\t<item_list>\n";

while (<FILE>) {

chomp;
###################################################################
#we are splitting the comma seperated values into the single Items#
#add additional $columnX to accomodate further entries			  #
###################################################################

($column1,$column2,$column3) = split(',');

print OUTPUTFILE "\t\t<item>\n";
print OUTPUTFILE "\t\t\t<fn>$column1</fn>\n";
print OUTPUTFILE "\t\t\t<ln>$column2</ln>\n";
print OUTPUTFILE "\t\t\t<ct>$column3</ct>\n";
#print OUTPUTFILE "\t\t\t<sd>$column4</sd>\n";
print OUTPUTFILE "\t\t</item>\n";
}
print OUTPUTFILE "\t</item_list>\n";
print OUTPUTFILE "</directory>\n";

#close the csv example file
close (FILE);
#close the modified sip.conf file
close (OUTPUTFILE);
exit;
