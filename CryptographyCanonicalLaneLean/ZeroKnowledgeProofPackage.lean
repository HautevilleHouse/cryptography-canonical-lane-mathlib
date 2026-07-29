import CryptographyCanonicalLaneLean.CryptoAdmissibleClass

namespace HautevilleHouse
namespace CryptographyCanonicalLaneLean

structure ZeroKnowledgeProofPackage where
  prover : Type
  verifier : Type
  statement : Prop
  proof : Prop
  completeness : Prop
  soundness : Prop
  zeroKnowledge : Prop

structure ZeroKnowledgeProofEvidence (Z : ZeroKnowledgeProofPackage) where
  completenessClosed : Z.completeness
  soundnessClosed : Z.soundness
  zeroKnowledgeClosed : Z.zeroKnowledge

def ZeroKnowledgeProofClosed (Z : ZeroKnowledgeProofPackage) : Prop :=
  Z.completeness ∧ Z.soundness ∧ Z.zeroKnowledge

theorem zero_knowledge_proof_closed_from_evidence (Z : ZeroKnowledgeProofPackage) (E : ZeroKnowledgeProofEvidence Z) : ZeroKnowledgeProofClosed Z := by
  exact And.intro E.completenessClosed (And.intro E.soundnessClosed E.zeroKnowledgeClosed)

end CryptographyCanonicalLaneLean
end HautevilleHouse