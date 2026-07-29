import HautevilleHouse.ControlTheoryDeepCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ControlTheoryDeepCanonicalLaneLean

structure LyapunovPackage {A : AdmissibleClass} where
  equilibriumPoint : Prop
  lyapunovFunctionExists : Prop
  derivativeNegativeDefinite : Prop
  regionOfAttraction : Prop
  globalStability : Prop

structure LyapunovEvidence {A : AdmissibleClass} (L : LyapunovPackage) where
  equilibriumPointClosed : L.equilibriumPoint
  lyapunovFunctionExistsClosed : L.lyapunovFunctionExists
  derivativeNegativeDefiniteClosed : L.derivativeNegativeDefinite
  regionOfAttractionClosed : L.regionOfAttraction
  globalStabilityClosed : L.globalStability

def LyapunovClosed {A : AdmissibleClass} (L : LyapunovPackage) : Prop :=
  L.equilibriumPoint ∧ L.lyapunovFunctionExists ∧ L.derivativeNegativeDefinite ∧
  L.regionOfAttraction ∧ L.globalStability

theorem lyapunov_closed_from_evidence {A : AdmissibleClass} (L : LyapunovPackage) (E : LyapunovEvidence L) :
    LyapunovClosed L := by
  exact And.intro E.equilibriumPointClosed
    (And.intro E.lyapunovFunctionExistsClosed
      (And.intro E.derivativeNegativeDefiniteClosed
        (And.intro E.regionOfAttractionClosed E.globalStabilityClosed)))

end ControlTheoryDeepCanonicalLaneLean
end HautevilleHouse
