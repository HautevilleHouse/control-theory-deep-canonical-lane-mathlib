import canonicalLaneMathlib.AdmissibleClass
import ControlTheoryDeepCanonicalLaneLean.LyapunovEquation

namespace HautevilleHouse
namespace ControlTheoryDeepCanonicalLaneLean

def ConstrainedControlClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_control_endgame (A : AdmissibleClass) :
    ConstrainedControlClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ControlTheoryDeepCanonicalLaneLean
end HautevilleHouse