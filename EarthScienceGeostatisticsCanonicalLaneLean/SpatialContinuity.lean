import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeostatisticsCanonicalLaneLean

structure SpatialContinuityPackage where
  covarianceFunction : Type u
  stationarity : Prop
  ergodicity : Prop
  intrinsicHypothesis : Prop

structure SpatialContinuityEvidence (S : SpatialContinuityPackage) where
  stationarityClosed : S.stationarity
  ergodicityClosed : S.ergodicity
  intrinsicHypothesisClosed : S.intrinsicHypothesis

def SpatialContinuityClosed (S : SpatialContinuityPackage) : Prop :=
  S.stationarity ∧ S.ergodicity ∧ S.intrinsicHypothesis

theorem spatial_continuity_closed_from_evidence (S : SpatialContinuityPackage)
    (E : SpatialContinuityEvidence S) : SpatialContinuityClosed S := by
  exact And.intro E.stationarityClosed
    (And.intro E.ergodicityClosed E.intrinsicHypothesisClosed)

end EarthScienceGeostatisticsCanonicalLaneLean
end HautevilleHouse
