# collections-cleaners

This is a collection of scripts in use by the collections team to clean up the
collections at the Internet Archive. They require administration privileges and 
the use of the InternetArchive Python interface script. 

These scripts are being published on github to allow commentary and learning materials
for the internal maintenance of the Archive's stores of materials.

* *frontpage.sh* is a script that goes through all the items in a collection (with a texts mediatype) and ensures the first page of every item's document is the thumbnail, and that the online reader starts on the cover.
* *semi.sh* is run against an item and if the "Subject" field is a set of subjects separated by semicolons instead of a set of different Subject settings with each entry, it will split them up and add them in properly. 
