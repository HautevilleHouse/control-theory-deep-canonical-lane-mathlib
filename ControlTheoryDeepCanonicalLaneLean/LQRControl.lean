import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControlTheoryDeepCanonicalLaneLean

structure LQRControlPackage (L : LyapunovEquationPackage) where
  costFunctional : Prop
  optimalControlLaw : Prop
  riccatiEquation : Prop
  closedLoopStability : Prop

structure LQRControlEvidence {L : LyapunovEquationPackage}
    (Q : LQRControlPackage L) where
  costFunctionalClosed : Q.costFunctional
  optimalControlLawClosed : Q.optimalControlLaw
  riccatiEquationClosed : Q.riccatiEquation
  closedLoopStabilityClosed : Q.closedLoopStability

def LQRControlClosed {L : LyapunovEquationPackage}
    (Q : LQRControlPackage L) : Prop :=
  Q.costFunctional ∧ Q.optimalControlLaw ∧ Q.riccatiEquation ∧ Q.closedLoopStability

theorem lqr_control_closed_from_evidence {L : LyapunovEquationPackage}
    (Q : LQRControlPackage L) (E : LQRControlEvidence Q) : LQRControlClosed Q := by
  exact And.intro E.costFunctionalClosed
    (And.intro E.optimalControlLawClosed
      (And.intro E.riccatiEquationClosed E.closedLoopStabilityClosed))

end ControlTheoryDeepCanonicalLaneLean
end HautevilleHouse