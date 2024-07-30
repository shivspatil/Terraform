resource "aws_instance" "lab1" {
    count = length(data.aws_availability_zones.available_zones.names)
    ami = "ami-03238ca76a3266a07"
    instance_type = "t3.micro"
    availability_zone = data.aws_availability_zones.available_zones.names[count.index]
    
    tags = {
      Name = "Lab-${count.index}"
    }
    }
output "available_zones" {
    value = data.aws_availability_zones.available_zones.names
  }
output "names" {
    value = aws_instance.labs.*.tags.Name
  
}