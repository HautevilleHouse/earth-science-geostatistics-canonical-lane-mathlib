import canonicalLaneMathlib.AdmissibleClass

/-!
# Spatial Simulation Package
-/

namespace HautevilleHouse
namespace EarthScienceGeostatisticsCanonicalLaneLean

structure SpatialSimulationPackage {S : StructuralAnalysisPackage}
    {V : VariogramEstimationPackage S} {K : KrigingPredictionPackage V}
    {U : UncertaintyQuantificationPackage K} where
  simulationAlgorithm : Type u
  realizations : Type v
  reproductionOfVariogram : Prop
  conditioningDataHonored : Prop

structure SpatialSimulationEvidence {S : StructuralAnalysisPackage}
    {V : VariogramEstimationPackage S} {K : KrigingPredictionPackage V}
    {U : UncertaintyQuantificationPackage K} (Sp : SpatialSimulationPackage U) where
  reproductionOfVariogramClosed : Sp.reproductionOfVariogram
  conditioningDataHonoredClosed : Sp.conditioningDataHonored

def SpatialSimulationClosed {S : StructuralAnalysisPackage}
    {V : VariogramEstimationPackage S} {K : KrigingPredictionPackage V}
    {U : UncertaintyQuantificationPackage K} (Sp : SpatialSimulationPackage U) : Prop :=
  Sp.reproductionOfVariogram ∧ Sp.conditioningDataHonored

theorem spatial_simulation_closed_from_evidence {S : StructuralAnalysisPackage}
    {V : VariogramEstimationPackage S} {K : KrigingPredictionPackage V}
    {U : UncertaintyQuantificationPackage K} (Sp : SpatialSimulationPackage U)
    (E : SpatialSimulationEvidence Sp) : SpatialSimulationClosed Sp := by
  exact And.intro E.reproductionOfVariogramClosed E.conditioningDataHonoredClosed

end EarthScienceGeostatisticsCanonicalLaneLean
end HautevilleHouse