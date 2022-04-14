library BasicPractitioner

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include FHIRCommon version '4.0.1' called FC

// boilerplate above, must exist

context Practitioner

define "name": Practitioner.name.given[0].value

// must go through encounter, something like this doesn't work
// define "locations": Practitioner.practitionerRole.location.reference.reference