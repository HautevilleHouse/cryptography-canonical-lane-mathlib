import CryptographyCanonicalLaneLean.CryptoAdmissibleClass

namespace HautevilleHouse
namespace CryptographyCanonicalLaneLean

structure LatticeBasedCryptoPackage where
  latticeDimension : ℕ
  modulus : ℕ
  publicKey : Type
  secretKey : Type
  encryptionFunction : Type
  decryptionFunction : Type
  correctness : Prop
  securityReductionToLattice : Prop

structure LatticeBasedCryptoEvidence (L : LatticeBasedCryptoPackage) where
  correctnessClosed : L.correctness
  securityReductionToLatticeClosed : L.securityReductionToLattice

def LatticeBasedCryptoClosed (L : LatticeBasedCryptoPackage) : Prop :=
  L.correctness ∧ L.securityReductionToLattice

theorem lattice_based_crypto_closed_from_evidence (L : LatticeBasedCryptoPackage) (E : LatticeBasedCryptoEvidence L) : LatticeBasedCryptoClosed L := by
  exact And.intro E.correctnessClosed E.securityReductionToLatticeClosed

end CryptographyCanonicalLaneLean
end HautevilleHouse