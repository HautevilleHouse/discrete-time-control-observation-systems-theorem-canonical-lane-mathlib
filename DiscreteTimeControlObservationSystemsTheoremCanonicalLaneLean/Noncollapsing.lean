import DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean.PerelmanEntropy

namespace HautevilleHouse
namespace DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean

structure NoncollapsingPackage {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} (S : ShortTimeExistencePackage F) where
  scaleInvariantVolumeBound : Prop
  curvatureScaleControl : Prop
  blowupLimitNoncollapsed : Prop

structure NoncollapsingEvidence {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    (N : NoncollapsingPackage S) where
  scaleInvariantVolumeBoundClosed : N.scaleInvariantVolumeBound
  curvatureScaleControlClosed : N.curvatureScaleControl
  blowupLimitNoncollapsedClosed : N.blowupLimitNoncollapsed

def NoncollapsingClosed {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    (N : NoncollapsingPackage S) : Prop :=
  N.scaleInvariantVolumeBound ∧ N.curvatureScaleControl ∧ N.blowupLimitNoncollapsed

theorem noncollapsing_closed_from_evidence
    {G : RiemannianCurvaturePackage} {F : RicciFlowPDEPackage G}
    {S : ShortTimeExistencePackage F}
    (N : NoncollapsingPackage S) (E : NoncollapsingEvidence N) :
    NoncollapsingClosed N := by
  exact And.intro E.scaleInvariantVolumeBoundClosed
    (And.intro E.curvatureScaleControlClosed E.blowupLimitNoncollapsedClosed)

end DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean
end HautevilleHouse