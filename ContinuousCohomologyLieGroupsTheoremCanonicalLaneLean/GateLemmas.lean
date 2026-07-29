import ContinuousCohomologyLieGroupsTheoremCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace ContinuousCohomologyLieGroupsTheoremCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end ContinuousCohomologyLieGroupsTheoremCanonicalLaneLean
end HautevilleHouse
