project_id = "newone-445014"

vpc_name = "Task-subnets-vpc"

subnets = [ 
    {
        name = "Task-central-subnet"
        ip_cidr_range = "10.1.0.0/16"
        subnet_region = "us-central1"
    },
    {
        name = "Task-east-subnet"
        ip_cidr_range = "10.2.0.0/16"
        subnet_region = "us-east1"
    }
]

source_ranges = [ "0.0.0.0/0" ]

ports = [ 80 ]

node_count = 1