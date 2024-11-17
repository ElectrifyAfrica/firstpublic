#Step 1
#Create new user
#!/bin/bash
sudo useradd eksadmin
sudo echo "eksadmin  ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/eksadmin

sudo mkdir -p /home/eksadmin
sudo chown eksadmin:eksadmin /home/eksadmin
sudo chmod 700 /home/eksadmin

sudo usermod -s /bin/bash eksadmin
sudo su - eksadmin

#Step2
#Install aws sli and terraform 

#!/bin/bash
sudo apt update -y
sudo apt-get update -y
sudo apt install apt-transport-https curl -y
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo apt install unzip tree nano vim  -y
unzip awscliv2.zip
sudo ./aws/install
sleep 3
rm -r awscliv2.zip

# Terraform install
sleep 10
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform -y




