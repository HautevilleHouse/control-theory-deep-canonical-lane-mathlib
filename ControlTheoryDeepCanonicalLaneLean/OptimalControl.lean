import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControlTheoryDeepCanonicalLaneLean

structure OptimalControlPackage where
  stateSpace : Type u
  controlInput : Type v
  dynamics : stateSpace → controlInput → stateSpace
  costFunctional : (stateSpace → controlInput → ℝ) → ℝ
  optimalPolicy : Prop
  hamiltonJacobiBellmanEquation : Prop
  valueFunctionDefined : Prop

structure OptimalControlEvidence (O : OptimalControlPackage) where
  optimalPolicyClosed : O.optimalPolicy
  hamiltonJacobiBellmanEquationClosed : O.hamiltonJacobiBellmanEquation
  valueFunctionDefinedClosed : O.valueFunctionDefined

def OptimalControlClosed (O : OptimalControlPackage) : Prop :=
  O.optimalPolicy ∧ O.hamiltonJacobiBellmanEquation ∧ O.valueFunctionDefined

theorem optimal_control_closed_from_evidence (O : OptimalControlPackage)
    (E : OptimalControlEvidence O) : OptimalControlClosed O := by
  exact And.intro E.optimalPolicyClosed
    (And.intro E.hamiltonJacobiBellmanEquationClosed E.valueFunctionDefinedClosed)

end ControlTheoryDeepCanonicalLaneLean
end HautevilleHouse