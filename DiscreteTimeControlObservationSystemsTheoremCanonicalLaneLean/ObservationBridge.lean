import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean

structure ObservationBridgePackage {D : DiscreteTimeDynamicsPackage} where
  controllabilityGramian : Prop
  observabilityGramian : Prop
  detectabilityCondition : Prop
  controllabilityGramianTerm : controllabilityGramian
  observabilityGramianTerm : observabilityGramian
  detectabilityConditionTerm : detectabilityCondition

structure ObservationBridgeEvidence {D : DiscreteTimeDynamicsPackage}
    (O : ObservationBridgePackage D) where
  controllabilityGramianClosed : O.controllabilityGramian
  observabilityGramianClosed : O.observabilityGramian
  detectabilityConditionClosed : O.detectabilityCondition

def ObservationBridgeClosed {D : DiscreteTimeDynamicsPackage}
    (O : ObservationBridgePackage D) : Prop :=
  O.controllabilityGramian ∧ O.observabilityGramian ∧ O.detectabilityCondition

theorem observation_bridge_closed_from_evidence
    {D : DiscreteTimeDynamicsPackage} (O : ObservationBridgePackage D)
    (E : ObservationBridgeEvidence O) : ObservationBridgeClosed O := by
  exact And.intro E.controllabilityGramianClosed
    (And.intro E.observabilityGramianClosed E.detectabilityConditionClosed)

end DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean
end HautevilleHouse
