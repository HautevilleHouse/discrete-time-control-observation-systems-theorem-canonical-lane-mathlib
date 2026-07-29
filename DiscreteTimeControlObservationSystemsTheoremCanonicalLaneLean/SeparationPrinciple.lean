import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean

structure SeparationPrinciplePackage {S : DiscreteTimeStateSpacePackage}
    {O : ObservationModelPackage S} {C : ControlPolicyPackage S O}
    {F : FilteringEstimationPackage S O C} where
  estimatedState : Type u
  certaintyEquivalence : Prop
  optimalControlSeparated : Prop
  separationTheorem : Prop
  stabilityUnderModelMismatch : Prop

structure SeparationPrincipleEvidence {S : DiscreteTimeStateSpacePackage}
    {O : ObservationModelPackage S} {C : ControlPolicyPackage S O}
    {F : FilteringEstimationPackage S O C}
    (P : SeparationPrinciplePackage S O C F) where
  estimatedStateDefined : True
  certaintyEquivalenceClosed : P.certaintyEquivalence
  optimalControlSeparatedClosed : P.optimalControlSeparated
  separationTheoremClosed : P.separationTheorem
  stabilityUnderModelMismatchClosed : P.stabilityUnderModelMismatch

def SeparationPrincipleClosed {S : DiscreteTimeStateSpacePackage}
    {O : ObservationModelPackage S} {C : ControlPolicyPackage S O}
    {F : FilteringEstimationPackage S O C}
    (P : SeparationPrinciplePackage S O C F) : Prop :=
  P.certaintyEquivalence ∧ P.optimalControlSeparated ∧
  P.separationTheorem ∧ P.stabilityUnderModelMismatch

theorem separation_principle_closed_from_evidence
    {S : DiscreteTimeStateSpacePackage} {O : ObservationModelPackage S}
    {C : ControlPolicyPackage S O} {F : FilteringEstimationPackage S O C}
    (P : SeparationPrinciplePackage S O C F)
    (E : SeparationPrincipleEvidence P) : SeparationPrincipleClosed P := by
  exact And.intro E.certaintyEquivalenceClosed
    (And.intro E.optimalControlSeparatedClosed
      (And.intro E.separationTheoremClosed E.stabilityUnderModelMismatchClosed))

end DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean
end HautevilleHouse