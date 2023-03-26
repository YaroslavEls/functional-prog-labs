module Main where

import Prelude (Unit, discard, show, ($), (>))

import Lab1 (singleton, null, snoc, length)
import Lab2 (filter, findIndex, findIndexLast, take, unzip, zip)
import Data.List (List(..), (:))
import Data.Tuple (Tuple(..))
import Effect (Effect)
import Effect.Console (log)


main :: Effect Unit
main = do
  log "Lab1:"
  log $ show (singleton 3)
  log $ show (null (1:2:Nil))
  log $ show (null (Nil))
  log $ show (snoc (1:2:Nil) 3)
  log $ show (length (1:2:4:Nil))
  log "Lab2"
  log $ show $ findIndex (_>3) (1:2:3:4:5:Nil)
  log $ show $ findIndexLast (_>3) (1:2:3:4:5:Nil)
  log $ show $ findIndexLast (_>3) (1:2:3:Nil)
  log $ show $ zip (1:2:4:Nil) (7:8:3:Nil)
  log $ show $ unzip ((Tuple 1 7):(Tuple 2 8):Nil)
  log $ show $ filter (_>3) (7:2:3:11:1:6:8:Nil)
  log $ show $ take 3 (1:2:3:4:5:Nil)
  log $ show $ take 3 (1:2:Nil)
