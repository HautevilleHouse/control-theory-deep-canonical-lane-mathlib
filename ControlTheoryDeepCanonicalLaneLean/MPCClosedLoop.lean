import HautevilleHouse.ControlTheoryDeepCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ControlTheoryDeepCanonicalLaneLean

structure MPCPackage {A : AdmissibleClass} where
  recedingHorizon : Prop
  constraintsFeasible : Prop
  costFunctional : Prop
  recursiveFeasibility : Prop
  stabilityGuarantee : Prop

structure MPCEvidence {A : AdmissibleClass} (M : MPCPackage) where
  recedingHorizonClosed : M.recedingHorizon
  constraintsFeasibleClosed : M.constraintsFeasible
  costFunctionalClosed : M.costFunctional
  recursiveFeasibilityClosed : M.recursiveFeasibility
  stabilityGuaranteeClosed : M.stabilityGuarantee

def MPCClosed {A : AdmissibleClass} (M : MPCPackage) : Prop :=
  M.recedingHorizon ∧ M.constraintsFeasible ∧ M.costFunctional ∧
  M.recursiveFeasibility ∧ M.stabilityGuarantee

theorem mpc_closed_from_evidence {A : AdmissibleClass} (M : MPCPackage) (E : MPCEvidence M) :
    MPCClosed M := by
  exact And.intro E.recedingHorizonClosed
    (And.intro E.constraintsFeasibleClosed
      (And.intro E.costFunctionalClosed
        (And.intro E.recursiveFeasibilityClosed E.stabilityGuaranteeClosed)))

end ControlTheoryDeepCanonicalLaneLean
end HautevilleHouse
