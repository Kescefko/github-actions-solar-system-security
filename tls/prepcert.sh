openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout tls.key -out tls.crt -subj "/CN=solar-system-production.westeurope.cloudapp.azure.com/O=MyOrg" -addext "subjectAltName = DNS:solar-system-production.westeurope.cloudapp.azure.com"

kubectl create secret tls solar-system-ingress-tls-secret --namespace=production --cert=tls.crt --key=tls.key