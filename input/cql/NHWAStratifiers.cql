library NHWAStratifiers

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include FHIRCommon version '4.0.1' called FC

codesystem "ISO-8601-Derived Periods": 'http://ohie.org/CodeSystem/iso-8601-derived-periods' // { 'P0Y--P1Y', 'P1Y--P5Y', ... }
code "P0Y--P1Y": 'P0Y--P1Y' from "ISO-8601-Derived Periods" display '< 1 year'
code "P1Y--P5Y": 'P1Y--P5Y' from "ISO-8601-Derived Periods" display '1-4 years'
code "P5Y--P10Y": 'P5Y--P10Y' from "ISO-8601-Derived Periods" display '5-9 year'
code "P10Y--P15Y": 'P10Y--P15Y' from "ISO-8601-Derived Periods" display '10-14 year'
code "P15Y--P20Y": 'P15Y--P20Y' from "ISO-8601-Derived Periods" display '15-19 year'
code "P20Y--P25Y": 'P20Y--P25Y' from "ISO-8601-Derived Periods" display '20-24 year'
code "P25Y--P30Y": 'P25Y--P30Y' from "ISO-8601-Derived Periods" display '25-29 year'
code "P30Y--P35Y": 'P30Y--P35Y' from "ISO-8601-Derived Periods" display '30-34 year'
code "P35Y--P40Y": 'P35Y--P40Y' from "ISO-8601-Derived Periods" display '35-39 year'
code "P40Y--P45Y": 'P40Y--P45Y' from "ISO-8601-Derived Periods" display '40-45 year'
code "P45Y--P50Y": 'P45Y--P50Y' from "ISO-8601-Derived Periods" display '45-50 year'
code "P50Y--P9999Y": 'P50Y--P9999Y' from "ISO-8601-Derived Periods" display '50+ years'

// need DateTime eg @2014-01-25T not Date, eg not this: @2014-01-25
// parameter "Measurement Period" Interval<DateTime>
// comment out for testing, will be overridden by $evaluate-measure operation in any case
parameter "Measurement Period" Interval<DateTime> default Interval[@1990-01-01T, @2022-08-30T]

context Practitioner

define "Sex":
  Practitioner.gender.value


// Age Group
// define "Age Group":
//   case
//     when AgeInYearsAt(start of "Measurement Period") in Interval[0, 1) then Cx."P0Y--P1Y"
//     when AgeInYearsAt(start of "Measurement Period") in Interval[1, 5) then Cx."P1Y--P5Y"
//     when AgeInYearsAt(start of "Measurement Period") in Interval[5, 10) then Cx."P5Y--P10Y"
//     when AgeInYearsAt(start of "Measurement Period") in Interval[10, 15) then Cx."P10Y--P15Y"
//     when AgeInYearsAt(start of "Measurement Period") in Interval[15, 20) then Cx."P15Y--P20Y"
//     when AgeInYearsAt(start of "Measurement Period") in Interval[20, 25) then Cx."P20Y--P25Y"
//     when AgeInYearsAt(start of "Measurement Period") in Interval[25, 30) then Cx."P25Y--P30Y"
//     when AgeInYearsAt(start of "Measurement Period") in Interval[30, 35) then Cx."P30Y--P35Y"
//     when AgeInYearsAt(start of "Measurement Period") in Interval[35, 40) then Cx."P35Y--P40Y"
//     when AgeInYearsAt(start of "Measurement Period") in Interval[40, 45) then Cx."P40Y--P45Y"
//     when AgeInYearsAt(start of "Measurement Period") in Interval[45, 50) then Cx."P45Y--P50Y"
//     when AgeInYearsAt(start of "Measurement Period") in Interval[50, null] then Cx."P50Y--P9999Y"
//     else null
//   end


// define "Age Group/Sex":
//   "Age Group".code + ':' + "Sex"


define "Location":
  Last([Encounter] E
    return First(E.location L
      return L.location.reference
    ).value
  )


// define "Age Group/Sex/Location":
//   "Age Group".code + ':' + "Sex" + ':' + "Location"
