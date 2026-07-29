import canonicalLaneMathlib.AdmissibleClass

/-!
# Structural Analysis Package
-/

namespace HautevilleHouse
namespace EarthScienceGeostatisticsCanonicalLaneLean

structure StructuralAnalysisPackage where
  spatialField : Type u
  variogramModel : Type v
  krigingSystem : Type w
  stationarityAssumption : Prop
  isotropyAssumption : Prop

structure StructuralAnalysisEvidence (S : StructuralAnalysisPackage) where
  stationarityAssumptionClosed : S.stationarityAssumption
  isotropyAssumptionClosed : S.isotropyAssumption

def StructuralAnalysisClosed (S : StructuralAnalysisPackage) : Prop :=
  S.stationarityAssumption ∧ S.isotropyAssumption

theorem structural_analysis_closed_from_evidence (S : StructuralAnalysisPackage)
    (E : StructuralAnalysisEvidence S) : StructuralAnalysisClosed S := by
  exact And.intro E.stationarityAssumptionClosed E.isotropyAssumptionClosed

end EarthScienceGeostatisticsCanonicalLaneLean
end HautevilleHouse