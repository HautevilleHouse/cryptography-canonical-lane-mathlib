import CryptographyCanonicalLaneLean.CryptoAdmissibleClass

namespace HautevilleHouse
namespace CryptographyCanonicalLaneLean

def bridgeClosed (A : CryptoAdmissibleClass) : Prop :=
  A.object.securityReduction

theorem bridge_from_admissible_class (A : CryptoAdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end CryptographyCanonicalLaneLean
end HautevilleHouse