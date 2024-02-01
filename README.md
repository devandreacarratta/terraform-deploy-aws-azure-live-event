# Terraform per principianti: deploy facile su AWS e Azure.


Ho pensato molto se scrivere o meno questa introduzione e/o se farmi aiutare da ChatGTP oppure no. Ho deciso di farlo in autonomia perché desidero sia più sincera possibile.

Terraform è entrato nella mia vita a Gennaio 2023 ed è scattata subito la scintilla. Molto probabilmente tra il pubblico c'è anche il mio maestro di Terraform quindi un "Grazie Denis" non posso saltarlo. 

Cominciamo col dire il motivo di questo innamoramento folle. Sono anni che "riempio" le risorse Cloud col mio codice sorgente. L'idea di poterle anche creare programmandole mi ha fatto partire di testa in senso buono. 

Non voglio farvi un pippone su Terraform, per quello vi basterà una semplice ricerca in rete. Se siete qua forse siete curiosi di sapere come mi sono avvicinato e come lo utilizzo nel mio contesto lavorativo.

Partiamo subito con un concetto base. Terraform è classificabile come IaC. Il significato è molto semplice: Infrastructure as Code. Nonostante per l'uso/ apprendimento esistano dei tool visuali non voglio usarli e non li concepisco. Nella definizione stessa "as Code" ti indica di dovere scrivere codice. Ho anche scritto un articolo sul mio blog dal titolo "[Terraform: Vuoi Conoscerlo oppure guardarlo?](https://blog.devandreacarratta.it/terraform-conoscere-o-guardare/?utm_source=github&utm_medium=riflessioni-lavorative&utm_campaign=terraform&utm_content=terraform-conoscere-o-guardare)" in merito. 

A differenza di C# il codice Terraform non lo impari a memoria. Di Terraform impari come usarlo e quali sono i limiti che hai davanti. Molto probabilmente sono i tuoi, non suoi. 

Terraform ha il suo linguaggio di programmazione. Si chiama HCL (HashiCorp Configuration Language) ed a mio avviso è molto semplice da usare.  Magari il come usarlo non risulta immediato all'inizio, ma tranquilli che si diventa amici molto rapidamente.

Prima di aprire il codice sorgente, vi voglio dare un consiglio. Capisco che costruire un castello con tanto di torre ed all'interno il famigerato drago sputafuoco sia molto figo, ma credetemi se vi dico che è meglio cominciare a costruire una capanna. 

Per questo motivo questa sera mostrerò come creare componenti semplici e minimali in maniera istintiva (che potrebbe non essere la migliore, ma per imparare vi serve questo passaggio). 

Partiremo dal vedere come si crea uno scheletro di progetto per Azure, uno per AWS ed a seguito tre esempi pratici. Il primo legato al mondo AWS ed i restanti due saranno su Azure. Strano il mio essere di parte, vero?

Ho parlato sin troppo. Cominciamo?

## Scaletta

- Codice Sorgente
    - terraform-empty-template-files [ aws & azure ]
    - aws-s3-static-web-site
    - azure-static-web-site-storage
    - azure-static-web-app


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

### Terraform Lock State

- [How to UNLOCK your Terraform State](https://blog.devandreacarratta.it/en/terraform-howto-unlock-state-file/?utm_source=github&utm_medium=cloud-development&utm_campaign=terraform&utm_content=terraform-howto-unlock-state-file)


## Link Utili
- [AndreaCarratta@Linkedin](https://links.devandreacarratta.it/linkedin)
- [BugsInCloud@YouTube]( https://links.devandreacarratta.it/youtube)