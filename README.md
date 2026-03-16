# Terraform

Azure Infrastructure – Terraform
Terraform-Konfiguration zur automatisierten Bereitstellung einer Azure-Basisinfrastruktur.
Ressourcen
RessourceName (Variable)BeschreibungResource Groupazure_rg_nameContainer für alle Azure-RessourcenVirtual Networkvirtual_network_nameVNet mit Adressraum 10.30.0.0/16Subnetvirtual_network_nameSubnetz 10.30.1.0/24Public IPpublic_IPDynamische öffentliche IP-AdresseNetwork Security Groupnetwork_security_group_nameFirewall-RegelwerkNSG Ruleallow_HTTPEingehender TCP-Traffic auf Port 80 erlaubt
Voraussetzungen

Terraform ≥ 1.0
Azure CLI installiert & eingeloggt (az login)
Azure-Subscription mit ausreichenden Berechtigungen

Verwendung
bashterraform init
terraform plan
terraform apply
Variablen
Alle Werte werden über eine variables.tf übergeben:

azure_rg_name – Name der Resource Group
azure_location – Azure-Region (z.B. westeurope)
virtual_network_name – Name für VNet und Subnet
public_IP – Name der Public IP
network_security_group_name – Name der NSG
