Instance: Location1
InstanceOf: Location
Title: "Location1"
Description: "Location1"
* identifier[+].system = $synthea
* identifier[=].value = "Location1"
// * managingOrganization = Reference(Organization/Organization1)
* managingOrganization.identifier.system = $synthea
* managingOrganization.identifier.value = "Organization1"

Instance: Organization1
InstanceOf: Organization
Title: "Organization1"
Description: "Organization1"
* name = "Organization1 Government Hospital"
* identifier[+].system = $synthea
* identifier[=].value = "Organization1"
