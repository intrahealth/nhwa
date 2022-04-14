Instance: Practitioner1
InstanceOf: Practitioner
Usage: #example
Title: "Practitioner1"
Description: ""
* name[+].given = "Mittens"
* name[=].family = "Cat"
* name[=].text = "Mittens Cat"
* gender = #female
* birthDate = "1985-01-01"
* identifier[+].system = $national-identifier
* identifier[=].value = "1234"


Instance: PractitionerRole1
InstanceOf: PractitionerRole
Usage: #example
Title: "PractitionerRole1"
Description: ""
* identifier[+].system = $national-identifier
* identifier[=].value = "5555"
* practitioner[+] = Reference(Practitioner1)
* location[+] = Reference(Location1)


// Bundle it all up

RuleSet: pract-bundle
* entry[=].request.method = #POST

Instance: Example-Practitioner1
InstanceOf: Bundle
Title: "Example-Practitioner1"
Description: "Example-Practitioner1"
* type = #transaction

* entry[+].fullUrl = "https://intrahealth.github.io/nhwa/Practitioner/Practitioner1"
* entry[=].request.url = "Practitioner"
* entry[=].resource = Practitioner1
* insert pract-bundle

* entry[+].fullUrl = "https://intrahealth.github.io/nhwa/Location/Location1"
* entry[=].request.url = "Location"
* entry[=].resource = Location1
* insert pract-bundle

* entry[+].fullUrl = "https://intrahealth.github.io/nhwa/Organization/Organization1"
* entry[=].request.url = "Organization"
* entry[=].resource = Organization1
* insert pract-bundle

* entry[+].fullUrl = "https://intrahealth.github.io/nhwa/PractitionerRole/PractitionerRole1"
* entry[=].request.url = "PractitionerRole"
* entry[=].resource = PractitionerRole1
* insert pract-bundle
