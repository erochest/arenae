module Types where


-- import           Arenae.Types


data Actions
        = Default { defaultOutput :: !FilePath
                  , defaultInput  :: !FilePath
                  }
        deriving (Show, Eq)