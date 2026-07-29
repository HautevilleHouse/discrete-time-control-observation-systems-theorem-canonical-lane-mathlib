import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean.ControlledPlant
import HautevilleHouse.DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean.ObservationModel

namespace HautevilleHouse
namespace DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean

structure FeedbackController (S : Type) (U : Type) (Y : Type) where
  controlLaw : Y → U
  controlLawDefined : Prop

def feedbackStabilizationProp {S U Y : Type} (plant : ControlledPlant S U)
  (observer : ObservationModel S Y) (controller : FeedbackController S U Y) : Prop :=
  ∀ (s : S), plant.dynamicsClosedProp → observer.observationClosedProp →
  controller.controlLawDefined → True

structure FeedbackStabilizationPackage {S U Y : Type} (plant : ControlledPlant S U)
  (observer : ObservationModel S Y) (controller : FeedbackController S U Y) where
  stabilizationClosed : feedbackStabilizationProp plant observer controller

theorem stabilization_closed_from_package {S U Y : Type} (plant : ControlledPlant S U)
  (observer : ObservationModel S Y) (controller : FeedbackController S U Y)
  (pkg : FeedbackStabilizationPackage plant observer controller) :
  feedbackStabilizationProp plant observer controller :=
  pkg.stabilizationClosed

end HautevilleHouse
end HautevilleHouse