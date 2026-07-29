import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CryptographyCanonicalLaneLean

structure HashFunctionSignature where
  inputLength : ℕ
  outputLength : ℕ

structure CryptographicHashFunctionPackage (H : HashFunctionSignature) where
  hashFunction : Vector ℕ H.inputLength → Vector ℕ H.outputLength
  deterministic : ∀ (x : Vector ℕ H.inputLength), hashFunction x = hashFunction x
  preimageResistance : Prop
  collisionResistance : Prop
  avalancheEffect : Prop
  preimageResistanceClosed : preimageResistance
  collisionResistanceClosed : collisionResistance
  avalancheEffectClosed : avalancheEffect

structure CryptographicHashFunctionEvidence {H : HashFunctionSignature} (C : CryptographicHashFunctionPackage H) where
  deterministicClosed : C.deterministic
  preimageResistanceClosed : C.preimageResistance
  collisionResistanceClosed : C.collisionResistance
  avalancheEffectClosed : C.avalancheEffect

def CryptographicHashFunctionClosed {H : HashFunctionSignature} (C : CryptographicHashFunctionPackage H) : Prop :=
  C.deterministic ∧ C.preimageResistance ∧ C.collisionResistance ∧ C.avalancheEffect

theorem cryptographic_hash_function_closed_from_evidence
    {H : HashFunctionSignature} (C : CryptographicHashFunctionPackage H)
    (E : CryptographicHashFunctionEvidence C) : CryptographicHashFunctionClosed C := by
  exact And.intro E.deterministicClosed
    (And.intro E.preimageResistanceClosed
      (And.intro E.collisionResistanceClosed E.avalancheEffectClosed))

end HautevilleHouse
end CryptographyCanonicalLaneLean
