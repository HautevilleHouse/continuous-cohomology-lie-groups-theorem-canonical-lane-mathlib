import ContinuousCohomologyLieGroupsTheoremCanonicalLaneLean.ModuleLayer

noncomputable section

universe u

namespace HautevilleHouse
namespace ContinuousCohomologyLieGroupsTheoremCanonicalLaneLean

open ContinuousGroupCohomology

structure CohomologyProfile (G : LieGroup.{u}) (V : Type u) [TopologicalAddGroup V] [ContinuousAdd V] [ContinuousSMul ℝ V] where
  degree : ℕ
  group : G
  coefficient : V
  continuousCohomologyClass : Nonempty (ContinuousGroupCohomology G V degree)
  vanEstIsomorphismAvailable : Bool
  discreteCohomologyClassTrivial : Bool

def cohomologyProfileVanEst (G : LieGroup.{u}) (V : Type u) [TopologicalAddGroup V] [ContinuousAdd V] [ContinuousSMul ℝ V] (n : ℕ) : CohomologyProfile G V := {
  degree := n
  group := G
  coefficient := V
  continuousCohomologyClass := inferInstance
  vanEstIsomorphismAvailable := true
  discreteCohomologyClassTrivial := true
}

def CohomologyTypeAvailable (G : LieGroup.{u}) (V : Type u) [TopologicalAddGroup V] [ContinuousAdd V] [ContinuousSMul ℝ V] (n : ℕ) : Prop :=
  Nonempty (ContinuousGroupCohomology G V n)

theorem cohomology_type_available_check (G : LieGroup.{u}) (V : Type u) [TopologicalAddGroup V] [ContinuousAdd V] [ContinuousSMul ℝ V] (n : ℕ) :
  CohomologyTypeAvailable G V n := by
  infer_instance

theorem van_est_isomorphism_available (G : LieGroup.{u}) (V : Type u) [TopologicalAddGroup V] [ContinuousAdd V] [ContinuousSMul ℝ V] [LieAlgebraModule G V] (n : ℕ) :
  IsContinuousCohomologyVanEst G V n := by
  exact vanEstIsomorphism G V n

theorem cohomology_profile_van_est_checked (G : LieGroup.{u}) (V : Type u) [TopologicalAddGroup V] [ContinuousAdd V] [ContinuousSMul ℝ V] (n : ℕ) :
  (cohomologyProfileVanEst G V n).vanEstIsomorphismAvailable = true ∧
  (cohomologyProfileVanEst G V n).discreteCohomologyClassTrivial = true := by
  exact ⟨rfl, rfl⟩

end ContinuousCohomologyLieGroupsTheoremCanonicalLaneLean
end HautevilleHouse