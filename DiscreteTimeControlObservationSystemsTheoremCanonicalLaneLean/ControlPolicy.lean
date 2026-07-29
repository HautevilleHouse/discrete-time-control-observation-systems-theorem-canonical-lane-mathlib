import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean

structure ControlPolicyPackage {S : DiscreteTimeStateSpacePackage} {O : ObservationModelPackage S} where
  controlSpace : Type u
  controlTopology : TopologicalSpace controlSpace
  policyFunction : O.observationSpace → controlSpace
  admissibleControl : Prop
  boundedControl : Prop
  feedbackStructure : Prop

structure ControlPolicyEvidence {S : DiscreteTimeStateSpacePackage} {O : ObservationModelPackage S}
    (C : ControlPolicyPackage S O) where
  admissibleControlClosed : C.admissibleControl
  boundedControlClosed : C.boundedControl
  feedbackStructureClosed : C.feedbackStructure

def ControlPolicyClosed {S : DiscreteTimeStateSpacePackage} {O : ObservationModelPackage S}
    (C : ControlPolicyPackage S O) : Prop :=
  C.admissibleControl ∧ C.boundedControl ∧ C.feedbackStructure

theorem control_policy_closed_from_evidence
    {S : DiscreteTimeStateSpacePackage} {O : ObservationModelPackage S}
    (C : ControlPolicyPackage S O) (E : ControlPolicyEvidence C) :
    ControlPolicyClosed C := by
  exact And.intro E.admissibleControlClosed
    (And.intro E.boundedControlClosed E.feedbackStructureClosed)

end DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean
end HautevilleHouse