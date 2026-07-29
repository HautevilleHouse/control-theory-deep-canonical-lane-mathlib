import HautevilleHouse.ControlTheoryDeepCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ControlTheoryDeepCanonicalLaneLean

structure StateSpaceModel where
  stateSpace : Type u
  inputSpace : Type v
  outputSpace : Type w
  dynamics : stateSpace → inputSpace → stateSpace
  observation : stateSpace → outputSpace
  stabilityCondition : Prop

def stateSpaceModelClosed (M : StateSpaceModel) : Prop :=
  M.stabilityCondition

end ControlTheoryDeepCanonicalLaneLean
end HautevilleHouse
