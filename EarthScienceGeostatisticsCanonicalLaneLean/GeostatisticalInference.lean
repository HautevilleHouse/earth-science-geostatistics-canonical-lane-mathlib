import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeostatisticsCanonicalLaneLean

structure InferencePackage where
  parameterEstimates : Type u
  asymptoticNormality : Prop
  consistencyProperty : Prop
  efficiencyProperty : Prop
  sufficientStatistics : Prop

structure InferenceEvidence (I : InferencePackage) where
  asymptoticNormalityClosed : I.asymptoticNormality
  consistencyPropertyClosed : I.consistencyProperty
  efficiencyPropertyClosed : I.efficiencyProperty
  sufficientStatisticsClosed : I.sufficientStatistics

def InferenceClosed (I : InferencePackage) : Prop :=
  I.asymptoticNormality ∧ I.consistencyProperty ∧ I.efficiencyProperty ∧ I.sufficientStatistics

theorem inference_closed_from_evidence (I : InferencePackage) (E : InferenceEvidence I) :
    InferenceClosed I := by
  exact And.intro E.asymptoticNormalityClosed (And.intro E.consistencyPropertyClosed (And.intro E.efficiencyPropertyClosed E.sufficientStatisticsClosed))

end EarthScienceGeostatisticsCanonicalLaneLean
end HautevilleHouse