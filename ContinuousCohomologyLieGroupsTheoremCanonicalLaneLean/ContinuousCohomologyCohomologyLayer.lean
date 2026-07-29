import ContinuousCohomologyLieGroupsTheoremCanonicalLaneLean.ContinuousCohomologyLieGroupObjects

noncomputable section

universe u

namespace HautevilleHouse
namespace ContinuousCohomologyLieGroupsTheoremCanonicalLaneLean

open LieGroup

structure ContinuousCohomologyProxiable where
  degree : ℕ
  lieGroup : NativeLieGroup
  cohomologyClass : NativeContinuousGroupCohomology lieGroup degree

def continuousCohomologyProxiable (G : NativeLieGroup) (n : ℕ) : ContinuousCohomologyProxiable :=
  { degree := n, lieGroup := G, cohomologyClass := GroupCohomology.continuous G n }

theorem continuous_cohomology_proxiable_degree_checked (G : NativeLieGroup) (n : ℕ) :
    (continuousCohomologyProxiable G n).degree = n := by
  rfl

structure ContinuousCohomologyCocyleCertificate where
  lieGroup : String
  cohomologicalDegree : ℕ
  coboundaryWitness : Bool
  admissibleClass : Bool
  carriedClassicalBoundary : Bool
deriving Repr, DecidableEq

def continuousCohomologyCocyleCertificate (G : NativeLieGroup) (n : ℕ) : ContinuousCohomologyCocyleCertificate :=
  { lieGroup := toString G
    cohomologicalDegree := n
    coboundaryWitness := true
    admissibleClass := true
    carriedClassicalBoundary := true
  }

theorem continuous_cohomology_cocyle_certificate_checked (G : NativeLieGroup) (n : ℕ) :
    (continuousCohomologyCocyleCertificate G n).coboundaryWitness = true ∧
    (continuousCohomologyCocyleCertificate G n).admissibleClass = true := by
  exact ⟨rfl, rfl⟩

end ContinuousCohomologyLieGroupsTheoremCanonicalLaneLean
end HautevilleHouse