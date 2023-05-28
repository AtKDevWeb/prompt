#!/bin/sh
echo "Vous vous apprêtez à modifier votre prompte, désirez-vous continuer ? [O/N]"
read continue
if [$continue-eq"O"]
	then echo "Désirez vous ajouter la date à votre prompt? [O/N]"
		read date
		if [$date-eq"O"]
			then $date="\t-" 
			else $date=""
		fi	
	
		echo "Désirez vous changer la couleur de votre prompt? de Manière Unie [U] ou de façon entièrement personnalisée [P]?"
		read change_Color

		if [$change_Color-eq"U"]
			then echo -e "Quelle couleur désirez vous pour votre prompt?\n# Black[0]\n# Red[1]\n# Green[2]\n# Yellow[3]\n# Blue[4]\n# White[5]"  
				read prompt_Color

				echo -e "Souhaitez vous un prompt en Gras?\n #Oui [1]\n #Non [0]"
				read bold

				declare -a table_Color=("\033[$bold;30m" "\033[$bold;31m" "\033[$bold;32m#" "\033[$bold;33mz" "\033[$bold;34m" "\033[$bold;35m" "\033[$bold;36m" "\033[$bold;37m")
				echo "export PS1="'${debian_chroot:+($debian_chroot)}\[\"'${table_Color[$prompt_Color]}'"]\"'$date'"\u@\h\:\[\033[01;34m\]\w\[\033[00m\]\$""' > ~/.custumPS1.sh

				source ~/.bashrc
				

			else if [$changeColor-eq"P"]

				then read -p "Veuillez saisir les couleurs suivantes:\n# Black[0]\n# Red[1]\n# Green[2]\n# Yellow[3]\n# Blue[4]\n# White[5]\n\nPour la date si vous l'avez activé, votre pseudo, votre alias (@), votre nom de machine, votre indiateur de localisation (~) & votre indicateur de session bash ($/#)" color_date name alias mac_Name tild indic_Session 
				
				echo -e "Souhaitez vous un prompt en Gras?\n #Oui [1]\n #Non [0]"
				read bold

				declare -a table_Color=("\033[$bold;30m" "\033[$bold;31m" "\033[$bold;32m#" "\033[$bold;33mz" "\033[$bold;34m" "\033[$bold;35m" "\033[$bold;36m" "\033[$bold;37m")					
				
				echo "export PS1="'${debian_chroot:+($debian_chroot)}\[\"'${table_Color[$color_date]}'\"]\"'$date'"\[\"'${table_Color[$name]}'\"]\u\[\"'${table_Color[$alias]}'\"]@\[\"'${table_Color[$mac_Name]}'\"]\h\:\[\"'${table_Color[$tild]}'\"]\w\[\"'${table_Color[$indic_Session]}'\"]\$""' > ~/.custumPS1.sh

				source ~/.bashrc
				
			fi
 
	else source ~/.bashrc
		exit
fi




