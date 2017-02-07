import Data.Char
import Control.Monad
import Control.Monad.Trans
import Control.Monad.Trans.Maybe
import Data.Maybe

{-
getPassphrase::IO (Maybe String)
getPassphrase = 
               do
                 s <- getLine
                 if isValid s
                    then return $ Just s
                    else return Nothing
-}

isValid::String->Bool
isValid s = length s >= 8
            && any isAlpha s
            && any isNumber s
            && any isPunctuation s

{-
askPassphrase::IO()
askPassphrase = do
                  putStrLn "Insert your new passphrase:"
                  maybe_val <- getPassphrase
                  case isJust maybe_val of
                      True -> putStrLn "Storing in database.."
                      False -> putStrLn "Passphrase invalid."
-}

--newType MaybeT m a = MaybeT { runMaybeT :: m (Maybe a) }
--think of the MaybeT IO as a single Monad.. 
--Its a sandwhich.. Maybe is wrapped by the IO Monad
getPassphrase::MaybeT IO String
getPassphrase = do
                  s <- lift getLine
                  guard $ isValid s
                  return s


askPassphrase::MaybeT IO()
askPassphrase = do
                  lift $ putStrLn "Insert your new passphrase"
                  value <- getPassphrase -- value is String
                  lift $ putStrLn ("The passphrase: "++value++ " will be stored in the database")


--runMaybeT::MaybeT m a -> m (Maybe a)
main =  runMaybeT askPassphrase -- main will have the type IO (Maybe())

