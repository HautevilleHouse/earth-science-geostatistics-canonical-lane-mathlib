import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeostatisticsCanonicalLaneLean

structure KrigingEstimator where
  variogram : VariogramModel
  sampleLocations : Type u
  targetLocation : Type v
  weights : Type w
  unbiasedness : Prop
  minimumVariance : Prop

structure KrigingEvidence (K : KrigingEstimator) where
  unbiasednessClosed : K.unbiasedness
  minimumVarianceClosed : K.minimumVariance

def KrigingClosed (K : KrigingEstimator) : Prop :=
  K.unbiasedness ∧ K.minimumVariance

theorem kriging_closed_from_evidence (K : KrigingEstimator) (E : KrigingEvidence K) :
    KrigingClosed K := by
  exact And.intro E.unbiasednessClosed E.minimumVarianceClosed

end EarthScienceGeostatisticsCanonicalLaneLean
end HautevilleHouse
