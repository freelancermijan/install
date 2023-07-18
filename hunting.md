Dir Creation

    sudo mkdir -p bug_target/subdomains/httpx/web_screenshot && sudo mkdir -p bug_target/directories && sudo mkdir -p bug_target/nmapper

Subfinder

    sudo subfinder -d hackerone.com -silent -o bug_target/subdomains/subfinder.txt


Amass

    amass enum -passive -d hackerone.com | sudo tee bug_target/subdomains/amass.txt


Shorted duplicate domains

    cat bug_target/subdomains/*.txt | sort -u | sudo tee bug_target/subdomains/shorted_duplicate_domains.txt

httpx

    cat bug_target/subdomains/shorted_duplicate_domains.txt | httpx -sc -td | sudo tee bug_target/subdomains/httpx/httpx_all.txt && cat bug_target/subdomains/shorted_duplicate_domains.txt | httpx -mc 200 | sudo tee bug_target/subdomains/httpx/httpx_200.txt && cat bug_target/subdomains/shorted_duplicate_domains.txt | httpx -mc 404 | sudo tee bug_target/subdomains/httpx/httpx_404.txt && cat bug_target/subdomains/shorted_duplicate_domains.txt | httpx -mc 302 | sudo tee bug_target/subdomains/httpx/httpx_302.txt && cat bug_target/subdomains/shorted_duplicate_domains.txt | httpx -mc 403 | sudo tee bug_target/subdomains/httpx/httpx_403.txt && cat bug_target/subdomains/shorted_duplicate_domains.txt | httpx -sc -fc 200,403,404,302 | sudo tee bug_target/subdomains/httpx/httpx_without_200_403_404_302.txt


https://search.censys.io/

ffuf

    ffuf -u https://docs.hackerone.com/FUZZ -w /usr/share/wordlists/SecLists/Discovery/Web-Content/directory-list-lowercase-2.3-medium.txt -fr '/\..*' -mc 200 -c -t 50 -fs 0 -e .html,.php,.txt,.zip,.jsp,.aspx,.js | sudo tee bug_target/directories/ffuf.txt

Dirsearch

    sudo dirsearch --full-url --extensions=php,html,js,jsp,zip,json --exclude-extensions=xml,ico --include-status=200,302 --exclude-status=400,403,301 -r 3 --format plain -o /tmp/dirsearchScan.txt -w /usr/share/wordlists/SecLists/Discovery/Web-Content/common.txt -u http://testphp.vulnweb.com

```
nmap ip -A
nmap ip -T4 -p-
naabu

```