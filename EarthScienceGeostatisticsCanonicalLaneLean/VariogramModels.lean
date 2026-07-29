import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeostatisticsCanonicalLaneLean

structure VariogramPackage where
  variogramFunction : Type u
  semivarianceValues : Type v
  sillExists : Prop
  rangeExists : Prop
  nuggetEffect : Prop
  isotropyProperty : Prop

structure VariogramEvidence (V : VariogramPackage) where
  sillExistsClosed : V.sillExists
  rangeExistsClosed : V.rangeExists
  nuggetEffectClosed : V.nuggetEffect
  isotropyPropertyClosed : V.isotropyProperty

def VariogramClosed (V : VariogramPackage) : Prop :=
  V.sillExists ∧ V.rangeExists ∧ V.nuggetEffect ∧ V.isotropyProperty

theorem variogram_closed_from_evidence (V : VariogramPackage) (E : VariogramEvidence V) :
    VariogramClosed V := by
  exact And.intro E.sillExistsClosed (And.intro E.rangeExistsClosed (And.intro E.nuggetEffectClosed E.isotropyPropertyClosed))

end EarthScienceGeostatisticsCanonicalLaneLean
end HautevilleHouse