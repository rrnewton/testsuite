{-# OPTIONS -fglasgow-exts -fallow-undecidable-instances #-}

{-:q


We provide an illustrative ScrapYourBoilerplate example for a nested
datatype.  For clarity, we do not derive the Typeable and Data
instances by the deriving mechanism but we show the intended
definitions. The overall conclusion is that nested datatypes do not
pose any challenge for the ScrapYourBoilerplate scheme. Well, this is
maybe not quite true because it seems like we need to allow
undecidable instances (in GHC 6.1).

-}

module Main where
import Data.Dynamic
import Data.Generics
 
-- A nested datatype
data Nest a = Box a | Wrap (Nest [a])

-- The representation of the type constructor    
nestTc = mkTyCon "Nest"

-- The Typeable instance for the nested datatype    
instance Typeable a => Typeable (Nest a)
  where
    typeOf n = mkAppTy nestTc [typeOf (paratype n)]
      where
	paratype :: Nest a -> a
	paratype _ = undefined



-- The Data instance for the nested datatype
instance (Data a, Data [a]) => Data (Nest a)
  where
    gfoldl k z (Box a)  = z Box `k` a
    gfoldl k z (Wrap w) = z Wrap `k` w
    gmapT f (Box a)  = Box (f a)
    gmapT f (Wrap w) = Wrap (f w)
    toConstr (Box _)  = boxConstr
    toConstr (Wrap _) = wrapConstr
    fromConstr c = case conIndex c of
                     1 -> Box undefined
                     2 -> Wrap undefined
    dataTypeOf _ = nestDataType

boxConstr    = mkConstr 1 "Box"  Prefix
wrapConstr   = mkConstr 2 "Wrap" Prefix
nestDataType = mkDataType [boxConstr,wrapConstr]

-- test for compilation only
main = undefined
