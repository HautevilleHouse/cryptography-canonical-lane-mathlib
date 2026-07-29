import CryptographyCanonicalLaneLean.CryptoAdmissibleClass

namespace HautevilleHouse
namespace CryptographyCanonicalLaneLean

structure DiffieHellmanPackage where
  group : Type
  generator : group
  secretA : ℕ
  secretB : ℕ
  publicA : group
  publicB : group
  sharedSecret : group
  computationalSecurity : Prop

structure DiffieHellmanEvidence (D : DiffieHellmanPackage) where
  computationalSecurityClosed : D.computationalSecurity

def DiffieHellmanClosed (D : DiffieHellmanPackage) : Prop :=
  D.computationalSecurity

theorem diffie_hellman_closed_from_evidence (D : DiffieHellmanPackage) (E : DiffieHellmanEvidence D) : DiffieHellmanClosed D := by
  exact E.computationalSecurityClosed

end CryptographyCanonicalLaneLean
end HautevilleHouse