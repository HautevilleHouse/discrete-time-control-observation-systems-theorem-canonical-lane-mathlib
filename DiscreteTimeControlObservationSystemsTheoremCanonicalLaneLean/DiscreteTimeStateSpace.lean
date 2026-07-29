import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean

structure DiscreteTimeStateSpacePackage where
  stateSpace : Type u
  topology : TopologicalSpace stateSpace
  timeIndex : ℕ
  initialCondition : stateSpace
  transitionDynamics : stateSpace → stateSpace → Prop
  measurableStructure : Prop
  markovProperty : Prop
  timeHomogeneous : Prop

structure DiscreteTimeStateSpaceEvidence (S : DiscreteTimeStateSpacePackage) where
  measurableStructureClosed : S.measurableStructure
  markovPropertyClosed : S.markovProperty
  timeHomogeneousClosed : S.timeHomogeneous

def DiscreteTimeStateSpaceClosed (S : DiscreteTimeStateSpacePackage) : Prop :=
  S.measurableStructure ∧ S.markovProperty ∧ S.timeHomogeneous

theorem discrete_time_state_space_closed_from_evidence
    (S : DiscreteTimeStateSpacePackage) (E : DiscreteTimeStateSpaceEvidence S) :
    DiscreteTimeStateSpaceClosed S := by
  exact And.intro E.measurableStructureClosed
    (And.intro E.markovPropertyClosed E.timeHomogeneousClosed)

end DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean
end HautevilleHouse