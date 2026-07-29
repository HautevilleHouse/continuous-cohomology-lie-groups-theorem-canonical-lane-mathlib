import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousCohomologyLieGroupsTheoremCanonicalLaneLean

structure LieGroup where
  underlying : Type
  smoothStructure : String
  multiplication : underlying → underlying → underlying
  inverse : underlying → underlying
  identity : underlying

default instance : Inhabited LieGroup where
  default := { underlying := Unit, smoothStructure := "", multiplication := λ _ _ => (), inverse := λ _ => (), identity := () }

structure LieAlgebra where
  underlying : Type
  bracket : underlying → underlying → underlying
  field : String

structure LieGroupCohomologyData (G : LieGroup) where
  cochains : ℕ → (G.underlying → ⋯ → G.underlying → ℝ)
  coboundary : ℕ → (G.underlying → ⋯ → G.underlying → ℝ) → (G.underlying → ⋯ → G.underlying → ℝ)
  continuous : Bool

default instance : Inhabited (LieGroupCohomologyData default) where
  default := { cochains := λ n => (λ args => 0), coboundary := λ n f => (λ args => 0), continuous := true }

end ContinuousCohomologyLieGroupsTheoremCanonicalLaneLean
end HautevilleHouse