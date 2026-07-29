import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeostatisticsCanonicalLaneLean

structure JamesSteinEstimator where
  sampleMean : Type u
  shrinkageFactor : Type v
  dominanceOverMLE : Prop

structure JamesSteinEvidence (J : JamesSteinEstimator) where
  dominanceOverMLEClosed : J.dominanceOverMLE

def JamesSteinClosed (J : JamesSteinEstimator) : Prop :=
  J.dominanceOverMLE

theorem james_stein_closed_from_evidence (J : JamesSteinEstimator)
    (E : JamesSteinEvidence J) : JamesSteinClosed J := by
  exact E.dominanceOverMLEClosed

end EarthScienceGeostatisticsCanonicalLaneLean
end HautevilleHouse
