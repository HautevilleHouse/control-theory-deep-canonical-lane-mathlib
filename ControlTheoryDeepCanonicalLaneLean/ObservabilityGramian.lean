import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControlTheoryDeepCanonicalLaneLean

structure ObservabilityGramianPackage where
  systemDynamics : Type u
  outputMap : Type v
  observabilityGramian : Prop
  observabilityRankCondition : Prop
  detectabilityCondition : Prop

structure ObservabilityGramianEvidence (O : ObservabilityGramianPackage) where
  observabilityGramianClosed : O.observabilityGramian
  observabilityRankConditionClosed : O.observabilityRankCondition
  detectabilityConditionClosed : O.detectabilityCondition

def ObservabilityGramianClosed (O : ObservabilityGramianPackage) : Prop :=
  O.observabilityGramian ∧ O.observabilityRankCondition ∧ O.detectabilityCondition

theorem observability_gramian_closed_from_evidence
    (O : ObservabilityGramianPackage) (E : ObservabilityGramianEvidence O) :
    ObservabilityGramianClosed O := by
  exact And.intro E.observabilityGramianClosed
    (And.intro E.observabilityRankConditionClosed E.detectabilityConditionClosed)

end ControlTheoryDeepCanonicalLaneLean
end HautevilleHouse