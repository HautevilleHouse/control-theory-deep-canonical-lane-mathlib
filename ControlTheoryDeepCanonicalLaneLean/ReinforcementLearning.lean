import HautevilleHouse.ControlTheoryDeepCanonicalLaneLean.OptimalControl

namespace HautevilleHouse
namespace ControlTheoryDeepCanonicalLaneLean

structure ReinforcementLearningSetup {M : StateSpaceModel} where
  policy : M.stateSpace → M.inputSpace
  reward : M.stateSpace → M.inputSpace → ℝ
  valueFunction : M.stateSpace → ℝ
  bellmanOptimality : valueFunction = λ s => max (λ a => reward s a + valueFunction (M.dynamics s a))

def rlClosed {M : StateSpaceModel} (R : ReinforcementLearningSetup M) : Prop :=
  R.bellmanOptimality

end ControlTheoryDeepCanonicalLaneLean
end HautevilleHouse
