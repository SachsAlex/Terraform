1.  <data.tf> in neuen Ordner eingefügt; von struktur-ec2 zu dynamo-iac
2.  <backend.tf> key editieren zu neuen "Ordner"; Bsp.: <key = "dynamodb-example/terraform.tfstate">
3.  <main.tf> resource "aws_instance" zu "aws_dynamodb_table"; "my_instance" zu "my_dynamodb"
4.  <main.tf> mit Inhalt füllen (Name -> Tabellenname, hash_key -> Partitionsschlüssel, billing_mode -> Bezahlvariante,
    read_capacity -> Anzahl Leseberechtigung, write_capacity -> Anzahl Schreibgeberchtigung, attribute -> Spalte der Tabelle,
    Tags -> Name der Dynamo-Tabelle)
    Quelle: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table
5.  <outputs.tf> Ausgabe der DynamoDB ID und des DynamoDB Namens
6.  <security_group.tf> gelöscht, keine SG notwendig für DynamoDB
    Quelle: https://stackoverflow.com/questions/37706126/can-i-use-ec2-type-secuirty-groups-with-amazon-dynamodb#:~:text=As%20you%20have%20noted%2C%20DynamoDB,access%20to%20your%20DynamoDB%20tables.
7.  <variables.tf> löschen von <variable "instance_type"> und <variable "key_name">
8.  <terraform.tfvars> löschen von <key_name = "Schlüsselpaar-Name">
9.  terraform init
10. terraform fmt
11. terraform plan
12. terraform validate
13. terraform apply
14. DynamoDB in AWS-UI im Browser prüfen
15. tfstate in AWS-UI S3 Bucket im Browser prüfen
16. terraform destroy
