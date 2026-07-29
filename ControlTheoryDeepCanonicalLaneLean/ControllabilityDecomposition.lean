import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControlTheoryDeepCanonicalLaneLean

structure ControllabilityDecompositionPackage where
  systemDynamics : Type u
  inputMap : Type v
  controllableSubspace : Prop
  uncontrollableSubspace : Prop
  kalmanDecomposition : Prop

structure ControllabilityDecompositionEvidence
    (C : ControllabilityDecompositionPackage) where
  controllableSubspaceClosed : C.controllableSubspace
  uncontrollableSubspaceClosed : C.uncontrollableSubspace
  kalmanDecompositionClosed : C.kalmanDecomposition

def ControllabilityDecompositionClosed
    (C : ControllabilityDecompositionPackage) : Prop :=
  C.controllableSubspace ∧ C.uncontrollableSubspace ∧ C.kalmanDecomposition

theorem controllability_decomposition_closed_from_evidence
    (C : ControllabilityDecompositionPackage)
    (E : ControllabilityDecompositionEvidence C) :
    ControllabilityDecompositionClosed C := by
  exact And.intro E.controllableSubspaceClosed
    (And.intro E.uncontrollableSubspaceClosed E.kalmanDecompositionClosed)

end ControlTheoryDeepCanonicalLaneLean
end HautevilleHouse