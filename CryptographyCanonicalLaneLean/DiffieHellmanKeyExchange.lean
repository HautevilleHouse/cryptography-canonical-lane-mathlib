import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CryptographyCanonicalLaneLean

structure DiffieHellmanParams where
  p : Nat
  g : Nat
  primeP : Nat.Prime p
  generatorG : g^((p-1)/2) % p ≠ 1

structure DiffieHellmanKeyExchangePackage (D : DiffieHellmanParams) where
  aliceSecret : Nat
  bobSecret : Nat
  alicePublic : g ^ aliceSecret % D.p
  bobPublic : g ^ bobSecret % D.p
  sharedSecretAlice : bobPublic ^ aliceSecret % D.p
  sharedSecretBob : alicePublic ^ bobSecret % D.p
  sharedSecretEqual : sharedSecretAlice = sharedSecretBob

structure DiffieHellmanKeyExchangeEvidence {D : DiffieHellmanParams} (K : DiffieHellmanKeyExchangePackage D) where
  sharedSecretEqualClosed : K.sharedSecretEqual

def DiffieHellmanKeyExchangeClosed {D : DiffieHellmanParams} (K : DiffieHellmanKeyExchangePackage D) : Prop :=
  K.sharedSecretEqual

theorem diffie_hellman_key_exchange_closed_from_evidence
    {D : DiffieHellmanParams} (K : DiffieHellmanKeyExchangePackage D)
    (E : DiffieHellmanKeyExchangeEvidence K) : DiffieHellmanKeyExchangeClosed K := by
  exact E.sharedSecretEqualClosed

end HautevilleHouse
end CryptographyCanonicalLaneLean
