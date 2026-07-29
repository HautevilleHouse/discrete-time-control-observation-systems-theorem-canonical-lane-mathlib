import DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean.PerelmanAnalyticProof

namespace HautevilleHouse
namespace DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean

structure CurvatureAnalyticEvidenceTerms {G : RiemannianCurvaturePackage}
    (C : CurvatureAnalyticCertificate G) where
  riemannTensorSymmetries : C.riemannTensorSymmetries
  bianchiIdentities : C.bianchiIdentities
  ricciContractionLaw : C.ricciContractionLaw
  scalarTraceLaw : C.scalarTraceLaw
  curvatureEvolutionInputs : C.curvatureEvolutionInputs
  curvatureClosed : RiemannianCurvatureClosed G

def CurvatureAnalyticCertificate.evidenceTerms {G : RiemannianCurvaturePackage}
    (C : CurvatureAnalyticCertificate G) : CurvatureAnalyticEvidenceTerms C :=
  {
    riemannTensorSymmetries := C.riemannTensorSymmetriesClosed
    bianchiIdentities := C.bianchiIdentitiesClosed
    ricciContractionLaw := C.ricciContractionLawClosed
    scalarTraceLaw := C.scalarTraceLawClosed
    curvatureEvolutionInputs := C.curvatureEvolutionInputsClosed
    curvatureClosed := riemannian_curvature_closed_from_evidence G C.curvatureEvidence
  }

structure HamiltonDeTurckEvidenceTerms {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} (H : HamiltonDeTurckCertificate F) where
  gaugeChoice : H.gaugeChoice
  stronglyParabolicReduction : H.stronglyParabolicReduction
  deTurckVectorField : H.deTurckVectorField
  pullbackRecoversRicciFlow : H.pullbackRecoversRicciFlow
  uniquenessCompatibility : H.uniquenessCompatibility
  flowClosed : RicciFlowPDEClosed F

def HamiltonDeTurckCertificate.evidenceTerms {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} (H : HamiltonDeTurckCertificate F) :
    HamiltonDeTurckEvidenceTerms H :=
  {
    gaugeChoice := H.gaugeChoiceClosed
    stronglyParabolicReduction := H.stronglyParabolicReductionClosed
    deTurckVectorField := H.deTurckVectorFieldClosed
    pullbackRecoversRicciFlow := H.pullbackRecoversRicciFlowClosed
    uniquenessCompatibility := H.uniquenessCompatibilityClosed
    flowClosed := ricci_flow_pde_closed_from_evidence F H.flowEvidence
  }

structure ShortTimeEvidenceTerms {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    (C : ShortTimeAnalyticCertificate S) where
  parabolicRegularity : C.parabolicRegularity
  localExistenceInterval : C.localExistenceInterval
  uniquenessOnOverlap : C.uniquenessOnOverlap
  continuationCriterion : C.continuationCriterion
  shortTimeClosed : ShortTimeExistenceClosed S

def ShortTimeAnalyticCertificate.evidenceTerms {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    (C : ShortTimeAnalyticCertificate S) : ShortTimeEvidenceTerms C :=
  {
    parabolicRegularity := C.parabolicRegularityClosed
    localExistenceInterval := C.localExistenceIntervalClosed
    uniquenessOnOverlap := C.uniquenessOnOverlapClosed
    continuationCriterion := C.continuationCriterionClosed
    shortTimeClosed := short_time_existence_closed_from_evidence S C.shortTimeEvidence
  }

structure EntropyEvidenceTerms {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    {E : PerelmanEntropyPackage S} (C : EntropyAnalyticCertificate E) where
  conjugateHeatEquation : C.conjugateHeatEquation
  wFunctionalDefined : C.wFunctionalDefined
  muFunctionalDefined : C.muFunctionalDefined
  entropyMonotonicityFormula : C.entropyMonotonicityFormula
  reducedVolumeMonotonicity : C.reducedVolumeMonotonicity
  entropyClosed : PerelmanEntropyClosed E

def EntropyAnalyticCertificate.evidenceTerms {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    {E : PerelmanEntropyPackage S} (C : EntropyAnalyticCertificate E) :
    EntropyEvidenceTerms C :=
  {
    conjugateHeatEquation := C.conjugateHeatEquationClosed
    wFunctionalDefined := C.wFunctionalDefinedClosed
    muFunctionalDefined := C.muFunctionalDefinedClosed
    entropyMonotonicityFormula := C.entropyMonotonicityFormulaClosed
    reducedVolumeMonotonicity := C.reducedVolumeMonotonicityClosed
    entropyClosed := perelman_entropy_closed_from_evidence E C.entropyEvidence
  }

structure NoncollapsingEvidenceTerms {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    {E : PerelmanEntropyPackage S} {N : NoncollapsingPackage E}
    (C : NoncollapsingAnalyticCertificate N) where
  noLocalCollapsing : C.noLocalCollapsing
  scaleInvariantVolumeLowerBound : C.scaleInvariantVolumeLowerBound
  curvatureScaleCompatibility : C.curvatureScaleCompatibility
  ancientSolutionCompactnessInput : C.ancientSolutionCompactnessInput
  noncollapsingClosed : NoncollapsingClosed N

def NoncollapsingAnalyticCertificate.evidenceTerms {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    {E : PerelmanEntropyPackage S} {N : NoncollapsingPackage E}
    (C : NoncollapsingAnalyticCertificate N) : NoncollapsingEvidenceTerms C :=
  {
    noLocalCollapsing := C.noLocalCollapsingClosed
    scaleInvariantVolumeLowerBound := C.scaleInvariantVolumeLowerBoundClosed
    curvatureScaleCompatibility := C.curvatureScaleCompatibilityClosed
    ancientSolutionCompactnessInput := C.ancientSolutionCompactnessInputClosed
    noncollapsingClosed := noncollapsing_closed_from_evidence N C.noncollapsingEvidence
  }

structure SingularityEvidenceTerms {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    {E : PerelmanEntropyPackage S} {N : NoncollapsingPackage E}
    {Q : SingularityModelsPackage N} (C : SingularityAnalyticCertificate Q) where
  blowupSequenceChosen : C.blowupSequenceChosen
  pointedLimitExists : C.pointedLimitExists
  ancientKappaSolution : C.ancientKappaSolution
  asymptoticShrinkersControlled : C.asymptoticShrinkersControlled
  singularityModelsClosed : SingularityModelsClosed Q

def SingularityAnalyticCertificate.evidenceTerms {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    {E : PerelmanEntropyPackage S} {N : NoncollapsingPackage E}
    {Q : SingularityModelsPackage N} (C : SingularityAnalyticCertificate Q) :
    SingularityEvidenceTerms C :=
  {
    blowupSequenceChosen := C.blowupSequenceChosenClosed
    pointedLimitExists := C.pointedLimitExistsClosed
    ancientKappaSolution := C.ancientKappaSolutionClosed
    asymptoticShrinkersControlled := C.asymptoticShrinkersControlledClosed
    singularityModelsClosed := singularity_models_closed_from_evidence Q C.singularityEvidence
  }

structure CanonicalNeighborhoodEvidenceTerms {G : RiemannianCurvaturePackage}
    {F : RicciFlowPDEPackage G} {S : ShortTimeExistencePackage F}
    {E : PerelmanEntropyPackage S} {N : NoncollapsingPackage E}
    {Q : SingularityModelsPackage N} {C : CanonicalNeighborhoodsPackage Q}
    (P : CanonicalNeighborhoodAnalyticCertificate C) where
  highCurvaturePointClassified : P.highCurvaturePointClassified
  neckCapOrRoundComponent : P.neckCapOrRoundComponent
  surgeryScaleAdmissible : P.surgeryScaleAdmissible

end DiscreteTimeControlObservationSystemsTheoremCanonicalLaneLean
end HautevilleHouse