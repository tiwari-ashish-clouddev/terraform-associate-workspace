Terraform needs <b>access credentials with relevant permissions</b> to create and manage the enviornments.

Access Credential:

Depending on the provider, the type of access credentials would change.

<table>
<tr>
    <th>PROVIDER</th>
    <th>ACCESS CREDENTIALS</th>
</tr>
<tr>
<td>AWS</td>
<td>Access Keys & Secret Keys</td>
</tr>
<tr>
<td>GitHub</td>
<td>Tokens</td>
</tr>
<tr>
<td>Kubernetes</td>
<td>kubeconfig file, Credentials Config</td>
</tr>
<tr>
<td>Digital Ocean</td>
<td>Tokens</td>
</tr>
</table>

Basics of Authentication and Authorization :
--------------------------------------------
    Authentication is the process of verifying who a user is.

    Authorization is the process of verifying what they have access to.

Example:

Ashish is user in AWS with Administrative Access.

There 3 types of Providers:

1. Hashicorp Mantained (Ex: AWS,Azure,GCP,Kubernetes)
2. Partner (Ex: Oracle, Alibaba, MongoDb, DigitalOcean)
3. Community

Note:
Terraform requires explicit source information for any providers that are not Hashicorp-Maintained, using a new syntax
in the required_providers nested block inside the terraform configuration block.

Provider Maintained by Hashicorp
Ex:
```terraform
provider "aws" {
    region          =   "ap-south-1"
    access-key      =   "PUT YOUR ACCESS KEY HERE"
    secret-key      =   "PUT YOUR SECRET KEY HERE"
}
```
Provider Not Maintained by Hashicorp
Ex:
```terraform
terraform{
    required_providers{
        digitalocean = {
          source = "digitalocean/digitalocean"
        }
    }
}

provider "digitalocean" {
  token ="PUT YOUR TOKEN HERE"
}
```
--------------------------------------------
Terraform Destroy:
--------------------------------------------
When we run the terraform destroy command, it allows us to destroy all the resource that are created within the folder.
If you have 2 (.tf) files in a folder, so if I run terraform destroy command it will delete all the resources of both files.

example: In one file I am having GitHub repository creation via terraform and in other I am creating aws ec2 instance.
So, I run terraform destroy it will delete all the resources.

What if I don't wanted to delete all the resources but just certain resources:
So, in above scenario we can use -target flag, which allow us to delete only specific resource.


Example: In aws, I am having ec2 instance and s3 bucket and I wanted to delete just s3 bucket so I can use -target flag.

```
terraform destroy -target <<resource_name>>.<<local-resource-name>>
```

--------------------------------------------
Terraform State:
--------------------------------------------

1. Terraform stores the state of the infrastructure that is being created from the TF files.
2. This state allows to terraform to map real world resource to your existing configuration.

Terraform primary function is to create, modify, and destroy infrastructure resources to match the desired state described
in a Terraform Configuration.

Important Pointer:
1.  Terraform tries to ensure that the deployed infrastructure is based on the desired state
2.  If there is a difference between the two, terraform plan presents a descrption of the changes necessary to achieve the desired state.