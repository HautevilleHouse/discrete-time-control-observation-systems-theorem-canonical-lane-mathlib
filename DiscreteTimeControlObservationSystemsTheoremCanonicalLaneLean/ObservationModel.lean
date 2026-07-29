import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean

structure ObservationModelPackage {S : DiscreteTimeStateSpacePackage} where
  observationSpace : Type u
  observationTopology : TopologicalSpace observationSpace
  observationFunction : S.stateSpace → observationSpace
  noiseModel : Prop
  conditionalIndependence : Prop
  observabilityCondition : Prop

structure ObservationModelEvidence {S : DiscreteTimeStateSpacePackage} (O : ObservationModelPackage S) where
  noiseModelClosed : O.noiseModel
  conditionalIndependenceClosed : O.conditionalIndependence
  observabilityConditionClosed : O.observabilityCondition

def ObservationModelClosed {S : DiscreteTimeStateSpacePackage} (O : ObservationModelPackage S) : Prop :=
  O.noiseModel ∧ O.conditionalIndependence ∧ O.observabilityCondition

theorem observation_model_closed_from_evidence
    {S : DiscreteTimeStateSpacePackage} (O : ObservationModelPackage S)
    (E : ObservationModelEvidence O) : ObservationModelClosed O := by
  exact And.intro E.noiseModelClosed
    (And.intro E.conditionalIndependenceClosed E.observabilityConditionClosed)

end DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean
end HautevilleHouse