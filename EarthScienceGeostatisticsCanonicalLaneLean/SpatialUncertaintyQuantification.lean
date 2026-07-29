import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeostatisticsCanonicalLaneLean

structure UncertaintyPackage where
  confidenceIntervals : Type u
  predictionVariance : Type v
  intervalCoverage : Prop
  varianceEstimable : Prop
  normalityAssumption : Prop

structure UncertaintyEvidence (U : UncertaintyPackage) where
  intervalCoverageClosed : U.intervalCoverage
  varianceEstimableClosed : U.varianceEstimable
  normalityAssumptionClosed : U.normalityAssumption

def UncertaintyClosed (U : UncertaintyPackage) : Prop :=
  U.intervalCoverage ∧ U.varianceEstimable ∧ U.normalityAssumption

theorem uncertainty_closed_from_evidence (U : UncertaintyPackage) (E : UncertaintyEvidence U) :
    UncertaintyClosed U := by
  exact And.intro E.intervalCoverageClosed (And.intro E.varianceEstimableClosed E.normalityAssumptionClosed)

end EarthScienceGeostatisticsCanonicalLaneLean
end HautevilleHouse