import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeostatisticsCanonicalLaneLean

structure KrigingPackage (S : SemivariogramPackage) where
  estimator : S.spatialDomain -> Type v
  variance : S.spatialDomain -> Type w
  unbiasednessCondition : Prop
  optimalWeights : Prop
  bestLinearUnbiasedEstimatorProperty : Prop

structure KrigingEvidence {S : SemivariogramPackage} (K : KrigingPackage S) where
  unbiasednessConditionClosed : K.unbiasednessCondition
  optimalWeightsClosed : K.optimalWeights
  bestLinearUnbiasedEstimatorPropertyClosed : K.bestLinearUnbiasedEstimatorProperty

def KrigingClosed {S : SemivariogramPackage} (K : KrigingPackage S) : Prop :=
  K.unbiasednessCondition ∧ K.optimalWeights ∧ K.bestLinearUnbiasedEstimatorProperty

theorem kriging_closed_from_evidence {S : SemivariogramPackage} (K : KrigingPackage S)
    (E : KrigingEvidence K) : KrigingClosed K := by
  exact And.intro E.unbiasednessConditionClosed
    (And.intro E.optimalWeightsClosed E.bestLinearUnbiasedEstimatorPropertyClosed)

end EarthScienceGeostatisticsCanonicalLaneLean
end HautevilleHouse