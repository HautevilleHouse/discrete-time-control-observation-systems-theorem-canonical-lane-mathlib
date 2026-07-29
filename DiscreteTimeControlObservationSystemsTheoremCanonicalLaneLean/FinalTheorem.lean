import canonicalLaneMathlib.AdmissibleClass
import DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean.ObservationBridge
import DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean.DiscreteTimeDynamics

namespace HautevilleHouse
namespace DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean

def ConstrainedDiscreteTimeControlObservationClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_discrete_time_control_observation_endgame (A : AdmissibleClass) :
    ConstrainedDiscreteTimeControlObservationClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean
end HautevilleHouse
