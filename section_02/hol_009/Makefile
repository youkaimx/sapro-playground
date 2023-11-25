BUCKET="youkaimx-tf"
REGION="us-east-2"
KEY=$(shell basename $$PWD)/terraform.tfstate

init:
	terraform init -backend-config="bucket=$(BUCKET)" -backend-config="key=$(KEY)" -backend-config="region=$(REGION)"
#	terraform init -backend-config=config.s3.tfbackend
fmt:
	terraform fmt
plan:
	terraform plan

apply:
	terraform apply -auto-approve

destroy:
	terraform apply -detroy -auto-approve

precommit:
	pre-commit run -a

precommit-u:
	pre-commit autoupdate

precommit-i:
	pre-commit install

checkov:
	checkov -d. --soft-fail
