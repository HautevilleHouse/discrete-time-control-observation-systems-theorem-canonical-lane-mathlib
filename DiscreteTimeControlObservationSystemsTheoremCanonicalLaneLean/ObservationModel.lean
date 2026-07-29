import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean

structure ObservationModel (S : Type) (Y : Type) where
  observationSpace : Type w
  observationFunction : S → Y
  observationEquality : ∀ (y1 y2 : Y), y1 = y2
  observationDefined : Prop
  observationClosedProp : Prop

def observationClosed {S Y : Type} (model : ObservationModel S Y) : Prop :=
  model.observationClosedProp

theorem observation_closed_from_evidence {S Y : Type} (model : ObservationModel S Y)
  (h : model.observationClosedProp) : observationClosed model :=
  h

end HautevilleHouse
end HautevilleHouse