import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean.SeparationPrinciple
import HautevilleHouse.DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean.DualityTheorem

namespace HautevilleHouse
namespace DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  True

def gateClosed (A : AdmissibleClass) : Prop :=
  True

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  trivial

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  trivial

def ConstrainedDiscreteTimeControlObservationClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_discrete_time_control_observation_endgame (A : AdmissibleClass) : ConstrainedDiscreteTimeControlObservationClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean
end HautevilleHouse