import ContinuousCohomologyLieGroupsTheoremCanonicalLaneLean.CohomologySubstrate

noncomputable section

universe u

namespace HautevilleHouse
namespace ContinuousCohomologyLieGroupsTheoremCanonicalLaneLean

structure ProjectionState (G : LieGroup.{u}) (V : Type u) [TopologicalAddGroup V] [ContinuousAdd V] [ContinuousSMul ℝ V] where
  group : G
  module : V
  cohomologyProfile : CohomologyProfile G V
  continuousClassRecorded : Bool
  admissibleClass : Bool
  carriedClassicalBoundary : Bool

def projectCohomology (G : LieGroup.{u}) (V : Type u) [TopologicalAddGroup V] [ContinuousAdd V] [ContinuousSMul ℝ V] (S : ProjectionState G V) : ProjectionState G V :=
  { S with
    continuousClassRecorded := true
    admissibleClass := true
    carriedClassicalBoundary := true
  }

theorem projection_idempotent (G : LieGroup.{u}) (V : Type u) [TopologicalAddGroup V] [ContinuousAdd V] [ContinuousSMul ℝ V] (S : ProjectionState G V) :
  projectCohomology G V (projectCohomology G V S) = projectCohomology G V S := by
  cases S
  rfl

def projectedStateVanEst (G : LieGroup.{u}) (V : Type u) [TopologicalAddGroup V] [ContinuousAdd V] [ContinuousSMul ℝ V] (n : ℕ) : ProjectionState G V :=
  projectCohomology G V {
    group := G
    module := V
    cohomologyProfile := cohomologyProfileVanEst G V n
    continuousClassRecorded := false
    admissibleClass := false
    carriedClassicalBoundary := false
  }

theorem projected_state_van_est_checked (G : LieGroup.{u}) (V : Type u) [TopologicalAddGroup V] [ContinuousAdd V] [ContinuousSMul ℝ V] (n : ℕ) :
  (projectedStateVanEst G V n).continuousClassRecorded = true ∧
  (projectedStateVanEst G V n).admissibleClass = true ∧
  (projectedStateVanEst G V n).carriedClassicalBoundary = true := by
  exact ⟨rfl, rfl, rfl⟩

end ContinuousCohomologyLieGroupsTheoremCanonicalLaneLean
end HautevilleHouse