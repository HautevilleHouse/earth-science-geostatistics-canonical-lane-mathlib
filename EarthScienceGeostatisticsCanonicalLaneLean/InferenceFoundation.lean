import EarthScienceAdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeostatisticsCanonicalLaneLean

structure InferenceFoundationEvidence where
  sufficientStatisticClosed : Prop
  exponentialFamilyClosed : Prop
  mleConsistencyClosed : Prop
  neymanPearsonClosed : Prop

def InferenceFoundationClosed (E : InferenceFoundationEvidence) : Prop :=
  E.sufficientStatisticClosed ∧ E.exponentialFamilyClosed ∧ E.mleConsistencyClosed ∧ E.neymanPearsonClosed

theorem inference_foundation_closed_from_evidence (E : InferenceFoundationEvidence) :
    InferenceFoundationClosed E := by
  exact And.intro E.sufficientStatisticClosed (And.intro E.exponentialFamilyClosed (And.intro E.mleConsistencyClosed E.neymanPearsonClosed))

end EarthScienceGeostatisticsCanonicalLaneLean
end HautevilleHouse
