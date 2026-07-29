import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControlTheoryDeepCanonicalLaneLean

structure FeedbackLinearizationPackage where
  stateSpace : Type u
  controlInput : Type v
  dynamics : stateSpace → controlInput → stateSpace
  outputFunction : stateSpace → ℝ
  lieDerivatives : List (stateSpace → ℝ)
  relativeDegree : ℕ
  exactLinearization : Prop
  linearizingFeedback : stateSpace → controlInput
  trackingControl : Prop

structure FeedbackLinearizationEvidence (F : FeedbackLinearizationPackage) where
  exactLinearizationClosed : F.exactLinearization
  trackingControlClosed : F.trackingControl

def FeedbackLinearizationClosed (F : FeedbackLinearizationPackage) : Prop :=
  F.exactLinearization ∧ F.trackingControl

theorem feedback_linearization_closed_from_evidence (F : FeedbackLinearizationPackage)
    (E : FeedbackLinearizationEvidence F) : FeedbackLinearizationClosed F := by
  exact And.intro E.exactLinearizationClosed E.trackingControlClosed

end ControlTheoryDeepCanonicalLaneLean
end HautevilleHouse