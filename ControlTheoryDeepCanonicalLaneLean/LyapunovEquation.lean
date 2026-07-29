import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControlTheoryDeepCanonicalLaneLean

structure LyapunovEquationPackage where
  dynamicsMatrix : Type u
  positiveDefiniteMatrix : Type v
  lyapunovEquation : Prop
  uniqueSolution : Prop
  solutionExplicit : Prop

structure LyapunovEquationEvidence (L : LyapunovEquationPackage) where
  lyapunovEquationClosed : L.lyapunovEquation
  uniqueSolutionClosed : L.uniqueSolution
  solutionExplicitClosed : L.solutionExplicit

def LyapunovEquationClosed (L : LyapunovEquationPackage) : Prop :=
  L.lyapunovEquation ∧ L.uniqueSolution ∧ L.solutionExplicit

theorem lyapunov_equation_closed_from_evidence (L : LyapunovEquationPackage)
    (E : LyapunovEquationEvidence L) : LyapunovEquationClosed L := by
  exact And.intro E.lyapunovEquationClosed (And.intro E.uniqueSolutionClosed E.solutionExplicitClosed)

end ControlTheoryDeepCanonicalLaneLean
end HautevilleHouse