import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean.ControlledPlant

namespace HautevilleHouse
namespace DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean

structure CostFunctional (S : Type) (U : Type) where
  stageCost : S → U → ℝ
  terminalCost : S → ℝ
  costDefined : Prop
  costClosedProp : Prop

def costClosed {S U : Type} (cost : CostFunctional S U) : Prop :=
  cost.costClosedProp

theorem cost_closed_from_evidence {S U : Type} (cost : CostFunctional S U)
  (h : cost.costClosedProp) : costClosed cost :=
  h

structure OptimalControlPolicy {S U : Type} (plant : ControlledPlant S U)
  (cost : CostFunctional S U) where
  optimalCost : ℝ
  policyExists : Prop
  policyClosedProp : Prop

def policyClosed {S U : Type} (plant : ControlledPlant S U) (cost : CostFunctional S U)
  (policy : OptimalControlPolicy plant cost) : Prop :=
  policy.policyClosedProp

theorem policy_closed_from_evidence {S U : Type} (plant : ControlledPlant S U)
  (cost : CostFunctional S U) (policy : OptimalControlPolicy plant cost)
  (h : policy.policyClosedProp) : policyClosed plant cost policy :=
  h

end HautevilleHouse
end HautevilleHouse