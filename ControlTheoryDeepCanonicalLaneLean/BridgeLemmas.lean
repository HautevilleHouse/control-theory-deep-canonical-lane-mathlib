import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControlTheoryDeepCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  bridgeClosed A

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.bridgeWitness

end ControlTheoryDeepCanonicalLaneLean
end HautevilleHouse
