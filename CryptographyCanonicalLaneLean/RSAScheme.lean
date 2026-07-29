import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CryptographyCanonicalLaneLean

structure RSAPublicKey where
  n : Nat
  e : Nat

structure RSAPrivateKey where
  n : Nat
  d : Nat

structure RSASchemePackage where
  publicKey : RSAPublicKey
  privateKey : RSAPrivateKey
  primeP : Nat
  primeQ : Nat
  phiN : Nat
  edCongruent : e * d ≡ 1 [MOD phiN]
  encryptionSoundness : ∀ (m : Nat), m < n → (m ^ e % n) ^ d % n = m
  decryptionSoundness : ∀ (c : Nat), c < n → (c ^ d % n) ^ e % n = c

structure RSASchemeEvidence (R : RSASchemePackage) where
  encryptionSoundnessClosed : R.encryptionSoundness
  decryptionSoundnessClosed : R.decryptionSoundness

def RSASchemeClosed (R : RSASchemePackage) : Prop :=
  R.encryptionSoundness ∧ R.decryptionSoundness

theorem rsa_scheme_closed_from_evidence (R : RSASchemePackage) (E : RSASchemeEvidence R) :
    RSASchemeClosed R := by
  exact And.intro E.encryptionSoundnessClosed E.decryptionSoundnessClosed

end HautevilleHouse
end CryptographyCanonicalLaneLean
