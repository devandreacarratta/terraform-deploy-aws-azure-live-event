# terraform-deploy-aws-azure-live-event

Terraform per principianti: deploy facile su AWS e Azure


## Terraform Login

### Azure

 az login

 az account set --subscription <subscriptionid>

### AWS 

Per accedere tramite terraform al cloud AWS devi essere in possesso della coppia di valori

-   AWS Access Key ID
-   AWS Secret Access Key

Ed in seguito (se non l'hai fatto in precedenza) configurare l'ambiente tramite **aws configure**

Il procedimento risulta lo stesso mostrato in questi tutorial per lavorare con S3

- YouTube --> [AWS S3: Come generare le CHIAVI d'ACCESSO SEGRETE al tuo STORAGE su Cloud!](https://youtu.be/RZMIUsewDXc)
- Blog --> [AWS S3 & CLI - Configurazione ed esplorazione](https://blog.devandreacarratta.it/aws-s3-bucket-cli/?utm_source=github&utm_medium=cloud-development&utm_campaign=aws&utm_content=aws-s3-bucket-cli)


## Terraform run

terraform init

terraform plan -var-file="variables/dev.tfvars"

terraform apply -var-file="variables/dev.tfvars"

terraform destroy  -var-file="variables/dev.tfvars"