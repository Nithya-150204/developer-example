  
    2  yum install update
    3  yum update -y
    4  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    5   unzip awscliv2.zip
    6  sudo ./aws/install
    7  aws configure
    2  yum install update
    3  yum update -y
    4  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    5   unzip awscliv2.zip
    6  sudo ./aws/install
    7  aws configure
    8  curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
    9   sudo mv /tmp/eksctl /usr/local/bin
   10  eksctl version
   11  curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
   12  sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
   13  kubectl version --client
   14  ssh-keygen
   15   eksctl create cluster --name cluster --region us-east-1 --version 1.32 --node-type t2.small --nodes 3 --nodes-min 2 --nodes-max 4 --ssh-access --ssh-public-key /root/.ssh/id_rsa.pub
   16  kubectl get nodes
   22  kubectl get pod
   23  vim nginx.yaml
   24  kubectl get nodes
   25  kubectl apply -f nginx.yaml
   26  kubectl get pod
   27  kubectl get svc
   28  vim service.yaml
   29  kubectl apply -f service.yaml
   30  kubectl get pod
   31  kubectl get svc

vim nginx.yaml
------------------------
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  labels:
    app: nginx
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:latest
        ports:
        - containerPort: 80
-----------------------

 vim service.yaml

-------------------------
apiVersion: v1
kind: Service
metadata:
  name: nginx-service
spec:
  selector:
    app: nginx
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
  type: LoadBalancer
-------------------------
    8  curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
    9   sudo mv /tmp/eksctl /usr/local/bin
   10  eksctl version
   11  curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
   12  sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
   13  kubectl version --client
   14  ssh-keygen
   15   eksctl create cluster --name cluster --region us-east-1 --version 1.32 --node-type t2.small --nodes 3 --nodes-min 2 --nodes-max 4 --ssh-access --ssh-public-key /root/.ssh/id_rsa.pub
   16  kubectl get nodes
   22  kubectl get pod
   23  vim nginx.yaml
   24  kubectl get nodes
   25  kubectl apply -f nginx.yaml
   26  kubectl get pod
   27  kubectl get svc
   28  vim service.yaml
   29  kubectl apply -f service.yaml
   30  kubectl get pod
   31  kubectl get svc

vim nginx.yaml
------------------------
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  labels:
    app: nginx
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:latest
        ports:
        - containerPort: 80
-----------------------

 vim service.yaml

-------------------------
apiVersion: v1
kind: Service
metadata:
  name: nginx-service
spec:
  selector:
    app: nginx
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
  type: LoadBalancer
-------------------------
