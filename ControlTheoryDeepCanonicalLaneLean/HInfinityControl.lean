import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControlTheoryDeepCanonicalLaneLean

structure HInfinityControlPackage where
  disturbanceInput : Type u
  controlledOutput : Type v
  l2GainCondition : Prop
  riccatiInequality : Prop
  suboptimalController : Prop

structure HInfinityControlEvidence (H : HInfinityControlPackage) where
  l2GainConditionClosed : H.l2GainCondition
  riccatiInequalityClosed : H.riccatiInequality
  suboptimalControllerClosed : H.suboptimalController

def HInfinityControlClosed (H : HInfinityControlPackage) : Prop :=
  H.l2GainCondition ∧ H.riccatiInequality ∧ H.suboptimalController

theorem h_infinity_control_closed_from_evidence
    (H : HInfinityControlPackage) (E : HInfinityControlEvidence H) :
    HInfinityControlClosed H := by
  exact And.intro E.l2GainConditionClosed
    (And.intro E.riccatiInequalityClosed E.suboptimalControllerClosed)

end ControlTheoryDeepCanonicalLaneLean
end HautevilleHouse