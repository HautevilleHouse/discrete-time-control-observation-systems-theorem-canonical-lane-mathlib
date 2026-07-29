import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean.DiscreteTimeSystemModel

namespace HautevilleHouse
namespace DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean

structure StabilizabilityPackage {sys : DiscreteTimeSystem} where
  stabilizableCondition : Prop
  stabilizingControl : sys.ControlSpace → sys.ControlSpace
  stabilizabilityTheorem : Prop

structure StabilizabilityEvidence {sys : DiscreteTimeSystem} (S : StabilizabilityPackage) where
  stabilizableConditionClosed : S.stabilizableCondition
  stabilizingControlDefined : S.stabilizingControl = S.stabilizingControl
  stabilizabilityTheoremClosed : S.stabilizabilityTheorem

def StabilizabilityClosed {sys : DiscreteTimeSystem} (S : StabilizabilityPackage) : Prop :=
  S.stabilizableCondition ∧ S.stabilizabilityTheorem

theorem stabilizability_closed_from_evidence {sys : DiscreteTimeSystem} (S : StabilizabilityPackage) (E : StabilizabilityEvidence S) : StabilizabilityClosed S := by
  exact And.intro E.stabilizableConditionClosed E.stabilizabilityTheoremClosed

structure DetectabilityPackage {sys : DiscreteTimeSystem} where
  detectableCondition : Prop
  detectabilityTheorem : Prop

structure DetectabilityEvidence {sys : DiscreteTimeSystem} (D : DetectabilityPackage) where
  detectableConditionClosed : D.detectableCondition
  detectabilityTheoremClosed : D.detectabilityTheorem

def DetectabilityClosed {sys : DiscreteTimeSystem} (D : DetectabilityPackage) : Prop :=
  D.detectableCondition ∧ D.detectabilityTheorem

theorem detectability_closed_from_evidence {sys : DiscreteTimeSystem} (D : DetectabilityPackage) (E : DetectabilityEvidence D) : DetectabilityClosed D := by
  exact And.intro E.detectableConditionClosed E.detectabilityTheoremClosed

end DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean
end HautevilleHouse