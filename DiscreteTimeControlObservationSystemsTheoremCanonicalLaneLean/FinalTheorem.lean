import DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean

def ConstrainedDiscreteTimeControlObservationSystemsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_discrete_time_control_observation_systems_endgame (A : AdmissibleClass) :
    ConstrainedDiscreteTimeControlObservationSystemsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean
end HautevilleHouse