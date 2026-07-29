import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControlTheoryDeepCanonicalLaneLean

structure StabilizabilityDetectabilityPackage where
  uncontrollableModes : Prop
  unobservableModes : Prop
  stabilizableCondition : Prop
  detectableCondition : Prop
  separationPrinciple : Prop

structure StabilizabilityDetectabilityEvidence
    (S : StabilizabilityDetectabilityPackage) where
  uncontrollableModesClosed : S.uncontrollableModes
  unobservableModesClosed : S.unobservableModes
  stabilizableConditionClosed : S.stabilizableCondition
  detectableConditionClosed : S.detectableCondition
  separationPrincipleClosed : S.separationPrinciple

def StabilizabilityDetectabilityClosed
    (S : StabilizabilityDetectabilityPackage) : Prop :=
  S.uncontrollableModes ∧ S.unobservableModes ∧
  S.stabilizableCondition ∧ S.detectableCondition ∧ S.separationPrinciple

theorem stabilizability_detectability_closed_from_evidence
    (S : StabilizabilityDetectabilityPackage)
    (E : StabilizabilityDetectabilityEvidence S) :
    StabilizabilityDetectabilityClosed S := by
  exact And.intro E.uncontrollableModesClosed
    (And.intro E.unobservableModesClosed
      (And.intro E.stabilizableConditionClosed
        (And.intro E.detectableConditionClosed E.separationPrincipleClosed)))

end ControlTheoryDeepCanonicalLaneLean
end HautevilleHouse