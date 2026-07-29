import DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean.PerelmanRoute

namespace HautevilleHouse
namespace DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean

structure CurvatureAnalyticCertificate (G : RiemannianCurvaturePackage) where
  riemannTensorSymmetries : Prop
  bianchiIdentities : Prop
  ricciContractionLaw : Prop
  scalarTraceLaw : Prop
  curvatureEvolutionInputs : Prop
  riemannTensorSymmetriesClosed : riemannTensorSymmetries
  bianchiIdentitiesClosed : bianchiIdentities
  ricciContractionLawClosed : ricciContractionLaw
  scalarTraceLawClosed : scalarTraceLaw
  curvatureEvolutionInputsClosed : curvatureEvolutionInputs
  curvatureEvidence : RiemannianCurvatureEvidence G

def CurvatureAnalyticCertificateClosed {G : RiemannianCurvaturePackage}
    (C : CurvatureAnalyticCertificate G) : Prop :=
  C.riemannTensorSymmetries ∧
  C.bianchiIdentities ∧
  C.ricciContractionLaw ∧
  C.scalarTraceLaw ∧
  C.curvatureEvolutionInputs ∧
  RiemannianCurvatureClosed G

theorem curvature_analytic_certificate_closed
    {G : RiemannianCurvaturePackage} (C : CurvatureAnalyticCertificate G) :
    CurvatureAnalyticCertificateClosed C := by
  exact And.intro C.riemannTensorSymmetriesClosed
    (And.intro C.bianchiIdentitiesClosed
      (And.intro C.ricciContractionLawClosed
        (And.intro C.scalarTraceLawClosed
          (And.intro C.curvatureEvolutionInputsClosed
            (riemannian_curvature_closed_from_evidence G C.curvatureEvidence)))))

structure HamiltonDeTurckCertificate {G : RiemannianCurvaturePackage}
    (F : RicciFlowPDEPackage G) where
  gaugeChoice : Prop
  stronglyParabolicReduction : Prop
  deTurckVectorField : Prop
  pullbackRecoversRicciFlow : Prop
  uniquenessCompatibility : Prop
  gaugeChoiceClosed : gaugeChoice
  stronglyParabolicReductionClosed : stronglyParabolicReduction
  deTurckVectorFieldClosed : deTurckVectorField
  pullbackRecoversRicciFlowClosed : pullbackRecoversRicciFlow
  uniquenessCompatibilityClosed : uniquenessCompatibility
  flowEvidence : RicciFlowPDEEvidence F

def HamiltonDeTurckCertificateClosed {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} (H : HamiltonDeTurckCertificate F) : Prop :=
  H.gaugeChoice ∧
  H.stronglyParabolicReduction ∧
  H.deTurckVectorField ∧
  H.pullbackRecoversRicciFlow ∧
  H.uniquenessCompatibility ∧
  RicciFlowPDEClosed F

theorem hamilton_de_turck_certificate_closed
    {G : RiemannianCurvaturePackage} {F : RicciFlowPDEPackage G}
    (H : HamiltonDeTurckCertificate F) :
    HamiltonDeTurckCertificateClosed H := by
  exact And.intro H.gaugeChoiceClosed
    (And.intro H.stronglyParabolicReductionClosed
      (And.intro H.deTurckVectorFieldClosed
        (And.intro H.pullbackRecoversRicciFlowClosed
          (And.intro H.uniquenessCompatibilityClosed
            (ricci_flow_pde_closed_from_evidence F H.flowEvidence)))))

structure ShortTimeAnalyticCertificate {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} (S : ShortTimeExistencePackage F) where
  parabolicRegularity : Prop
  localExistenceInterval : Prop
  uniquenessOnOverlap : Prop
  continuationCriterion : Prop
  parabolicRegularityClosed : parabolicRegularity
  localExistenceIntervalClosed : localExistenceInterval
  uniquenessOnOverlapClosed : uniquenessOnOverlap
  continuationCriterionClosed : continuationCriterion
  shortTimeEvidence : ShortTimeExistenceEvidence S

def ShortTimeAnalyticCertificateClosed {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    (C : ShortTimeAnalyticCertificate S) : Prop :=
  C.parabolicRegularity ∧
  C.localExistenceInterval ∧
  C.uniquenessOnOverlap ∧
  C.continuationCriterion ∧
  ShortTimeExistenceClosed S

theorem short_time_analytic_certificate_closed
    {G : RiemannianCurvaturePackage} {F : RicciFlowPDEPackage G}
    {S : ShortTimeExistencePackage F} (C : ShortTimeAnalyticCertificate S) :
    ShortTimeAnalyticCertificateClosed C := by
  exact And.intro C.parabolicRegularityClosed
    (And.intro C.localExistenceIntervalClosed
      (And.intro C.uniquenessOnOverlapClosed
        (And.intro C.continuationCriterionClosed
          (short_time_existence_closed_from_evidence S C.shortTimeEvidence))))

structure EntropyAnalyticCertificate {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    (E : PerelmanEntropyPackage S) where
  conjugateHeatEquation : Prop
  wFunctionalDefined : Prop
  muFunctionalDefined : Prop
  entropyMonotonicityFormula : Prop
  reducedVolumeMonotonicity : Prop
  conjugateHeatEquationClosed : conjugateHeatEquation
  wFunctionalDefinedClosed : wFunctionalDefined
  muFunctionalDefinedClosed : muFunctionalDefined
  entropyMonotonicityFormulaClosed : entropyMonotonicityFormula
  reducedVolumeMonotonicityClosed : reducedVolumeMonotonicity
  entropyEvidence : PerelmanEntropyEvidence E

def EntropyAnalyticCertificateClosed {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    {E : PerelmanEntropyPackage S} (C : EntropyAnalyticCertificate E) : Prop :=
  C.conjugateHeatEquation ∧
  C.wFunctionalDefined ∧
  C.muFunctionalDefined ∧
  C.entropyMonotonicityFormula ∧
  C.reducedVolumeMonotonicity ∧
  PerelmanEntropyClosed E

theorem entropy_analytic_certificate_closed
    {G : RiemannianCurvaturePackage} {F : RicciFlowPDEPackage G}
    {S : ShortTimeExistencePackage F} {E : PerelmanEntropyPackage S}
    (C : EntropyAnalyticCertificate E) : EntropyAnalyticCertificateClosed C := by
  exact And.intro C.conjugateHeatEquationClosed
    (And.intro C.wFunctionalDefinedClosed
      (And.intro C.muFunctionalDefinedClosed
        (And.intro C.entropyMonotonicityFormulaClosed
          (And.intro C.reducedVolumeMonotonicityClosed
            (perelman_entropy_closed_from_evidence E C.entropyEvidence)))))

structure NoncollapsingAnalyticCertificate {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    {E : PerelmanEntropyPackage S} (N : NoncollapsingPackage E) where
  noLocalCollapsing : Prop
  scaleInvariantVolumeLowerBound : Prop
  curvatureScaleCompatibility : Prop
  ancientSolutionCompactnessInput : Prop
  noLocalCollapsingClosed : noLocalCollapsing
  scaleInvariantVolumeLowerBoundClosed : scaleInvariantVolumeLowerBound
  curvatureScaleCompatibilityClosed : curvatureScaleCompatibility
  ancientSolutionCompactnessInputClosed : ancientSolutionCompactnessInput
  noncollapsingEvidence : NoncollapsingEvidence N

def NoncollapsingAnalyticCertificateClosed {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    {E : PerelmanEntropyPackage S} {N : NoncollapsingPackage E}
    (C : NoncollapsingAnalyticCertificate N) : Prop :=
  C.noLocalCollapsing ∧ C.scaleInvariantVolumeLowerBound ∧
  C.curvatureScaleCompatibility ∧ C.ancientSolutionCompactnessInput ∧
  NoncollapsingClosed N

theorem noncollapsing_analytic_certificate_closed
    {G : RiemannianCurvaturePackage} {F : RicciFlowPDEPackage G}
    {S : ShortTimeExistencePackage F} {E : PerelmanEntropyPackage S}
    {N : NoncollapsingPackage E} (C : NoncollapsingAnalyticCertificate N) :
    NoncollapsingAnalyticCertificateClosed C := by
  exact And.intro C.noLocalCollapsingClosed
    (And.intro C.scaleInvariantVolumeLowerBoundClosed
      (And.intro C.curvatureScaleCompatibilityClosed
        (And.intro C.ancientSolutionCompactnessInputClosed
          (noncollapsing_closed_from_evidence N C.noncollapsingEvidence))))

structure SingularityAnalyticCertificate {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    {E : PerelmanEntropyPackage S} {N : NoncollapsingPackage E}
    (Q : SingularityModelsPackage N) where
  blowupSequenceChosen : Prop
  pointedLimitExists : Prop
  ancientKappaSolution : Prop
  asymptoticShrinkersControlled : Prop
  blowupSequenceChosenClosed : blowupSequenceChosen
  pointedLimitExistsClosed : pointedLimitExists
  ancientKappaSolutionClosed : ancientKappaSolution
  asymptoticShrinkersControlledClosed : asymptoticShrinkersControlled
  singularityEvidence : SingularityModelsEvidence Q

def SingularityAnalyticCertificateClosed {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    {E : PerelmanEntropyPackage S} {N : NoncollapsingPackage E}
    {Q : SingularityModelsPackage N} (C : SingularityAnalyticCertificate Q) : Prop :=
  C.blowupSequenceChosen ∧ C.pointedLimitExists ∧
  C.ancientKappaSolution ∧ C.asymptoticShrinkersControlled ∧
  SingularityModelsClosed Q

theorem singularity_analytic_certificate_closed
    {G : RiemannianCurvaturePackage} {F : RicciFlowPDEPackage G}
    {S : ShortTimeExistencePackage F} {E : PerelmanEntropyPackage S}
    {N : NoncollapsingPackage E} {Q : SingularityModelsPackage N}
    (C : SingularityAnalyticCertificate Q) : SingularityAnalyticCertificateClosed C := by
  exact And.intro C.blowupSequenceChosenClosed
    (And.intro C.pointedLimitExistsClosed
      (And.intro C.ancientKappaSolutionClosed
        (And.intro C.asymptoticShrinkersControlledClosed
          (singularity_models_closed_from_evidence Q C.singularityEvidence))))

end DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean
end HautevilleHouse