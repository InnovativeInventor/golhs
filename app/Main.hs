module Main where

import Lib
import System.IO
import qualified Data.Text as T

-- TODO: Can probably recursively do this and make the input size less hardcoded
main :: IO ()
main = do putStr "Input:\n"
          hFlush stdout
          l0 <- getLine
          l1 <- getLine
          l2 <- getLine
          l3 <- getLine
          l4 <- getLine
          l5 <- getLine
          l6 <- getLine
          l7 <- getLine
          l8 <- getLine
          l9 <- getLine
          putStrLn "\nOutput: "
          putStrLn (parse gol (T.unpack (T.strip (T.pack (l0++l1++l2++l3++l4++l5++l6++l7++l8++l9)))))
          -- putStrLn (parse nullRule line)
