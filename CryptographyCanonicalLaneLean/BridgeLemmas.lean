import CryptographyCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace CryptographyCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  CryptographicWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end CryptographyCanonicalLaneLean
end HautevilleHouse