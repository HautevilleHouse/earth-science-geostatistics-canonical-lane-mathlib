import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeostatisticsCanonicalLaneLean

structure GaussianProcessModel where
  meanFunction : Type u
  covarianceKernel : Type v
  finiteDimensionalConsistency : Prop

structure GaussianProcessEvidence (G : GaussianProcessModel) where
  finiteDimensionalConsistencyClosed : G.finiteDimensionalConsistency

def GaussianProcessClosed (G : GaussianProcessModel) : Prop :=
  G.finiteDimensionalConsistency

theorem gaussian_process_closed_from_evidence (G : GaussianProcessModel)
    (E : GaussianProcessEvidence G) : GaussianProcessClosed G := by
  exact E.finiteDimensionalConsistencyClosed

end EarthScienceGeostatisticsCanonicalLaneLean
end HautevilleHouse
