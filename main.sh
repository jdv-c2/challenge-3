#!/bin/bash

# Provisioner script for third Linux adventures campaign
# Author: Johan de Vries 

set -e

main()
{  
   # Setup users
	tutor_pass="dHV0b3IK"
	useradd tutor -m -s /bin/bash 2>/dev/null 
	echo "tutor:$tutor_pass" | chpasswd
	useradd circus_c -m -s /bin/bash 2>/dev/null  

   # Making birthday folder
   mkdir -p /birthday 2>/dev/null

   # Application
   apt update && apt install -y gcc figlet 
 
   # Create directory in /usr/share/
   advpath="/usr/share/.linux-adventures/"    
   mkdir -p $advpath.links 2> /dev/null 

   # ---> Target 1 <---
   # Mission 1
   mkdir -p /home/tutor/soft-links/{in-here,not-in-here}/
   mv tutor/instruction-1 /home/tutor/soft-links/in-here/ReadMe 
   ln -s /home/tutor/soft-links/in-here/ReadMe /home/tutor/ReadMe 
   # chown -R tutor:tutor /home/tutor  

   # Mission 2  
   mkdir -p /home/tutor/hard-links
   mapfile -t badges < badge/badge-names
   
   for i in ${!badges[@]}; do
     sed "s/badge-name/${badges[$i]}/g" badge/badge-template > $advpath.links/file-$(( $i + 1 )) 
     j=$((RANDOM % 30))
     ln $advpath.links/file-$(( $i + 1 )) /home/tutor/hard-links/file-$(( $i + 1 )) 
     if [ $i != 13 ] ; then
        for ((k=0; k <= j; k++)); do
           ln $advpath.links/file-$(( $i + 1 )) $advpath.links/file-$(( $i + 1 ))-lnk-$k 
        done
     else 
        for ((k=0; k <= 32; k++)); do
           ln $advpath.links/file-14 $advpath.links/file-$(( $i + 1 ))-lnk-$k 
        done
     fi
   done 
   echo "   Next: navigate to the ~/files directory" >> $advpath.links/file-14

   # Mission 3   
   mkdir -p /home/tutor/files
   mv tutor/instruction-2 /home/tutor/files/ReadMe 
  
   # Mission 4
   mv tutor/exercise-1 /home/tutor/files/exercise-1.txt    
   sed "s/badge-name/gzipper-boss/g" badge/badge-template > /home/tutor/files/badge-2 
   echo "  Next exercise: ~/files/exercise-2.txt" >> /home/tutor/files/badge-2
   gzip /home/tutor/files/badge-2
   mv /home/tutor/files/badge-2.gz /home/tutor/files/badge-2

   # Mission 5
   mv tutor/exercise-2 /home/tutor/files/exercise-2.txt    
   sed "s/badge-name/bzipper2-boss/g" badge/badge-template > /home/tutor/files/badge-3 
   echo "  Next exercise: ~/files/exercise-3.txt" >> /home/tutor/files/badge-3
   bzip2 /home/tutor/files/badge-3
   mv /home/tutor/files/badge-3.bz2 /home/tutor/files/badge-3

   # Mission 6
   mv tutor/exercise-3 /home/tutor/files/exercise-3.txt    
   mv badge/badge-4 /home/tutor/files/badge-4

   # Mission 7
   mv tutor/exercise-4 /home/tutor/files/exercise-4.txt    

   # Mission 8
   mv tutor/exercise-5 /home/tutor/files/exercise-5.txt    
   
   # Archive everyting for mission 3 
   cd /home/tutor/files
   tar -cf open-me badge-* exercise-* && rm badge-* exercise-*
   cd ~
   
   # Change ownership of objects to tutor
   chown -R tutor:tutor /$advpath.links /home/tutor

   # ---> Target 2 <---
   # Mission 1
   mkdir -p /birthday/floor-{1..8}/{01..24} 

   for i in {1..8}; do 
      mkdir /birthday/floor-${i}/room-${i}{01..24}; 
      for j in {01..24}; do 
         echo "Any time of year, you can find it here" > /birthday/floor-${i}/room-${i}0${j}/you-can-check-out-anytime-you-like
         echo "Mirrors on the ceiling..." > /birthday/floor-${i}/room-${i}${j}/you-can-never-leave
      done 
   done 

   mapfile -t links < hotel/links

   mkdir -p /birthday/{grand-ballroom,.basement}

   # Mission 2
   mv hotel/solve-the-riddle.ppsx /birthday/floor-4/room-414  

   # Mission 3
}

main
