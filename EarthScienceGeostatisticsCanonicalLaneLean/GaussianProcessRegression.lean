import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeostatisticsCanonicalLaneLean

structure GaussianProcessPackage where
  meanFunction : Type u
  covarianceKernel : Type v
  priorSpecified : Prop
  posteriorCalculable : Prop
  hyperparametersTunable : Prop

structure GaussianProcessEvidence (G : GaussianProcessPackage) where
  priorSpecifiedClosed : G.priorSpecified
  posteriorCalculableClosed : G.posteriorCalculable
  hyperparametersTunableClosed : G.hyperparametersTunable

def GaussianProcessClosed (G : GaussianProcessPackage) : Prop :=
  G.priorSpecified ∧ G.posteriorCalculable ∧ G.hyperparametersTunable

theorem gaussian_process_closed_from_evidence (G : GaussianProcessPackage) (E : GaussianProcessEvidence G) :
    GaussianProcessClosed G := by
  exact And.intro E.priorSpecifiedClosed (And.intro E.posteriorCalculableClosed E.hyperparametersTunableClosed)

end EarthScienceGeostatisticsCanonicalLaneLean
end HautevilleHouse