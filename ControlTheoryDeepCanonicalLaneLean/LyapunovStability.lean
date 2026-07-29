import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControlTheoryDeepCanonicalLaneLean

structure LyapunovFunctionPackage where
  stateSpace : Type u
  dynamics : stateSpace → stateSpace
  lyapunovFunction : stateSpace → ℝ
  positiveDefinite : Prop
  alongFlowDecreasing : Prop

structure LyapunovStabilityEvidence (L : LyapunovFunctionPackage) where
  positiveDefiniteClosed : L.positiveDefinite
  alongFlowDecreasingClosed : L.alongFlowDecreasing

def LyapunovStabilityClosed (L : LyapunovFunctionPackage) : Prop :=
  L.positiveDefinite ∧ L.alongFlowDecreasing

theorem lyapunov_stability_closed_from_evidence (L : LyapunovFunctionPackage)
    (E : LyapunovStabilityEvidence L) : LyapunovStabilityClosed L := by
  exact And.intro E.positiveDefiniteClosed E.alongFlowDecreasingClosed

end ControlTheoryDeepCanonicalLaneLean
end HautevilleHouse