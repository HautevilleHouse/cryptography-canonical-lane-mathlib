import CryptographyCanonicalLaneLean.CryptoBridgeLemmas

namespace HautevilleHouse
namespace CryptographyCanonicalLaneLean

def gateClosed (A : CryptoAdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : CryptoAdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end CryptographyCanonicalLaneLean
end HautevilleHouse