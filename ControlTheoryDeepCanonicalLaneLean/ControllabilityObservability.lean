import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ControlTheoryDeepCanonicalLaneLean.ControlSystem

namespace HautevilleHouse
namespace ControlTheoryDeepCanonicalLaneLean

structure ControllabilityObservation {C : ControlSystem} where
  controllable : Prop
  observable : Prop
  controllableClosed : controllable
  observableClosed : observable

structure ControllabilityEvidence {C : ControlSystem}
    (CO : ControllabilityObservation C) where
  controllableClosed : CO.controllable
  observableClosed : CO.observable

def ControllabilityClosed {C : ControlSystem}
    (CO : ControllabilityObservation C) : Prop :=
  CO.controllable ∧ CO.observable

theorem controllability_closed_from_evidence {C : ControlSystem}
    (CO : ControllabilityObservation C)
    (E : ControllabilityEvidence CO) : ControllabilityClosed CO := by
  exact And.intro E.controllableClosed E.observableClosed

theorem controllability_implies_reachability {C : ControlSystem}
    (CO : ControllabilityObservation C) :
    ControllabilityClosed CO → ControlSystemClosed C := by
  intro h
  have hCont : CO.controllable := h.1
  have hObs : CO.observable := h.2
  sorry

end ControlTheoryDeepCanonicalLaneLean
end HautevilleHouse