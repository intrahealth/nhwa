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
