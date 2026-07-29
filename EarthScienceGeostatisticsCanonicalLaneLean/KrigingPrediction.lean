import canonicalLaneMathlib.AdmissibleClass

/-!
# Kriging Prediction Package
-/

namespace HautevilleHouse
namespace EarthScienceGeostatisticsCanonicalLaneLean

structure KrigingPredictionPackage {S : StructuralAnalysisPackage}
    {V : VariogramEstimationPackage S} where
  krigingWeights : Type u
  predictionVariance : Type v
  unbiasednessConstraint : Prop
  optimalityCondition : Prop

structure KrigingPredictionEvidence {S : StructuralAnalysisPackage}
    {V : VariogramEstimationPackage S} (K : KrigingPredictionPackage V) where
  unbiasednessConstraintClosed : K.unbiasednessConstraint
  optimalityConditionClosed : K.optimalityCondition

def KrigingPredictionClosed {S : StructuralAnalysisPackage}
    {V : VariogramEstimationPackage S} (K : KrigingPredictionPackage V) : Prop :=
  K.unbiasednessConstraint ∧ K.optimalityCondition

theorem kriging_prediction_closed_from_evidence {S : StructuralAnalysisPackage}
    {V : VariogramEstimationPackage S} (K : KrigingPredictionPackage V)
    (E : KrigingPredictionEvidence K) : KrigingPredictionClosed K := by
  exact And.intro E.unbiasednessConstraintClosed E.optimalityConditionClosed

end EarthScienceGeostatisticsCanonicalLaneLean
end HautevilleHouse