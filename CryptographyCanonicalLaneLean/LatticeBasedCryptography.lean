import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CryptographyCanonicalLaneLean

structure LatticeParameters where
  n : Nat
  q : Nat

structure LatticeBasedCryptographyPackage (L : LatticeParameters) where
  secretVector : Vector ℤ L.n
  errorDistribution : Type
  publicMatrix : Matrix (Fin L.n) (Fin L.n) ℤ
  publicVector : Vector ℤ L.n
  correctness : (publicMatrix * secretVector + errorSample) = publicVector
  securityAssumption : Prop
  errorSample : Vector ℤ L.n
  securityAssumptionClosed : securityAssumption
  correctnessClosed : correctness

structure LatticeBasedCryptographyEvidence {L : LatticeParameters} (C : LatticeBasedCryptographyPackage L) where
  correctnessClosed : C.correctness
  securityAssumptionClosed : C.securityAssumption

def LatticeBasedCryptographyClosed {L : LatticeParameters} (C : LatticeBasedCryptographyPackage L) : Prop :=
  C.correctness ∧ C.securityAssumption

theorem lattice_based_cryptography_closed_from_evidence
    {L : LatticeParameters} (C : LatticeBasedCryptographyPackage L)
    (E : LatticeBasedCryptographyEvidence C) : LatticeBasedCryptographyClosed C := by
  exact And.intro E.correctnessClosed E.securityAssumptionClosed

end HautevilleHouse
end CryptographyCanonicalLaneLean
