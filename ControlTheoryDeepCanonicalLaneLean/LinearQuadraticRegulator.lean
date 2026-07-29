import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControlTheoryDeepCanonicalLaneLean

structure LQRProblemPackage where
  stateSpace : Type u
  controlSpace : Type v
  linearDynamics : stateSpace → controlSpace → stateSpace
  quadraticCost : stateSpace → controlSpace → ℝ
  optimalControl : stateSpace → controlSpace
  costOptimal : Prop
  closedLoopStable : Prop

structure LQREvidence (L : LQRProblemPackage) where
  costOptimalClosed : L.costOptimal
  closedLoopStableClosed : L.closedLoopStable

def LQRClosed (L : LQRProblemPackage) : Prop :=
  L.costOptimal ∧ L.closedLoopStable

theorem lqr_closed_from_evidence (L : LQRProblemPackage) (E : LQREvidence L) : LQRClosed L := by
  exact And.intro E.costOptimalClosed E.closedLoopStableClosed

end ControlTheoryDeepCanonicalLaneLean
end HautevilleHouse