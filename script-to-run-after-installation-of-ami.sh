#Step 1

sudo hostnamectl set-hostname master

sudo -i

#step 2
#now run this script as a root user

#!/bin/bash
sudo apt update && sudo apt upgrade -y

sudo usermod -aG docker ubuntu

sudo apt-mark hold kubelet kubeadm kubectl

sudo kubeadm init

sudo su - ubuntu 

#Step 3
#Now run as a regular user
#!/bin/bash
mkdir -p $HOME/.kube

sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config

sudo chown $(id -u):$(id -g) $HOME/.kube/config

kubectl apply -f https://github.com/weaveworks/weave/releases/download/v2.8.1/weave-daemonset-k8s.yaml

sleep 30

kubectl get nodes

kubectl get pods -A
