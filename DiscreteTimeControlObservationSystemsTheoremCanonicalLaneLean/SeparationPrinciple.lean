import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean.ControlledPlant
import HautevilleHouse.DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean.ObservationModel
import HautevilleHouse.DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean.FeedbackStabilization

namespace HautevilleHouse
namespace DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean

structure SeparationPrincipleEvidence {S U Y : Type} (plant : ControlledPlant S U)
  (observer : ObservationModel S Y) (controller : FeedbackController S U Y)
  (stabilization : FeedbackStabilizationPackage plant observer controller) where
  separationClosed : Prop
  separationClosedTerm : separationClosed

def SeparationPrincipleClosed {S U Y : Type} (plant : ControlledPlant S U)
  (observer : ObservationModel S Y) (controller : FeedbackController S U Y)
  (stabilization : FeedbackStabilizationPackage plant observer controller) : Prop :=
  ∃ (sep : SeparationPrincipleEvidence plant observer controller stabilization),
  sep.separationClosed

theorem separation_principle_closed_from_evidence {S U Y : Type}
  (plant : ControlledPlant S U) (observer : ObservationModel S Y)
  (controller : FeedbackController S U Y)
  (stabilization : FeedbackStabilizationPackage plant observer controller)
  (evidence : SeparationPrincipleEvidence plant observer controller stabilization) :
  SeparationPrincipleClosed plant observer controller stabilization :=
  Exists.intro evidence evidence.separationClosedTerm

end HautevilleHouse
end HautevilleHouse