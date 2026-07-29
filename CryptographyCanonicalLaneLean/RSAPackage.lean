import CryptographyCanonicalLaneLean.CryptoAdmissibleClass

namespace HautevilleHouse
namespace CryptographyCanonicalLaneLean

structure RSAPackage where
  modulus : ℕ
  publicExponent : ℕ
  privateExponent : ℕ
  encryptionFunction : ℕ → ℕ
  decryptionFunction : ℕ → ℕ
  correctDecryption : Prop
  oneWaySecurity : Prop

structure RSAEvidence (R : RSAPackage) where
  correctDecryptionClosed : R.correctDecryption
  oneWaySecurityClosed : R.oneWaySecurity

def RSAClosed (R : RSAPackage) : Prop :=
  R.correctDecryption ∧ R.oneWaySecurity

theorem rsa_closed_from_evidence (R : RSAPackage) (E : RSAEvidence R) : RSAClosed R := by
  exact And.intro E.correctDecryptionClosed E.oneWaySecurityClosed

end CryptographyCanonicalLaneLean
end HautevilleHouse