import ContinuousCohomologyLieGroupsTheoremCanonicalLaneLean.ContinuousCohomologyGateLemmas

namespace HautevilleHouse
namespace ContinuousCohomologyLieGroupsTheoremCanonicalLaneLean

def ConstrainedContinuousCohomologyClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_continuous_cohomology_closure (A : AdmissibleClass) :
    ConstrainedContinuousCohomologyClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ContinuousCohomologyLieGroupsTheoremCanonicalLaneLean
end HautevilleHouse