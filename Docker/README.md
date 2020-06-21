# Prokeep Code Excercise

For the purpose of this exercise, I created a bitnami container running an apache web server on Debian 10.

## Installing

1. Run the dockerbuild.bat (dockerbuild.sh for mac and linux) to build the docker image.

2. Once the container is built use ``docker-compose`` to specify the ports and volumes (Make sure you are in the proper working directory):

```docker-compose up -d```

3. From your browser, navigate to ```http:localhost://8080``` or ```https://localhost:8443``` and you will the see the default page for the apache web server.

## SSL Certificate

Using OpenSSL genreate a self signed certificate and key. Once the cert and key are created, mount the directory with the certificates:

```docker run --name apache\```
```-v /path_to_cert:/certs \```
```bitnami/apache:latest```

## Redirect 80 to 443 and ensure only TLS 1.1 is supported

To redirect all unencrypted traffic on port 80 to 443, modify the vhost file to reflect the following:

```
NameVirtualHost *:80
<VirtualHost *:80>
   ServerName pkcodeexercise.com
   Redirect permanent / https://pkcodeexercise.com/
</VirtualHost>

<VirtualHost _default_:443>
  ServerName pkcodeexercise.com
  DocumentRoot /opt/bitnami/apache2/htdocs
  SSLEngine On
  SSLProtocol TLSv1.1
</VirtualHost>
```
Note: This may require the apache service to be restarted.

## Accessing the Server 

To find the image, run the following command:

```docker ps```

find the container id of the image you created then run:

```docker exec -it cb98dc12fa57 bash```

This will open the the server in bash.

## Test Connectivity on 80 and 443 and attempt to make an HTTPS connection on port 80 (script can be found in this repo)

This script uses the curl command to test connectivity and echos a response of true or false based on the outcome. To test the connection on port 80 and 443 run:

```test.sh```

## Thank you for providing me with this opportunity, ProKeep!