import EarthScienceGeostatisticsCanonicalLaneLean.GaussianProcess

namespace HautevilleHouse
namespace EarthScienceGeostatisticsCanonicalLaneLean

structure UncertaintyQuantificationPackage {S : SpatialContinuityPackage}
    {K : KrigingEstimatorPackage S} {G : GaussianProcessPackage K} where
  predictionInterval : Prop
  conditionalSimulation : Prop
  varianceEstimate : Prop

structure UncertaintyQuantificationEvidence {S : SpatialContinuityPackage}
    {K : KrigingEstimatorPackage S} {G : GaussianProcessPackage K}
    (U : UncertaintyQuantificationPackage G) where
  predictionIntervalClosed : U.predictionInterval
  conditionalSimulationClosed : U.conditionalSimulation
  varianceEstimateClosed : U.varianceEstimate

def UncertaintyQuantificationClosed {S : SpatialContinuityPackage}
    {K : KrigingEstimatorPackage S} {G : GaussianProcessPackage K}
    (U : UncertaintyQuantificationPackage G) : Prop :=
  U.predictionInterval ∧ U.conditionalSimulation ∧ U.varianceEstimate

theorem uncertainty_quantification_closed_from_evidence
    {S : SpatialContinuityPackage} {K : KrigingEstimatorPackage S}
    {G : GaussianProcessPackage K} (U : UncertaintyQuantificationPackage G)
    (E : UncertaintyQuantificationEvidence U) : UncertaintyQuantificationClosed U := by
  exact And.intro E.predictionIntervalClosed (And.intro E.conditionalSimulationClosed E.varianceEstimateClosed)

end EarthScienceGeostatisticsCanonicalLaneLean
end HautevilleHouse