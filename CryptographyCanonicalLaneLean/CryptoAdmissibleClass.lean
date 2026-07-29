import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CryptographyCanonicalLaneLean

structure CryptoAdmittedObject where
  publicKey : Type
  secretKey : Type
  plaintext : Type
  ciphertext : Type
  encryptionScheme : Prop
  decryptionCorrect : Prop
  securityReduction : Prop
  conclusion : securityReduction

structure CryptoAdmissibleClass where
  object : CryptoAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def cryptoAdmittedClosure (A : CryptoAdmissibleClass) : Prop :=
  (A.object.securityReduction) ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CryptographyCanonicalLaneLean
end HautevilleHouse