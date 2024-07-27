#!/bin/bash

ascii_art='
___________.__    .__ __                            .___
\__    ___/|  |__ |__|  | __ ____ ___________     __| _/
  |    |   |  |  \|  |  |/ //    \\____ \__  \   / __ | 
  |    |   |   Y  \  |    <|   |  \  |_> > __ \_/ /_/ | 
  |____|   |___|  /__|__|_ \___|  /   __(____  /\____ | 
                \/        \/    \/|__|       \/      \/ 
               __                                       
  ______ _____/  |_ __ ________                         
 /  ___// __ \   __\  |  \____ \                        
 \___ \\  ___/|  | |  |  /  |_> >                       
/____  >\___  >__| |____/|   __/                        
     \/     \/           |__|                           

'

echo "$ascii_art"
echo "=> Thinkpad Setup is helpfull script to install most used apps on the Thinkpad"
echo -e "\n"

confirm() {
    # call with a prompt string or use a default
    read -r -p "${1:-Continue to setup? [y/N]} " response
    case "$response" in
        [yY][eE][sS]|[yY]) 
            true
            ;;
        *)
            false
            exit
    esac
}



confirm &&  source menu.sh