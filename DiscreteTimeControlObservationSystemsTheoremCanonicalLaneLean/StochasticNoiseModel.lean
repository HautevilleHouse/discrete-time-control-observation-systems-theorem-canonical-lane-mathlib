import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean.DiscreteTimeDynamics

namespace HautevilleHouse
namespace DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean

structure StochasticNoiseModel {D : DiscreteTimeDynamics} where
  processNoise : Type u
  measurementNoise : Type v
  covarianceStructure : Prop
  noiseIndependence : Prop
  gaussianAssumption : Prop
  covarianceStructureTerm : covarianceStructure
  noiseIndependenceTerm : noiseIndependence

structure StochasticNoiseEvidence {D : DiscreteTimeDynamics}
    (N : StochasticNoiseModel D) where
  covarianceStructureClosed : N.covarianceStructure
  noiseIndependenceClosed : N.noiseIndependence

def StochasticNoiseClosed {D : DiscreteTimeDynamics}
    (N : StochasticNoiseModel D) : Prop :=
  N.covarianceStructure ∧ N.noiseIndependence

theorem stochastic_noise_closed_from_evidence {D : DiscreteTimeDynamics}
    (N : StochasticNoiseModel D) (E : StochasticNoiseEvidence N) :
    StochasticNoiseClosed N := by
  exact And.intro E.covarianceStructureClosed E.noiseIndependenceClosed

end DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean
end HautevilleHouse