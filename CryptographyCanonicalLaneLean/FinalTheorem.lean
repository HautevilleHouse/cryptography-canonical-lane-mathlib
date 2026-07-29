import CryptographyCanonicalLaneLean.CryptoGateLemmas

namespace HautevilleHouse
namespace CryptographyCanonicalLaneLean

def ConstrainedCryptoClosure (A : CryptoAdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_crypto_endgame (A : CryptoAdmissibleClass) :
    ConstrainedCryptoClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CryptographyCanonicalLaneLean
end HautevilleHouse