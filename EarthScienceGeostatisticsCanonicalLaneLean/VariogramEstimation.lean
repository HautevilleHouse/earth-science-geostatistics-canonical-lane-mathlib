import canonicalLaneMathlib.AdmissibleClass

/-!
# Variogram Estimation Package
-/

namespace HautevilleHouse
namespace EarthScienceGeostatisticsCanonicalLaneLean

structure VariogramEstimationPackage {S : StructuralAnalysisPackage}
    (E : StructuralAnalysisPackage) where
  empiricalVariogram : Type u
  theoreticalModel : Type v
  fittingCriterion : Prop
  crossValidationScore : Prop

structure VariogramEstimationEvidence {S : StructuralAnalysisPackage}
    (V : VariogramEstimationPackage S) where
  fittingCriterionClosed : V.fittingCriterion
  crossValidationScoreClosed : V.crossValidationScore

def VariogramEstimationClosed {S : StructuralAnalysisPackage}
    (V : VariogramEstimationPackage S) : Prop :=
  V.fittingCriterion ∧ V.crossValidationScore

theorem variogram_estimation_closed_from_evidence {S : StructuralAnalysisPackage}
    (V : VariogramEstimationPackage S) (E : VariogramEstimationEvidence V) :
    VariogramEstimationClosed V := by
  exact And.intro E.fittingCriterionClosed E.crossValidationScoreClosed

end EarthScienceGeostatisticsCanonicalLaneLean
end HautevilleHouse