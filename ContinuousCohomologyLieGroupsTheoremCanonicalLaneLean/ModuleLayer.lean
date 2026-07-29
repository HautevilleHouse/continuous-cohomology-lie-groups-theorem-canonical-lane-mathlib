import ContinuousCohomologyLieGroupsTheoremCanonicalLaneLean.LieGroupObjects

noncomputable section

universe u

namespace HautevilleHouse
namespace ContinuousCohomologyLieGroupsTheoremCanonicalLaneLean

structure ModuleStructure (V : Type u) [TopologicalAddGroup V] [ContinuousAdd V] [ContinuousSMul ℝ V] where
  groupAction : LieGroup.{u} → V → V
  actionContinuous : Continuous (Function.uncurry groupAction)
  actionLinear : ∀ (g : LieGroup.{u}) (v₁ v₂ : V), groupAction g (v₁ + v₂) = groupAction g v₁ + groupAction g v₂
  actionScalar : ∀ (g : LieGroup.{u}) (c : ℝ) (v : V), groupAction g (c • v) = c • groupAction g v

structure ContinuousModuleData (V : Type u) [TopologicalAddGroup V] [ContinuousAdd V] [ContinuousSMul ℝ V] where
  module : ModuleStructure V
  continuousCohomologyClass : Bool
  trivialAction : Bool
  admissibleModule : Bool

def trivialContinuousModule (V : Type u) [TopologicalAddGroup V] [ContinuousAdd V] [ContinuousSMul ℝ V] : ContinuousModuleData V := {
  module := {
    groupAction := λ _ v => v
    actionContinuous := by
      refine continuous_id.comp continuous_snd
    actionLinear := λ g v₁ v₂ => rfl
    actionScalar := λ g c v => rfl
  }
  continuousCohomologyClass := true
  trivialAction := true
  admissibleModule := true
}

theorem trivial_module_admissible (V : Type u) [TopologicalAddGroup V] [ContinuousAdd V] [ContinuousSMul ℝ V] :
  (trivialContinuousModule V).admissibleModule := by
  rfl

def ModuleRouteState (V : Type u) [TopologicalAddGroup V] [ContinuousAdd V] [ContinuousSMul ℝ V] where
  moduleAvailable : Bool
  actionRecorded : Bool
  cohomologyClassComputed : Bool
  carriedClassicalBoundary : Bool

def moduleRouteInitial (V : Type u) [TopologicalAddGroup V] [ContinuousAdd V] [ContinuousSMul ℝ V] : ModuleRouteState V := {
  moduleAvailable := true,
  actionRecorded := true,
  cohomologyClassComputed := false,
  carriedClassicalBoundary := false
}

end ContinuousCohomologyLieGroupsTheoremCanonicalLaneLean
end HautevilleHouse