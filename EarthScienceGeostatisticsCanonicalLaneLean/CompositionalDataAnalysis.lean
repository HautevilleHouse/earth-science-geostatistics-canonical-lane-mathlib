import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeostatisticsCanonicalLaneLean

structure CompositionalPackage where
  simplexRepresentation : Type u
  closureOperation : Prop
  logratioTransform : Prop
  subcompositionCoherence : Prop
  zeroReplacementMethod : Prop

structure CompositionalEvidence (C : CompositionalPackage) where
  closureOperationClosed : C.closureOperation
  logratioTransformClosed : C.logratioTransform
  subcompositionCoherenceClosed : C.subcompositionCoherence
  zeroReplacementMethodClosed : C.zeroReplacementMethod

def CompositionalClosed (C : CompositionalPackage) : Prop :=
  C.closureOperation ∧ C.logratioTransform ∧ C.subcompositionCoherence ∧ C.zeroReplacementMethod

theorem compositional_closed_from_evidence (C : CompositionalPackage) (E : CompositionalEvidence C) :
    CompositionalClosed C := by
  exact And.intro E.closureOperationClosed (And.intro E.logratioTransformClosed (And.intro E.subcompositionCoherenceClosed E.zeroReplacementMethodClosed))

end EarthScienceGeostatisticsCanonicalLaneLean
end HautevilleHouse