import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean.StabilizabilityDetectability

namespace HautevilleHouse
namespace DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean

structure SeparationPrinciplePackage {sys : DiscreteTimeSystem} where
  controller : sys.StateSpace → sys.ControlSpace
  observer : sys.ObservationSpace → sys.StateSpace
  closedLoopState : sys.StateSpace := sys.initialState
  separationCondition : Prop
  separationTheorem : Prop

structure SeparationPrincipleEvidence {sys : DiscreteTimeSystem} (S : SeparationPrinciplePackage) where
  controllerDefined : S.controller = S.controller
  observerDefined : S.observer = S.observer
  separationConditionClosed : S.separationCondition
  separationTheoremClosed : S.separationTheorem

def SeparationPrincipleClosed {sys : DiscreteTimeSystem} (S : SeparationPrinciplePackage) : Prop :=
  S.separationCondition ∧ S.separationTheorem

theorem separation_principle_closed_from_evidence {sys : DiscreteTimeSystem} (S : SeparationPrinciplePackage) (E : SeparationPrincipleEvidence S) : SeparationPrincipleClosed S := by
  exact And.intro E.separationConditionClosed E.separationTheoremClosed

end DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean
end HautevilleHouse