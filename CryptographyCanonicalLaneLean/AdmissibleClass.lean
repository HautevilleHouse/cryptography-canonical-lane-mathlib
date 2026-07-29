import CryptographyCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace CryptographyCanonicalLaneLean

structure AdmissibleClass where
  object : CryptographicAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  CryptographicWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CryptographyCanonicalLaneLean
end HautevilleHouse