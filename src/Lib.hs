{-# LANGUAGE MultiWayIf #-}

module Lib
    ( parse,
      gol,
      nullRule
    ) where

import Data.List.Split
import Data.List

-- takes in space delineated input
parse :: ([Int] -> Int -> Int) -> String -> String
-- parse rules input = gridConcat (fmap stringConvert (fmap (rules (map binaryConvert (splitOn " " input))) [0..99])) -- could also recurse
parse rules input = gridConcat (fmap stringConvert (fmap (rules (map binaryConvert (chunksOf 1 input))) [0..99])) -- could also recurse

gol :: [Int] -> (Int -> Int)
gol grid count
  | neighborPop grid count == 2 = grid!!count -- same
  | neighborPop grid count == 3 = 1 -- grow or maintain
  | neighborPop grid count < 2 = 0 -- underpop
  | neighborPop grid count > 2 = 0 -- overpop
  | otherwise = 0


-- The identity morphism
nullRule :: [Int] -> (Int -> Int)
nullRule grid count = grid!!count

neighborPop :: [Int] -> Int -> Int
neighborPop grid count
  | isEdges count = 0
  | otherwise = grid!!(count-1) + grid!!(count+1) + grid!!(count-10) + grid!!(count+10) + grid!!(count-11) + grid!!(count-9) + grid!!(count+9) + grid!!(count+11)

isEdges :: Int -> Bool
isEdges count
  | mod (count) 10 == 0 || mod (count) 10 == 9 || count <= 10 || count >= 90 = True
  | otherwise = False

-- data Game e = Nil | Array (Int, Int) e

-- instance Monad Game where
--   xs >>= f = ixmap f xs
--   return x = Game (10,10) x

binaryConvert :: String -> Int
binaryConvert char
  | char == "0" = 0
  | char == "1" = 1
  | otherwise = 0

stringConvert :: Int -> String
stringConvert num
  | num == 0 = "0"
  | num == 1 = "1"
  | otherwise = "0"

-- Concatenates/folds into the final output string
-- TODO: Add spacing/formatting
gridConcat :: [String] -> String
gridConcat inputStrings = intercalate "\n"  (chunksOf 10 (concat inputStrings))
