import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean.DiscreteTimeDynamics

namespace HautevilleHouse
namespace DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean

structure ControllabilityGramian {D : DiscreteTimeDynamics} where
  horizon : ℕ
  gramianMatrix : D.stateSpace → D.stateSpace → ℝ
  controllabilityCondition : Prop
  gramianPositiveDefinite : Prop
  rankCondition : Prop
  gramianPositiveDefiniteTerm : gramianPositiveDefinite
  rankConditionTerm : rankCondition

structure ControllabilityGramianEvidence {D : DiscreteTimeDynamics}
    (G : ControllabilityGramian D) where
  controllabilityConditionClosed : G.controllabilityCondition
  rankConditionClosed : G.rankCondition

def ControllabilityGramianClosed {D : DiscreteTimeDynamics}
    (G : ControllabilityGramian D) : Prop :=
  G.controllabilityCondition ∧ G.rankCondition

theorem controllability_gramian_closed_from_evidence {D : DiscreteTimeDynamics}
    (G : ControllabilityGramian D) (E : ControllabilityGramianEvidence G) :
    ControllabilityGramianClosed G := by
  exact And.intro E.controllabilityConditionClosed E.rankConditionClosed

end DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean
end HautevilleHouse