import SpatialContinuity

namespace HautevilleHouse
namespace EarthScienceGeostatisticsCanonicalLaneLean

structure KrigingOptimalityEvidence where
  ordinaryKrigingBLUE : Prop
  simpleKrigingMSE : Prop
  indicatorKrigingValid : Prop
  cokrigingImproves : Prop

def KrigingOptimalityClosed (E : KrigingOptimalityEvidence) : Prop :=
  E.ordinaryKrigingBLUE ∧ E.simpleKrigingMSE ∧ E.indicatorKrigingValid ∧ E.cokrigingImproves

theorem kriging_optimality_closed_from_evidence (E : KrigingOptimalityEvidence) :
    KrigingOptimalityClosed E := by
  exact And.intro E.ordinaryKrigingBLUE (And.intro E.simpleKrigingMSE (And.intro E.indicatorKrigingValid E.cokrigingImproves))

end EarthScienceGeostatisticsCanonicalLaneLean
end HautevilleHouse
