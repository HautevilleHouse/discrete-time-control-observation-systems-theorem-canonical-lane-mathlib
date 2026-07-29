import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean

structure DiscreteTimeDynamics where
  stateSpace : Type u
  observationSpace : Type v
  controlSpace : Type w
  stateTransition : stateSpace → controlSpace → stateSpace
  observationMap : stateSpace → observationSpace
  transitionWellDefined : Prop
  observationWellDefined : Prop
  transitionWellDefinedTerm : transitionWellDefined
  observationWellDefinedTerm : observationWellDefined

structure DiscreteTimeDynamicsEvidence (D : DiscreteTimeDynamics) where
  transitionWellDefinedClosed : D.transitionWellDefined
  observationWellDefinedClosed : D.observationWellDefined

def DiscreteTimeDynamicsClosed (D : DiscreteTimeDynamics) : Prop :=
  D.transitionWellDefined ∧ D.observationWellDefined

theorem discrete_time_dynamics_closed_from_evidence (D : DiscreteTimeDynamics)
    (E : DiscreteTimeDynamicsEvidence D) : DiscreteTimeDynamicsClosed D := by
  exact And.intro E.transitionWellDefinedClosed E.observationWellDefinedClosed

end DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean
end HautevilleHouse