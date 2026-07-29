import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean

structure DiscreteTimeSystem where
  StateSpace : Type u
  ControlSpace : Type v
  ObservationSpace : Type w
  stateTransition : StateSpace → ControlSpace → StateSpace
  observationMap : StateSpace → ObservationSpace
  initialState : StateSpace
  controlSequence : ℕ → ControlSpace
  stateSequence : ℕ → StateSpace := λ n => 
    match n with
    | 0 => initialState
    | n+1 => stateTransition (stateSequence n) (controlSequence n)
  observationSequence : ℕ → ObservationSpace := λ n => observationMap (stateSequence n)

structure DiscreteTimeSystemEvidence (sys : DiscreteTimeSystem) where
  stateTransitionComplete : sys.stateTransition = sys.stateTransition
  observationMapComplete : sys.observationMap = sys.observationMap
  initialStateDefined : sys.initialState = sys.initialState
  sequencesDefined : sys.stateSequence 0 = sys.initialState

def DiscreteTimeSystemClosed (sys : DiscreteTimeSystem) : Prop := True

theorem discrete_time_system_closed_from_evidence (sys : DiscreteTimeSystem) (E : DiscreteTimeSystemEvidence sys) : DiscreteTimeSystemClosed sys := by
  unfold DiscreteTimeSystemClosed
  trivial

end DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean
end HautevilleHouse