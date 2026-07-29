import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean.DiscreteTimeDynamics

namespace HautevilleHouse
namespace DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean

structure ObservabilityDecomposition {D : DiscreteTimeDynamics} where
  unobservableSubspace : Type u
  observableQuotient : Type v
  canonicalDecomposition : Prop
  observableSubspaceIsComplemented : Prop
  dualityWithControllability : Prop
  canonicalDecompositionTerm : canonicalDecomposition
  observableSubspaceIsComplementedTerm : observableSubspaceIsComplemented

def ObservabilityDecompositionClosed {D : DiscreteTimeDynamics}
    (O : ObservabilityDecomposition D) : Prop :=
  O.canonicalDecomposition ∧ O.observableSubspaceIsComplemented

theorem observability_decomposition_closed_from_evidence {D : DiscreteTimeDynamics}
    (O : ObservabilityDecomposition D) (E : O.canonicalDecomposition ∧ O.observableSubspaceIsComplemented) :
    ObservabilityDecompositionClosed O := by
  exact E

end DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean
end HautevilleHouse