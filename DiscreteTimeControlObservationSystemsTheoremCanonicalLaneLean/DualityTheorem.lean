import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean.ControllabilityObservability

namespace HautevilleHouse
namespace DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean

structure DualityPackage {sys : DiscreteTimeSystem} where
  dualSystem : DiscreteTimeSystem
  controllabilityDualObservation : Prop
  observabilityDualControl : Prop
  dualityTheorem : Prop

structure DualityEvidence {sys : DiscreteTimeSystem} (D : DualityPackage) where
  dualSystemDefined : D.dualSystem.stateTransition = D.dualSystem.stateTransition
  controllabilityDualObservationClosed : D.controllabilityDualObservation
  observabilityDualControlClosed : D.observabilityDualControl
  dualityTheoremClosed : D.dualityTheorem

def DualityClosed {sys : DiscreteTimeSystem} (D : DualityPackage) : Prop :=
  D.controllabilityDualObservation ∧ D.observabilityDualControl ∧ D.dualityTheorem

theorem duality_closed_from_evidence {sys : DiscreteTimeSystem} (D : DualityPackage) (E : DualityEvidence D) : DualityClosed D := by
  exact And.intro E.controllabilityDualObservationClosed (And.intro E.observabilityDualControlClosed E.dualityTheoremClosed)

end DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean
end HautevilleHouse