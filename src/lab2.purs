module Lab2 where

import Prelude ((+), (-), (<$>))

import Data.List (List(..), length, reverse, snoc, (:))
import Data.Tuple (Tuple(..), fst, snd)
import Data.Maybe (Maybe(..))


findIndex' :: forall a. (a -> Boolean) -> List a -> Int -> Maybe Int
findIndex' _ Nil _ = Nothing
findIndex' pred (head:tail) index = if pred head then Just index else findIndex' pred tail (index+1)

findIndex :: forall a. (a -> Boolean) -> List a -> Maybe Int
findIndex pred list = findIndex' pred list 0


findIndexLast :: forall a. (a -> Boolean) -> List a -> Maybe Int
findIndexLast pred list = ((length list - 1) - _) <$> (findIndex' pred (reverse list) 0)


zip' :: forall a b. List a -> List b -> List (Tuple a b) -> List (Tuple a b)
zip' Nil _ list3 = list3
zip' _ Nil list3 = list3
zip' (head1:tail1) (head2:tail2) list3 = zip' tail1 tail2 (snoc list3 (Tuple head1 head2))

zip :: forall a b. List a -> List b -> List (Tuple a b)
zip list1 list2 = zip' list1 list2 (Nil)


unzip' :: forall a b. List (Tuple a b) -> List a -> List b -> Tuple (List a) (List b)
unzip' Nil list1 list2 = Tuple list1 list2
unzip' (head:tail) list1 list2 = unzip' tail (snoc list1 (fst head)) (snoc list2 (snd head))

unzip :: forall a b. List (Tuple a b) -> Tuple (List a) (List b)
unzip list = unzip' list (Nil) (Nil)


filter' :: forall a. (a -> Boolean) -> List a -> List a -> List a
filter' _ Nil list = reverse list
filter' pred (head:tail) list = if pred head then filter' pred tail (head:list) else filter' pred tail list

filter :: forall a. (a -> Boolean) -> List a -> List a
filter pred list = filter' pred list (Nil)


take' :: forall a. Int -> List a -> List a -> List a
take' 0 _ list = reverse list
take' _ Nil list = reverse list
take' num (head:tail) list = take' (num-1) tail (head:list)

take :: forall a. Int -> List a -> List a
take num list = take' num list (Nil)
