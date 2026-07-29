import EarthScienceGeostatisticsCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace EarthScienceGeostatisticsCanonicalLaneLean

structure AdmissibleClass where
  object : GeostatisticsAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  GeostatisticsWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end EarthScienceGeostatisticsCanonicalLaneLean
end HautevilleHouse
