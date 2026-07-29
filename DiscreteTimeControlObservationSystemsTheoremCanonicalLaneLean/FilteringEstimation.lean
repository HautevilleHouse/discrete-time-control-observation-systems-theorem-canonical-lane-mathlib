import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean

structure FilteringEstimationPackage {S : DiscreteTimeStateSpacePackage}
    {O : ObservationModelPackage S} {C : ControlPolicyPackage S O} where
  filterUpdateRule : Prop
  predictionStep : Prop
  correctionStep : Prop
  optimalityProperty : Prop
  convergenceCondition : Prop
  numericalStability : Prop

structure FilteringEstimationEvidence {S : DiscreteTimeStateSpacePackage}
    {O : ObservationModelPackage S} {C : ControlPolicyPackage S O}
    (F : FilteringEstimationPackage S O C) where
  filterUpdateRuleClosed : F.filterUpdateRule
  predictionStepClosed : F.predictionStep
  correctionStepClosed : F.correctionStep
  optimalityPropertyClosed : F.optimalityProperty
  convergenceConditionClosed : F.convergenceCondition
  numericalStabilityClosed : F.numericalStability

def FilteringEstimationClosed {S : DiscreteTimeStateSpacePackage}
    {O : ObservationModelPackage S} {C : ControlPolicyPackage S O}
    (F : FilteringEstimationPackage S O C) : Prop :=
  F.filterUpdateRule ∧ F.predictionStep ∧ F.correctionStep ∧
  F.optimalityProperty ∧ F.convergenceCondition ∧ F.numericalStability

theorem filtering_estimation_closed_from_evidence
    {S : DiscreteTimeStateSpacePackage} {O : ObservationModelPackage S}
    {C : ControlPolicyPackage S O} (F : FilteringEstimationPackage S O C)
    (E : FilteringEstimationEvidence F) : FilteringEstimationClosed F := by
  exact And.intro E.filterUpdateRuleClosed
    (And.intro E.predictionStepClosed
      (And.intro E.correctionStepClosed
        (And.intro E.optimalityPropertyClosed
          (And.intro E.convergenceConditionClosed E.numericalStabilityClosed))))

end DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean
end HautevilleHouse