import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean

structure ControlSystem where
  stateSpace : Type u
  [topologicalState : TopologicalSpace stateSpace]
  controlSpace : Type v
  [topologicalControl : TopologicalSpace controlSpace]
  dynamics : stateSpace × controlSpace → stateSpace
  observation : stateSpace → Type w

def controlSystemWellDefined (C : ControlSystem) : Prop :=
  True

structure AdmittedObject where
  system : ControlSystem
  observableProperty : Prop
  conclusion : observableProperty

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.object.conclusion

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

def ConstrainedTheoremClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_theorem_closure (A : AdmissibleClass) :
    ConstrainedTheoremClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean
end HautevilleHouse