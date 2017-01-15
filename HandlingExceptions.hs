import System.Directory as FS
import Control.Exception

getListOfFiles::FilePath -> IO (Either IOException [FilePath])
getListOfFiles fpath = try (FS.getDirectoryContents fpath)::IO (Either IOException [FilePath])


main::IO()
main = do
         fpath <- getLine
         dirContents <- getListOfFiles fpath  -- type is Either IOException [FilePath]
         case dirContents of
             Left ex -> putStrLn $ "An error occurred getting directory contents. Error is " ++ show ex
             Right val -> putStrLn $ "File Listing: "++ show val

