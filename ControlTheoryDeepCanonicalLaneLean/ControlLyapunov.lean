import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControlTheoryDeepCanonicalLaneLean

structure ControlLyapunovPackage where
  stateSpace : Type u
  controlInput : Type v
  dynamics : stateSpace → controlInput → stateSpace
  lyapunovFunction : stateSpace → ℝ
  positiveDefinite : Prop
  decreasingAlongTrajectories : Prop
  stabilityConcluded : Prop

structure ControlLyapunovEvidence (C : ControlLyapunovPackage) where
  positiveDefiniteClosed : C.positiveDefinite
  decreasingAlongTrajectoriesClosed : C.decreasingAlongTrajectories
  stabilityConcludedClosed : C.stabilityConcluded

def ControlLyapunovClosed (C : ControlLyapunovPackage) : Prop :=
  C.positiveDefinite ∧ C.decreasingAlongTrajectories ∧ C.stabilityConcluded

theorem control_lyapunov_closed_from_evidence (C : ControlLyapunovPackage)
    (E : ControlLyapunovEvidence C) : ControlLyapunovClosed C := by
  exact And.intro E.positiveDefiniteClosed
    (And.intro E.decreasingAlongTrajectoriesClosed E.stabilityConcludedClosed)

end ControlTheoryDeepCanonicalLaneLean
end HautevilleHouse