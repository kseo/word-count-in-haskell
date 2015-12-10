{-# OPTIONS_GHC -Wall #-}
{-# LANGUAGE OverloadedStrings #-}
module Main (main, countWord) where

-- ghcjs
import GHCJS.Types
import GHCJS.Marshal
import JavaScript.Object
import qualified Data.JSString as JSS

main :: IO ()
main = putStrLn "Dummy main"

countWord :: Object -> IO ()
countWord ref = do
  strInJSVal <- unsafeGetProp (JSS.pack "input") ref
  strInJSString <- (fromJSValUnchecked strInJSVal)::IO JSString
  count <- toJSVal $ length $ JSS.words strInJSString
  unsafeSetProp (JSS.pack "output") count ref
