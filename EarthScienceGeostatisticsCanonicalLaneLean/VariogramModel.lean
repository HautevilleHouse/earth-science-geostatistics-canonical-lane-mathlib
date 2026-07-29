import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeostatisticsCanonicalLaneLean

structure VariogramModel where
  distance : Type u
  semivariance : Type v
  nuggetEffect : Prop
  sill : Prop
  range : Prop
  isotropic : Prop

structure VariogramEvidence (V : VariogramModel) where
  nuggetEffectClosed : V.nuggetEffect
  sillClosed : V.sill
  rangeClosed : V.range
  isotropicClosed : V.isotropic

def VariogramClosed (V : VariogramModel) : Prop :=
  V.nuggetEffect ∧ V.sill ∧ V.range ∧ V.isotropic

theorem variogram_closed_from_evidence (V : VariogramModel) (E : VariogramEvidence V) :
    VariogramClosed V := by
  exact And.intro E.nuggetEffectClosed
    (And.intro E.sillClosed
      (And.intro E.rangeClosed E.isotropicClosed))

end EarthScienceGeostatisticsCanonicalLaneLean
end HautevilleHouse
