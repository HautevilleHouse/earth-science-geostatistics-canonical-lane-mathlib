import EarthScienceGeostatisticsCanonicalLaneLean.SpatialContinuity

namespace HautevilleHouse
namespace EarthScienceGeostatisticsCanonicalLaneLean

structure VariogramModelingPackage {S : SpatialContinuityPackage} where
  empiricalVariogram : Prop
  modelFitted : Prop
  nuggetSillRange : Prop

structure VariogramModelingEvidence {S : SpatialContinuityPackage}
    (V : VariogramModelingPackage S) where
  empiricalVariogramClosed : V.empiricalVariogram
  modelFittedClosed : V.modelFitted
  nuggetSillRangeClosed : V.nuggetSillRange

def VariogramModelingClosed {S : SpatialContinuityPackage}
    (V : VariogramModelingPackage S) : Prop :=
  V.empiricalVariogram ∧ V.modelFitted ∧ V.nuggetSillRange

theorem variogram_modeling_closed_from_evidence {S : SpatialContinuityPackage}
    (V : VariogramModelingPackage S) (E : VariogramModelingEvidence V) :
    VariogramModelingClosed V := by
  exact And.intro E.empiricalVariogramClosed (And.intro E.modelFittedClosed E.nuggetSillRangeClosed)

end EarthScienceGeostatisticsCanonicalLaneLean
end HautevilleHouse