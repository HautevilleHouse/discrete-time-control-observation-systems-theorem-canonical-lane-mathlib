import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean

structure DiscreteTimeControlObservationAdmittedObject where
  space : Type
  discreteTimeStructure : Prop
  controlInputs : Type
  observationMapping : Type
  controllabilityCondition : Prop
  observabilityCondition : Prop
  stabilityCondition : Prop
  conclusion : controllabilityCondition ∧ observabilityCondition ∧ stabilityCondition

def DiscreteTimeControlObservationWitnessClosed (O : DiscreteTimeControlObservationAdmittedObject) : Prop :=
  O.controllabilityCondition ∧ O.observabilityCondition ∧ O.stabilityCondition

end DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean
end HautevilleHouse