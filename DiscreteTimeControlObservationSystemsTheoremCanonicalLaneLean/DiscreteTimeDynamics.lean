import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean

structure DiscreteTimeDynamicsPackage where
  stateSpace : Type u
  observationSpace : Type v
  controlSpace : Type w
  stateTransition : stateSpace → controlSpace → stateSpace
  observationMap : stateSpace → observationSpace
  dynamicsConsistent : Prop
  dynamicsConsistentTerm : dynamicsConsistent

structure DiscreteTimeDynamicsEvidence (D : DiscreteTimeDynamicsPackage) where
  dynamicsConsistentClosed : D.dynamicsConsistent

def DiscreteTimeDynamicsClosed (D : DiscreteTimeDynamicsPackage) : Prop :=
  D.dynamicsConsistent

theorem discrete_time_dynamics_closed_from_evidence
    (D : DiscreteTimeDynamicsPackage) (E : DiscreteTimeDynamicsEvidence D) :
    DiscreteTimeDynamicsClosed D := by
  exact E.dynamicsConsistentClosed

end DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean
end HautevilleHouse
