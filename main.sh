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
 
   # ---> Target 1 <---
   # Mission 1

   # Mission 2  

   # Mission 3   
  
   # Mission 4

   # Mission 5

   # Mission 6

   # Mission 7

   # Mission 8

   # ---> Target 2 <---
   # Mission 1

   # Mission 2

   # Mission 3
}

main
