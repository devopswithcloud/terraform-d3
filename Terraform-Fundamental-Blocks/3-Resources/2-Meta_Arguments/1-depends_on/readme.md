* Create few resources in AWS Cloud through console, then convert the code into terraform
  * Create a VPC
  * Create a subnet
  * Create a IGW(internet gateway)
  * Create a Route Table
  * Create a explict route to internet from the RT created previously.
  * Create a security group for port 22, 80, 8080
  * Create a Elastic IP (Static IP)
  * Create a EC2 machine and assign that machine to the vpc created above, with sg created above.
  * Assign the elastic_ip created above to the newly EC2 machine
