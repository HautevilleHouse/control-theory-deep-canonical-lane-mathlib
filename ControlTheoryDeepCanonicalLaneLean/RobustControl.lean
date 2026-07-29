import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControlTheoryDeepCanonicalLaneLean

structure RobustControlPackage where
  systemDynamics : Type u → Type v
  uncertaintySet : Type w
  nominalStability : Prop
  robustStabilityCondition : Prop
  smallGainCondition : Prop

structure RobustControlEvidence (R : RobustControlPackage) where
  nominalStabilityClosed : R.nominalStability
  robustStabilityConditionClosed : R.robustStabilityCondition
  smallGainConditionClosed : R.smallGainCondition

def RobustControlClosed (R : RobustControlPackage) : Prop :=
  R.nominalStability ∧ R.robustStabilityCondition ∧ R.smallGainCondition

theorem robust_control_closed_from_evidence (R : RobustControlPackage)
    (E : RobustControlEvidence R) : RobustControlClosed R := by
  exact And.intro E.nominalStabilityClosed
    (And.intro E.robustStabilityConditionClosed E.smallGainConditionClosed)

end ControlTheoryDeepCanonicalLaneLean
end HautevilleHouse