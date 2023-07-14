============================
Files Searching
============================

Normal scan

    ffuf -u http://testphp.vulnweb.com/FUZZ -w /usr/share/wordlists/SecLists/Discovery/Web-Content/raft-medium-files-lowercase.txt -v -c -fs 0 -fc 404 -mc all -e .php,.txt -recursion | tee ffuf_scan_result.txt

Normal scan with regular expresion

    ffuf -u http://testphp.vulnweb.com/FUZZ -w /usr/share/wordlists/SecLists/Discovery/Web-Content/raft-medium-files-lowercase.txt -v -c -recursion -fs 0 -fr '/\..*' | tee ffuf_scan_result.txt



============================
Extensions Searching
============================


    ffuf -u http://testphp.vulnweb.com/indexFUZZ -w /usr/share/wordlists/SecLists/Discovery/Web-Content/web-extensions.txt -v -c | tee ffuf_scan_result.txt




============================
Directories Searching
============================

    ffuf -u http://testphp.vulnweb.com/FUZZ -w /usr/share/wordlists/SecLists/Discovery/Web-Content/raft-medium-directories-lowercase.txt -v -c | tee ffuf_scan_result.txt




============================
Subdomains Searching
============================

    ffuf -u http://FUZZ.vulnweb.com -w /usr/share/wordlists/SecLists/Discovery/DNS/subdomains-top1million-5000.txt -c -v -mc 200 | tee subdomains_ffuf.txt

With Headers

    ffuf -u http://FUZZ.vulnweb.com -w /usr/share/wordlists/SecLists/Discovery/DNS/bitquark-subdomains-top100000.txt -c -v -H "Host: FUZZ.vulnweb.com" | tee subdomains_ffuf.txt


============================
Param Searching
============================

Finding parameter

    ffuf -u "http://10.10.196.176/sqli-labs/Less-1/?FUZZ=1" -c -w /usr/share/wordlists/SecLists/Discovery/Web-Content/burp-parameter-names.txt | tee ffuf_param_find.txt

    ffuf -u "http://10.10.196.176/sqli-labs/Less-1/?FUZZ=1" -c -w /usr/share/wordlists/SecLists/Discovery/Web-Content/burp-parameter-names.txt -fw 39 | tee ffuf_param_find.txt


Finding value of parameter

    for i in {0..255}; do echo $i; done | ffuf -u "http://10.10.196.176/sqli-labs/Less-1/?id=FUZZ" -c -w /usr/share/wordlists/SecLists/Discovery/Web-Content/burp-parameter-names.txt -fw 39 | tee ffuf_param_find.txt


    for i in {0..255}; do echo $i; done | ffuf -u "http://10.10.196.176/sqli-labs/Less-1/?id=FUZZ" -c -w /usr/share/wordlists/SecLists/Discovery/Web-Content/burp-parameter-names.txt -w - -fw 33 | tee ffuf_param_find.txt


    ffuf -u http://10.10.196.176/sqli-labs/Less-11/ -c -w /usr/share/seclists/Passwords/Leaked-Databases/hak5.txt -X POST -d 'uname=Dummy&passwd=FUZZ&submit=Submit' -fs 1435 -H 'Content-Type: application/x-www-form-urlencoded'
