{-# OPTIONS -fglasgow-exts #-}

-- Illegal existential context on a newtype

module ShouldFail where

newtype Foo = forall a . Foo a

