- встановив terraform
- створив IAM користувача для terraform
- створив access key

## Створити VPC з двома серверами у публічній та приватній підмережі за допомогою Terraform, застосовуючи модулі
`terraform init`
-> Terraform has been successfully initialized!

- Створюємо модуль vpc за замовчуванням [https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc]
- cidr, name виносимо в змінні
- Створюємо дві підмережі, публічну та приватну [https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet]
- vpc_id, public_cidr, private_cidr, az, name виносимо в змінні
- Створюємо EC2 [https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance]
- ami, instance_type, subnet_id, associate_public_ip, name - виносимо в змінні
- Створюємо VPC з 10.0.0.0/16
- Створюємо підмережі використовуючи output module.vpc.vpc_id
- Створюємо два інстанси EC2 використовуючи output module.subnets.public_subnet_id, module.subnets.private_subnet_id, ami-09e6f87a47903347c та зона us-east-1a
`terraform plan` -> вивід terraform_output.txt
`terraform apply`
module.subnets.aws_subnet.private: Creating...
module.subnets.aws_subnet.public: Creating...
module.subnets.aws_subnet.private: Creation complete after 1s [id=subnet-07c50dacc32472449]
module.ec2_private.aws_instance.this: Creating...
module.subnets.aws_subnet.public: Still creating... [00m10s elapsed]
module.ec2_private.aws_instance.this: Still creating... [00m10s elapsed]
module.subnets.aws_subnet.public: Creation complete after 12s [id=subnet-0d31163f0b5b18ce8]
module.ec2_public.aws_instance.this: Creating...
module.ec2_private.aws_instance.this: Still creating... [00m20s elapsed]
module.ec2_public.aws_instance.this: Still creating... [00m10s elapsed]
module.ec2_private.aws_instance.this: Still creating... [00m30s elapsed]
module.ec2_public.aws_instance.this: Still creating... [00m20s elapsed]
module.ec2_private.aws_instance.this: Creation complete after 33s [id=i-048f0d2d13a814c8e]
module.ec2_public.aws_instance.this: Creation complete after 23s [id=i-057524baf50d994d1]

- Створив вручну EC2 інстанс `hw-ec2`, id=i-0a5bdf5b98826e22d, subnet - subnet-0d31163f0b5b18ce8
- Додаю в main опис та import
- `terraform apply` -> ресурс додався
- `terraform destroy` -> Destroy complete! Resources: 6 destroyed.

## Імпортувати наявні ресурси в Terraform-конфігурації`