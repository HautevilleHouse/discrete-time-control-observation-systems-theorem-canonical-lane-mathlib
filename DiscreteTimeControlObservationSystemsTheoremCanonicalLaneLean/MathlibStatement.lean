import DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean.FinalTheorem
import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean

open canonicalLaneMathlib.AdmissibleClass

structure MathlibProofObligation where
  sourceKey : String
  theoremObject : String
  commonCoreImported : Bool
  theoremSpecificDefinitionsNative : Bool
  theoremSpecificBridgeNative : Bool
  theoremSpecificAdmittedClosureNative : Bool
  unrestrictedClassicalClosureNative : Bool
  carriedGap : String

def mathlibProofObligation : MathlibProofObligation := {
  sourceKey := "DiscreteTimeControlObservationSystemsTheorem",
  theoremObject := "AdmissibleClass closure",
  commonCoreImported := true,
  theoremSpecificDefinitionsNative := true,
  theoremSpecificBridgeNative := true,
  theoremSpecificAdmittedClosureNative := true,
  unrestrictedClassicalClosureNative := false,
  carriedGap := "theorem-specific Mathlib endgame pilot closes over the admitted class; unrestricted classical closure remains carried"
}

def theoremSpecificEndgamePilotClosed : Prop :=
  forall A : AdmissibleClass, ConstrainedTheoremClosure A

theorem theorem_specific_endgame_pilot_checked :
    theoremSpecificEndgamePilotClosed := by
  intro A
  exact constrained_theorem_closure A

end DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean
end HautevilleHouse