import EarthScienceAdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeostatisticsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  GeostatisticsWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end EarthScienceGeostatisticsCanonicalLaneLean
end HautevilleHouse
