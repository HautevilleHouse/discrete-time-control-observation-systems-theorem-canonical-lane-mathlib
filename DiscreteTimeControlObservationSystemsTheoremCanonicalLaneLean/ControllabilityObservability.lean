import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean.DiscreteTimeSystemModel

namespace HautevilleHouse
namespace DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean

structure ControllabilityPackage {sys : DiscreteTimeSystem} where
  reachableSet : Set sys.StateSpace
  controllabilityCondition : Prop
  controllabilityTheorem : Prop

structure ControllabilityEvidence {sys : DiscreteTimeSystem} (C : ControllabilityPackage) where
  reachableSetClosed : C.reachableSet = {sys.initialState}
  controllabilityConditionClosed : C.controllabilityCondition
  controllabilityTheoremClosed : C.controllabilityTheorem

def ControllabilityClosed {sys : DiscreteTimeSystem} (C : ControllabilityPackage) : Prop :=
  C.controllabilityCondition ∧ C.controllabilityTheorem

theorem controllability_closed_from_evidence {sys : DiscreteTimeSystem} (C : ControllabilityPackage) (E : ControllabilityEvidence C) : ControllabilityClosed C := by
  exact And.intro E.controllabilityConditionClosed E.controllabilityTheoremClosed

structure ObservabilityPackage {sys : DiscreteTimeSystem} where
  indistinguishableSet : Set sys.StateSpace
  observabilityCondition : Prop
  observabilityTheorem : Prop

structure ObservabilityEvidence {sys : DiscreteTimeSystem} (O : ObservabilityPackage) where
  indistinguishableSetClosed : O.indistinguishableSet = {sys.initialState}
  observabilityConditionClosed : O.observabilityCondition
  observabilityTheoremClosed : O.observabilityTheorem

def ObservabilityClosed {sys : DiscreteTimeSystem} (O : ObservabilityPackage) : Prop :=
  O.observabilityCondition ∧ O.observabilityTheorem

theorem observability_closed_from_evidence {sys : DiscreteTimeSystem} (O : ObservabilityPackage) (E : ObservabilityEvidence O) : ObservabilityClosed O := by
  exact And.intro E.observabilityConditionClosed E.observabilityTheoremClosed

end DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean
end HautevilleHouse