import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControlTheoryDeepCanonicalLaneLean

structure ControlSystem where
  stateSpace : Type u
  inputSpace : Type v
  dynamics : stateSpace → inputSpace → stateSpace
  initialSet : Set stateSpace
  targetSet : Set stateSpace
  stable : Prop
  reachable : Prop

structure ControlSystemEvidence (C : ControlSystem) where
  stableClosed : C.stable
  reachableClosed : C.reachable

def ControlSystemClosed (C : ControlSystem) : Prop :=
  C.stable ∧ C.reachable

theorem control_system_closed_from_evidence (C : ControlSystem)
    (E : ControlSystemEvidence C) : ControlSystemClosed C := by
  exact And.intro E.stableClosed E.reachableClosed

end ControlTheoryDeepCanonicalLaneLean
end HautevilleHouse