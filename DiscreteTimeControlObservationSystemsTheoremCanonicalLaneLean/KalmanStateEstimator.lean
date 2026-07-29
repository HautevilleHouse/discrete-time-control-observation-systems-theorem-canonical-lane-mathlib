import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean.DiscreteTimeDynamics
import HautevilleHouse.DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean.ControllabilityGramian
import HautevilleHouse.DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean.ObservabilityDecomposition

namespace HautevilleHouse
namespace DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean

structure KalmanStateEstimator {D : DiscreteTimeDynamics}
    {G : ControllabilityGramian D} {O : ObservabilityDecomposition D} where
  predictionStep : D.stateSpace → D.stateSpace
  updateStep : D.stateSpace → D.observationSpace → D.stateSpace
  optimalGain : Type u
  estimationErrorCovariance : Prop
  convergenceCondition : Prop
  estimationErrorCovarianceTerm : estimationErrorCovariance
  convergenceConditionTerm : convergenceCondition

structure KalmanEstimatorEvidence {D : DiscreteTimeDynamics}
    {G : ControllabilityGramian D} {O : ObservabilityDecomposition D}
    (K : KalmanStateEstimator D G O) where
  estimationErrorCovarianceClosed : K.estimationErrorCovariance
  convergenceConditionClosed : K.convergenceCondition

def KalmanEstimatorClosed {D : DiscreteTimeDynamics}
    {G : ControllabilityGramian D} {O : ObservabilityDecomposition D}
    (K : KalmanStateEstimator D G O) : Prop :=
  K.estimationErrorCovariance ∧ K.convergenceCondition

theorem kalman_estimator_closed_from_evidence {D : DiscreteTimeDynamics}
    {G : ControllabilityGramian D} {O : ObservabilityDecomposition D}
    (K : KalmanStateEstimator D G O) (E : KalmanEstimatorEvidence K) :
    KalmanEstimatorClosed K := by
  exact And.intro E.estimationErrorCovarianceClosed E.convergenceConditionClosed

end DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean
end HautevilleHouse