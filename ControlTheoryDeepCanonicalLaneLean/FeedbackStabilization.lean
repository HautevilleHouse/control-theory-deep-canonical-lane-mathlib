import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ControlTheoryDeepCanonicalLaneLean.ControlSystem

namespace HautevilleHouse
namespace ControlTheoryDeepCanonicalLaneLean

structure FeedbackStabilization {C : ControlSystem} where
  feedbackLaw : C.stateSpace → C.inputSpace
  closedLoopDynamics : C.stateSpace → C.stateSpace
  asymptoticallyStable : Prop
  feedbackLawDefined : feedbackLaw
  closedLoopDynamicsDefined : closedLoopDynamics
  asymptoticallyStableClosed : asymptoticallyStable

structure FeedbackStabilizationEvidence {C : ControlSystem}
    (F : FeedbackStabilization C) where
  asymptoticallyStableClosed : F.asymptoticallyStable

def FeedbackStabilizationClosed {C : ControlSystem}
    (F : FeedbackStabilization C) : Prop :=
  F.asymptoticallyStable

theorem feedback_stabilization_closed_from_evidence {C : ControlSystem}
    (F : FeedbackStabilization C)
    (E : FeedbackStabilizationEvidence F) : FeedbackStabilizationClosed F := by
  exact E.asymptoticallyStableClosed

theorem feedback_stabilization_implies_control_system_closed
    {C : ControlSystem} (F : FeedbackStabilization C) :
    FeedbackStabilizationClosed F → ControlSystemClosed C := by
  intro h
  have hStable : F.asymptoticallyStable := h
  sorry

end ControlTheoryDeepCanonicalLaneLean
end HautevilleHouse