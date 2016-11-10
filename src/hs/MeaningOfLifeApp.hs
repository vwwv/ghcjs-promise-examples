{-# LANGUAGE  NoImplicitPrelude 
           ,  JavaScriptFFI
           #-}

import Data.JSVal.Promise
import GHCJS.Marshal 
import GHCJS.Types
import Protolude


meaningOfTheLife :: IO Int
meaningOfTheLife = do threadDelay (10*1000000) -- 10 seconds
                      return 42  

foreign import javascript safe 
  "startBestEverUI($1);" connectToUI :: JSVal -> IO ()


main :: IO ()
main = connectToUI =<< toJSVal =<< promise computation
  where
    computation =  Right <$> (toJSVal =<< meaningOfTheLife)



