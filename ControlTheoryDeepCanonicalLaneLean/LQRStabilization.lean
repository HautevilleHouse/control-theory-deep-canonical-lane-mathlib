import HautevilleHouse.ControlTheoryDeepCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ControlTheoryDeepCanonicalLaneLean

structure LQRPackage {A : AdmissibleClass} where
  linearDynamics : Prop
  quadraticCost : Prop
  optimalGain : Prop
  closedLoopStable : Prop

structure LQREvidence {A : AdmissibleClass} (L : LQRPackage) where
  linearDynamicsClosed : L.linearDynamics
  quadraticCostClosed : L.quadraticCost
  optimalGainClosed : L.optimalGain
  closedLoopStableClosed : L.closedLoopStable

def LQRClosed {A : AdmissibleClass} (L : LQRPackage) : Prop :=
  L.linearDynamics ∧ L.quadraticCost ∧ L.optimalGain ∧ L.closedLoopStable

theorem lqr_closed_from_evidence {A : AdmissibleClass} (L : LQRPackage) (E : LQREvidence L) :
    LQRClosed L := by
  exact And.intro E.linearDynamicsClosed
    (And.intro E.quadraticCostClosed
      (And.intro E.optimalGainClosed E.closedLoopStableClosed))

end ControlTheoryDeepCanonicalLaneLean
end HautevilleHouse
