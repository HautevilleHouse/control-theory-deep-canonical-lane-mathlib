import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControlTheoryDeepCanonicalLaneLean

structure NonlinearControllabilityPackage where
  manifold : Type u
  controlSet : Type v
  reachableSet : manifold → Set manifold
  controllabilityCondition : Prop
  lieBracketCondition : Prop
  accessibilityRankCondition : Prop

structure NonlinearControllabilityEvidence (N : NonlinearControllabilityPackage) where
  controllabilityConditionClosed : N.controllabilityCondition
  lieBracketConditionClosed : N.lieBracketCondition
  accessibilityRankConditionClosed : N.accessibilityRankCondition

def NonlinearControllabilityClosed (N : NonlinearControllabilityPackage) : Prop :=
  N.controllabilityCondition ∧ N.lieBracketCondition ∧ N.accessibilityRankCondition

theorem nonlinear_controllability_closed_from_evidence (N : NonlinearControllabilityPackage)
    (E : NonlinearControllabilityEvidence N) : NonlinearControllabilityClosed N := by
  exact And.intro E.controllabilityConditionClosed
    (And.intro E.lieBracketConditionClosed E.accessibilityRankConditionClosed)

end ControlTheoryDeepCanonicalLaneLean
end HautevilleHouse