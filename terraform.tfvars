
aws_region = "eu-central-1"

#vpc
vpc_name = "my_vpc"
vpc_cidr_block = "10.0.0.0/16"

#public subnet
public_sub_name = "my_public_subnet"
pub_sub_cidr    = "10.0.1.0/24"

#private subnet
private_sub_name = "my_private_subnet"
pvt_sub_cidr    = "10.0.2.0/24"

#Internet Gateway
IG_name  = "my_igw"

#EIP
nat_Eastic_Ip = "my-nat-eip"

#NAT Gateway
nat_name = "my_nat"

#Public route table
pub_rt_name= "my_public_rt"
pub_rt_cidr="0.0.0.0/0"

#Private route table
pvt_rt_name= "my_private_rt"
pvt_rt_cidr="0.0.0.0/0"

#Security Groups
Sg_name = "my-ssh-http"

#Public instance
ami_id = "ami-017095afb82994ac7"
pub_ins_name = "my_public_instance"
ins_type = "t2.micro"

#Private instance
pvt_ins_name = "my_private_instance"

#key-pair
key_name_ssh = "neeha2"

#s3
#my_bucket = "tfstate-mybucket-12-123"
#bucket_key = "state/terraform.tfstate"
#db_table_name = "tfstate-dynamodb-table"



