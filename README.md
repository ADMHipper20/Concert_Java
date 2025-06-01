# **WELCOME! TO THE CONCERT OOP WITH PROJECT TEAM**

Before you start, make sure you do these things first:
- Install JDK 17 or Above Version.
      (https://www.oracle.com/java/technologies/javase/jdk17-archive-downloads.html)
- Download Latest Apache Maven, cuz nothing wrong with newer version just better with stable version
      (https://maven.apache.org/install.html) follow the installation
- Install Apache Tomcat 10.X, well newer seems not to be working with some dependencies stuck on 10.X version
      (https://tomcat.apache.org/download-10.cgi)

After all those things cleared, make sure you add 'em bins to the Enviroment Path
so it'll registered to your system when checking version from the CMD/Terminal.

And some extensions for Java Project, I would take a pack one even though I'm not using gradle cuz just a mid-programmer I am

## **How to start:**
1. mvn clean install (every dependencies that being added to pom.xml needs to do this everytime, clean means that deleting recent build and make new one)
2. mvn clean package cargo:run (package to make .war extension for running the webApp 'cause we're using JSP, and cargo it's a dependency I don't know but its for running the localhost)
3. also for DB MYSQL, please turn it on first before doing step 2 and make sure have same name for Database, otherwise it won't work
4. have you install ngrok? well if not, then you can just proceed until step 3. 'Cause you need to download it too and turn the ngrok with the below step at the end
5. API keys I got is from Xendit, so I might be remove that for some reason.

**Simulate Virtual Account (VA) Payment with CURL:**

- curl -X POST
        https://api.xendit.co/v2/virtual_account_numbers/VIRTUAL_ACCOUNT_ID/payments
      -H 'Content-Type: application/json'
      -u 'xnd_development_YOUR_SECRET_KEY:'
      -d '{amount:[insert the exact amount]}'

_Notes: 
- replace your simulated VA on 'virtual_account_numbers' and Xendit API Key, actually I could just paste it here
- fill the brackets with the amount/total price, or maybe don't include it, I think it's automated filling the price_

**Simulate QR-Codes (QR) Payment with CURL:**

- curl -X POST
        https://api.xendit.co/v2/qr_codes/[external_id or ID that represent the order]/payments/simulate
      -u 'xnd_development_YOUR_SECRET_KEY:'

_Notes:
- replace the Secret key, with your API key.
- The amount will just automated filled, then you should be able to recieve callbacks with 200 Succesful Response_

**Ngrok:**
- Deploy the static domain "ngrok http --url=precisely-included-killdeer.ngrok-free.app 80", so it won't make you change the randomsubdomain every times
- https://precisely-included-killdeer.ngrok-free.app/**~folder_project~/payment-callback** (change with your own path for Callback)
- put the URL before the path for your Callback URL
