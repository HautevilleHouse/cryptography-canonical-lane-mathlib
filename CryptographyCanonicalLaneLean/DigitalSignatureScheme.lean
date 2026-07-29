import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CryptographyCanonicalLaneLean

structure DigitalSignatureSchemePackage where
  keyGen : Type → Type
  sign : Type → Type
  verify : Type → Type
  correctness : ∀ (msg : Type) (sk pk : Type), verify pk msg (sign sk msg) = true
  existentialUnforgeability : Prop
  correctnessClosed : correctness
  existentialUnforgeabilityClosed : existentialUnforgeability

structure DigitalSignatureSchemeEvidence (D : DigitalSignatureSchemePackage) where
  correctnessClosed : D.correctness
  existentialUnforgeabilityClosed : D.existentialUnforgeability

def DigitalSignatureSchemeClosed (D : DigitalSignatureSchemePackage) : Prop :=
  D.correctness ∧ D.existentialUnforgeability

theorem digital_signature_scheme_closed_from_evidence
    (D : DigitalSignatureSchemePackage) (E : DigitalSignatureSchemeEvidence D) :
    DigitalSignatureSchemeClosed D := by
  exact And.intro E.correctnessClosed E.existentialUnforgeabilityClosed

end HautevilleHouse
end CryptographyCanonicalLaneLean
