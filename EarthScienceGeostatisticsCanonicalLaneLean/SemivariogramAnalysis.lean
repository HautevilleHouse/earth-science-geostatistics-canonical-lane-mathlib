import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeostatisticsCanonicalLaneLean

structure SemivariogramPackage where
  spatialDomain : Type u
  locationSet : spatialDomain -> Type v
  variogramModel : Type w
  nuggetEffect : Prop
  sill : Prop
  range : Prop
  spatialContinuity : Prop
  stationaryAssumption : Prop
  isotropyAssumption : Prop

structure SemivariogramEvidence (S : SemivariogramPackage) where
  nuggetEffectClosed : S.nuggetEffect
  sillClosed : S.sill
  rangeClosed : S.range
  spatialContinuityClosed : S.spatialContinuity
  stationaryAssumptionClosed : S.stationaryAssumption
  isotropyAssumptionClosed : S.isotropyAssumption

def SemivariogramClosed (S : SemivariogramPackage) : Prop :=
  S.nuggetEffect ∧ S.sill ∧ S.range ∧
  S.spatialContinuity ∧ S.stationaryAssumption ∧ S.isotropyAssumption

theorem semivariogram_closed_from_evidence (S : SemivariogramPackage)
    (E : SemivariogramEvidence S) : SemivariogramClosed S := by
  exact And.intro E.nuggetEffectClosed
    (And.intro E.sillClosed
      (And.intro E.rangeClosed
        (And.intro E.spatialContinuityClosed
          (And.intro E.stationaryAssumptionClosed E.isotropyAssumptionClosed))))

end EarthScienceGeostatisticsCanonicalLaneLean
end HautevilleHouse