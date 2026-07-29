import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CryptographyCanonicalLaneLean

structure EllipticCurveParameters where
  a : ℤ
  b : ℤ
  p : ℕ
  generator : ℤ × ℤ

structure EllipticCurvePoint where
  x : ℤ
  y : ℤ
  onCurve : y^2 ≡ x^3 + a * x + b [ZMOD p]

structure EllipticCurveDiffieHellmanPackage (E : EllipticCurveParameters) where
  aliceSecret : ℕ
  bobSecret : ℕ
  alicePublic : EllipticCurvePoint
  bobPublic : EllipticCurvePoint
  sharedSecret : EllipticCurvePoint
  sharedSecretCalculated : sharedSecret = (aliceSecret • bobPublic) ∧ sharedSecret = (bobSecret • alicePublic)

structure EllipticCurveDiffieHellmanEvidence {E : EllipticCurveParameters} (K : EllipticCurveDiffieHellmanPackage E) where
  sharedSecretCalculatedClosed : K.sharedSecretCalculated

def EllipticCurveDiffieHellmanClosed {E : EllipticCurveParameters} (K : EllipticCurveDiffieHellmanPackage E) : Prop :=
  K.sharedSecretCalculated

theorem elliptic_curve_diffie_hellman_closed_from_evidence
    {E : EllipticCurveParameters} (K : EllipticCurveDiffieHellmanPackage E)
    (E' : EllipticCurveDiffieHellmanEvidence K) : EllipticCurveDiffieHellmanClosed K := by
  exact E'.sharedSecretCalculatedClosed

end HautevilleHouse
end CryptographyCanonicalLaneLean
