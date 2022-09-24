# Linux Adventures - Challenge 3

Provisioner script:

``sh
#!/bin/bash

set -e 

main()
{
   apt update && apt install -y git;
   cd /root
      git clone https://github.com/jdv-c2/linux-challenge-3.git;
   cd linux-challenge-3;
   chmod +x main.sh;
   bash main.sh;
}

main
```   

