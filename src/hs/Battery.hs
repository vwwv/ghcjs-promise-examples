{-# LANGUAGE  NoImplicitPrelude 
           ,  DeriveAnyClass
           ,  DeriveGeneric
           ,  JavaScriptFFI
           #-}

import Data.JSVal.Promise
import GHCJS.Marshal 
import GHCJS.Types
import Protolude


data BatteryManagery = BatteryManagery 
      { charging        :: Bool
      , chargingTime    :: Double
      , dischargingTime :: Double
      , level           :: Double
      } deriving(Show,Generic,FromJSVal)

foreign import javascript safe "navigator.getBattery()" js_getBattery :: IO JSVal


getBattery :: IO (Maybe BatteryManagery)
getBattery = do promise_ <- fromJSVal =<< js_getBattery
                case promise_ of
                   
                 Nothing      -> return Nothing -- not supported :(

                 Just promise -> fromJSVal 
                                   . either identity identity =<< await promise


main :: IO ()
main = print =<< getBattery 

