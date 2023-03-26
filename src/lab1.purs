module Lab1 where

import Prelude ((+))

import Data.List (List(..), foldr, (:))


singleton :: forall a. a  -> List a
singleton x = Cons x Nil

null :: forall a. List a -> Boolean
null Nil = true
null _ = false

snoc :: forall a. List a -> a -> List a
snoc list elem = foldr (:) (elem:Nil) list

length' :: forall a. List a -> Int -> Int
length' Nil num = num
length' (_:tail) num = length' tail (num+1)

length :: forall a. List a -> Int
length list = length' list 0
