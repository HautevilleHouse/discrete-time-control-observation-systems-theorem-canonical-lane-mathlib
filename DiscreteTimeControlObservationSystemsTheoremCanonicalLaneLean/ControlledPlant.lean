import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean

structure ControlledPlant (S : Type) (U : Type) where
  stateSpace : Type u
  controlSpace : Type v
  dynamics : S → U → S
  initialState : S
  stateEquality : ∀ (s1 s2 : S), s1 = s2
  controlEquality : ∀ (u1 u2 : U), u1 = u2
  stateTransitionDefined : Prop
  dynamicsClosedProp : Prop

def dynamicsClosed {S U : Type} (plant : ControlledPlant S U) : Prop :=
  plant.dynamicsClosedProp

theorem dynamics_closed_from_evidence {S U : Type} (plant : ControlledPlant S U)
  (h : plant.dynamicsClosedProp) : dynamicsClosed plant :=
  h

end HautevilleHouse
end HautevilleHouse