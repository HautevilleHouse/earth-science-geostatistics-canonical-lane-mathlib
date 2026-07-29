import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeostatisticsCanonicalLaneLean

structure SpatialPredictionValidationPackage {S : SemivariogramPackage}
    (K : KrigingPackage S) where
  crossValidationScheme : Type u
  predictionErrors : Type v
  meanSquaredError : Prop
  standardizedErrorDistribution : Prop

structure SpatialPredictionValidationEvidence {S : SemivariogramPackage}
    {K : KrigingPackage S} (V : SpatialPredictionValidationPackage K) where
  meanSquaredErrorClosed : V.meanSquaredError
  standardizedErrorDistributionClosed : V.standardizedErrorDistribution

def SpatialPredictionValidationClosed {S : SemivariogramPackage}
    {K : KrigingPackage S} (V : SpatialPredictionValidationPackage K) : Prop :=
  V.meanSquaredError ∧ V.standardizedErrorDistribution

theorem spatial_prediction_validation_closed_from_evidence
    {S : SemivariogramPackage} {K : KrigingPackage S}
    (V : SpatialPredictionValidationPackage K)
    (E : SpatialPredictionValidationEvidence V) : SpatialPredictionValidationClosed V := by
  exact And.intro E.meanSquaredErrorClosed E.standardizedErrorDistributionClosed

end EarthScienceGeostatisticsCanonicalLaneLean
end HautevilleHouse