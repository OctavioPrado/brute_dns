## brute_dns

### About

This Script its made too find subdomains based in four wordlists, he uses dig tool to verify if the subdmain exist

### Use Mode

./brute_dns [URL] [Options]

./brute_dns -h to see the options

-s  To use the small wordlist

-m  To use medium wordlist

-b  To use the bigger wordlist (10000 words)

-t  To use Top 500 subdomains by popularity (default)
 
-a  To select your wordlist (If your wordlist is not in the same directory as the script, you will need to write the path to the list)
 
-h  To see this menu




##### The wordlists used in this project were taken from the https://github.com/rbsec/dnscan repository and are under the GPLv3 license
