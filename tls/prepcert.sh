#!/bin/bash

# Set your variables
DOMAIN="prod-gke-poc.local"
NAMESPACE="production"
CERT_NAME="solar-system-ingress-tls-secret"
ORG="MyOrg"

# Generate the self-signed certificate
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout tls.key -out tls.crt \
  -subj "/CN=$DOMAIN/O=$ORG" \
  -addext "subjectAltName = DNS:$DOMAIN"

# Create the Kubernetes Secret
kubectl create secret tls "$CERT_NAME" \
  --namespace="$NAMESPACE" \
  --cert=tls.crt \
  --key=tls.key

echo "Certificate and Secret created successfully!"
echo "Domain: $DOMAIN"
echo "Namespace: $NAMESPACE"
echo "Secret Name: $CERT_NAME"