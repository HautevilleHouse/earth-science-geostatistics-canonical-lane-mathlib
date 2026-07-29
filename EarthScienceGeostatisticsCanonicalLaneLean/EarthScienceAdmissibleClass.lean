import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeostatisticsCanonicalLaneLean

structure GeostatisticsAdmittedObject where
  studyRegion : Type
  spatialCoordinates : studyRegion → ℝ^3
  primaryVariable : studyRegion → ℝ
  sufficientStatistic : Prop
  exponentialFamilyForm : Prop
  mleConsistent : Prop
  NeymanPearsonLemmaApplied : Prop
  conclusion : sufficientStatistic ∧ exponentialFamilyForm ∧ mleConsistent ∧ NeymanPearsonLemmaApplied

structure AdmissibleClass where
  object : GeostatisticsAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  GeostatisticsWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

def GeostatisticsWitnessClosed (O : GeostatisticsAdmittedObject) : Prop :=
  O.sufficientStatistic ∧ O.exponentialFamilyForm ∧ O.mleConsistent ∧ O.NeymanPearsonLemmaApplied

end EarthScienceGeostatisticsCanonicalLaneLean
end HautevilleHouse
