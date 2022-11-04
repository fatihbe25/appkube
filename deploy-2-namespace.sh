#!/bin/bash

kubectl apply -f - <<EOF
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-app-deployment
  namespace: $1
spec:
  selector:
    matchLabels:
      app: nginx-app-deployment
  template:
    metadata:
      labels:
        app: nginx-app-deployment
    spec:
      containers:
      - name: nginx-app-deployment
        image: fatihbe25/project_todo_web
        ports:
        - containerPort: 80
---
apiVersion: v1
kind: Service
metadata:
  name: nginx-app-service
  namespace: $1
spec:
  selector:
    app: nginx-app-deployment
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: nging-app-ingress
  namespace: $1
spec:
  rules:
    - host: $1-dart.fria.io
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: ngingx-app-service
                port:
                  number: 80
EOF
