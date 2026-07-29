import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CryptographyCanonicalLaneLean

structure Statement (w : Type) where
  witness : w

structure ZKProofSystemPackage (w : Type) (S : Statement w) where
  prover : Type
  verifier : Type
  completeness : (prover → verifier → Prop) → Prop
  soundness : (prover → verifier → Prop) → Prop
  zeroKnowledge : Prop
  completenessHolds : completeness (λ p v => True)
  soundnessHolds : soundness (λ p v => False)
  zeroKnowledgeHolds : zeroKnowledge

structure ZKProofSystemEvidence {w : Type} {S : Statement w} (Z : ZKProofSystemPackage w S) where
  completenessClosed : Z.completenessHolds
  soundnessClosed : Z.soundnessHolds
  zeroKnowledgeClosed : Z.zeroKnowledgeHolds

def ZKProofSystemClosed {w : Type} {S : Statement w} (Z : ZKProofSystemPackage w S) : Prop :=
  Z.completenessHolds ∧ Z.soundnessHolds ∧ Z.zeroKnowledgeHolds

theorem zk_proof_system_closed_from_evidence
    {w : Type} {S : Statement w} (Z : ZKProofSystemPackage w S)
    (E : ZKProofSystemEvidence Z) : ZKProofSystemClosed Z := by
  exact And.intro E.completenessClosed (And.intro E.soundnessClosed E.zeroKnowledgeClosed)

end HautevilleHouse
end CryptographyCanonicalLaneLean
