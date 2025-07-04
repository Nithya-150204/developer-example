[root@docker ~]# history
    1  yum install docker* -y
    2  systemctl start docker
    3  systemctl enable docker
    4  docker images ls
    5  docker pull nginx:stable-perl
    6  yum install nginx* -y
    7  systemctl start nginx.service
    8  systemctl enable nginx.service
    9  docker images
   10  docker run -itd --name webapp -p 8080:8080 nginx /bin/bash
   11  docker ps -a
   12  docker attach e567bfe69413
   13  curl http://localhost
   14  history
 
[root@docker ~]# docker attach webapp
root@e567bfe69413:/# history
    1  apt update -y
    2  apt install nginx
    3  service nginx start
    4  service nginx status
    5  history
-------------------------
ansible

1  hostname
    2  ip a s
    3  passwd root
    4  vim /etc/hosts
    5  vim /etc/ssh/sshd_config
    6  systemctl restart sshd
    7  systemctl enable sshd
    8  yum install ansible*
    9  ansible --version
   10   mkdir -p /etc/ansible
   11  ll -d /etc/ansible
   12  cd /etc/ansible
   13  vim ansible.cfg
   14  ansible --version
   15  cd
   16  ping one.example.com
   17  ssh-keygen
   18  cd .ssh/
   19  ll
   20  cat id_rsa.pub
   21  cd
   22  ssh-copy-id root@one.example.com
   23  ssh root@one.example.com
   24  cd /etc/ansible
   25  vim hosts
   26  ansible all -m ping
   27  nsible all -m ping -a data=nithya
   28  ansible all -m ping -a data=nithya
   29  ansible all -m user -a 'name=nithya uid=1200 home=/ltimindtree state=present'
go to one create and come:
   30  cd /mnt/
   31  ansible one.example.com -m fetch -a 'src=/tmp/nithya.txt dest=/mnt'
   32  ll
   33  cd one.example.com
   34  ll
   35  cd tmp
   36  ll
   37  cat nithya.txt
   38  cd
   39  cd /etc/ansible/
   40  mkdir project-x/
   41  cd project-x/
   42  vim simple-playbook.yaml
   43  ansible-playbook simple-playbook.yaml --syntax-check
   44  ansible-playbook simple-playbook.yaml -C
   45  yum install httpd -y
   46  systemctl restart httpd
   47  systemctl enable httpd
   48  vim simple-playbook.yaml
   49  ansible-playbook simple-playbook.yaml --syntax-check
   50  ansible-playbook simple-playbook.yaml -C
   51  echo "this is sample" > index.html
   52  ll
   53  vim simple-playbook.yaml
   54  ansible-playbook simple-playbook.yaml --syntax-check
   55  ansible-playbook simple-playbook.yaml -C
   56  ansible-playbook simple-playbook.yaml
   57  ll
   58  yum install httpd -y
   59  systemctl restart httpd
   60  systemctl enable httpd

simple-playbook

---
- name: This is a sample book
  hosts: all
  become: yes  # Ensures tasks run with elevated privileges
  tasks:

    - name: Creating user 'dilwale'
      user:
        name: dilwale
        uid: 1300
        home: /heros
        shell: /bin/bash
        state: present

    - name: Install Apache (httpd)
      yum:
        name: httpd
        state: present

    - name: Copy index.html to Apache web directory
      copy:
        src: index.html
        dest: /var/www/html/index.html

    - name: Install CIFS utilities
      yum:
        name: cifs-utils
        state: present

    - name: Install vsftpd using DNF
      dnf:
        name: vsftpd
        state: latest
-----------------------
hostname-one
    3  ip a s
    4  passwd root
    5  vim /etc/hosts
    6  vim /etc/ssh/sshd_config
    7  systemctl restart sshd
    8  systemctl enable sshd
    9  cd .ssh/
   10  ll
   11  vim authorized_keys
   12  cd
   13  systemctl restart sshd
   14  systemctl enable sshd
   15  cd /tmp
   16  vim nithya.txt
   17  cat nithya.txt
   18  cd
   19  cd /var/www/html/
   20  ll
   21  cat index.html
   22  cd
   23  yum install httpd -y
   24  systemctl restart httpd
   25  systemctl enable httpd

   pate one ip address
-----------------------

terraform vpc
----------------------------
 1  sudo dnf install -y dnf-plugins-core
    2  sudo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
    3  sudo dnf -y install terraform
    4  terraform -v
    5  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    6  unzip awscliv2.zip
    7  sudo ./aws/install
    8  aws configure
    9  cd .aws/
   10  ll
   11  cat config
   12  cat credentials
   13  cd
   14  mkdir terra
   15  cd terra/
   16  ll
   17  vim ec2-vpc.tf
   18  cd
   19  ssh-keygen
   20  cd .ssh/
   21  ll
   22  cat id_rsa.pub
   23  cd
   24  cd terra/
   25  vim ec2-vpc.tf
   26  terraform init
   27  terraform fmt
   28  terraform validate
   29  terraform plan
   30  terraform apply
---------------------------------------------
provider "aws" {
  region = "us-east-1"

}

#This is VPC code

resource "aws_vpc" "test-vpc" {
  cidr_block = "10.0.0.0/16"
}

# this is Subnet code
resource "aws_subnet" "public-subnet" {
  vpc_id            = aws_vpc.test-vpc.id
  availability_zone = "us-east-1b"
  cidr_block        = "10.0.0.0/24"

  tags = {
    Name = "Public-subnet"
  }
}


resource "aws_subnet" "private-subnet" {
  vpc_id            = aws_vpc.test-vpc.id
  availability_zone = "us-east-1b"
  cidr_block        = "10.0.1.0/24"

  tags = {
    Name = "Private-subnet" #security group
  }
}

resource "aws_security_group" "test_access" {
  name        = "test_access"
  vpc_id      = aws_vpc.test-vpc.id
  description = "allow ssh and http"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


}

#security group end here#internet gateway code
resource "aws_internet_gateway" "test-igw" {
  vpc_id = aws_vpc.test-vpc.id

  tags = {
    Name = "test-igw"
  }
}


#Public route table code

resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.test-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.test-igw.id
  }


  tags = {
    Name = "public-rt"

  }
}
#route Tatable assosication code
resource "aws_route_table_association" "public-asso" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.public-rt.id
}

#ec2 code
resource "aws_instance" "sanjay-server" {
  ami             = "ami-05ffe3c48a9991133"
  subnet_id       = aws_subnet.public-subnet.id
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.test_access.id}"]
  key_name        = "nithya-key"
  tags = {
    Name     = "test-World"
    Stage    = "testing"
    Location = "chennai"
  }

}


##create an EIP for EC2
resource "aws_eip" "sanjay-ec2-eip" {
  instance = aws_instance.sanjay-server.id
}

#ssh keypair code
resource "aws_key_pair" "ltimindtree" {
  key_name   = "nithya-new-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCvlb/dvHqB2JMM5s43uWgYsRlUz6eiEz6dX6JvLEZhrN1QbjSyfdsk8bagpohjxLhc2Y0nCD6RjsH5IuuMOEJ05h/KvKI539wEohH7irY7nefho3aVUUPmVlXeytSslIzpOX9CjM/Q4jQbxLMG7AgEEDRZwPyT3fQ3Z0iegKdkwO2R0S5hsyiGFL3gJmMfSn5Oumi20xtiik6L2pHjjN4xk8ozRYMJFVdBAq5a8OiKztqpCDKRMBOAPv46blzLFe5UES4TLIFEaMWXcLhVbdkkqpIO4l6DNq/0FkjR0tYJxghcy/M8TgZ0qqvQhtOQJxmsDL+DCWWZvjuEWJ6Fp8Sbqblo0iBE7DDW0icL+T++qQmjPAs5ODHMUeB67CUEdtFSUVFmhSaI19KpAVpzprbgxXYuFE+hS2bzFThpQriKBDJ6EytQXvRLy7zFigdC78VjQrUJap/JrKpGs1Xdrzqbebcv0N5cCgwivPLlnNimBHEx6AGWKwGucDKGPSVN5L8= root@terraform.example.com"
}

###this is database ec2 code
resource "aws_instance" "database-server" {
  ami             = "ami-05ffe3c48a9991133"
  subnet_id       = aws_subnet.private-subnet.id
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.test_access.id}"]
  key_name        = "nithya-new-key"
  tags = {
    Name     = "db-World"
    Stage    = "stage-base"
    Location = "delhi"
  }

}

##create a public ip for Nat gateway
resource "aws_eip" "nat-eip" {
}
### create Nat gateway
resource "aws_nat_gateway" "my-ngw" {
  allocation_id = aws_eip.nat-eip.id
  subnet_id     = aws_subnet.public-subnet.id
}

#create private route table
resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.test-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.my-ngw.id
  }


  tags = {
    Name = "private-rt"
  }
}
##route Tatable assosication code
resource "aws_route_table_association" "private-asso" {
  subnet_id      = aws_subnet.private-subnet.id
  route_table_id = aws_route_table.private-rt.id
}

--------------------------------------------
browser display

mkdir user-data
   36  cd user-data
   37  vim user-data
   38  terraform init
   39  terrafrom init
   40  vim user-data
   41  vim user-data.tf
   42  terraform init
   43  terraform fmt
   44  terraform validate
   45  terraform plan
   46  terraform apply
----------------------------------------------
resource "aws_security_group" "web_access23" {
  name        = "web_access23"
  description = "Allow traffic"
 
  tags = {
    Name = "web_access23"
  }
}
 
resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.web_access23.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}
 
resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.web_access23.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}
 
resource "aws_vpc_security_group_ingress_rule" "allow_https" {
  security_group_id = aws_security_group.web_access23.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}
resource "aws_vpc_security_group_egress_rule" "allow_all_taraffic" {
  security_group_id = aws_security_group.web_access23.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}
 
#ec2 instance code starts here
resource "aws_instance" "custom-server" {
  ami               = "ami-05ffe3c48a9991133"
  availability_zone = "us-east-1a"
  instance_type     = "t2.micro"
  security_groups   = ["${aws_security_group.web_access23.name}"]
  key_name          = "Milestone-key"
 
 
  user_data = <<-EOF
        #!/bin/bash
        sudo yum install httpd -y
        sudo systemctl start httpd
        sudo systemctl enable httpd
        echo "<h1>custom  webserver using terraform</h1>" | sudo tee /var/www/html/index.html
  EOF
  tags = {
    Name     = "hello-India"
    Stage    = "testing"
    Location = "India"
  }
}
--------------------------------------------------------
put hello world ip

----------------------

