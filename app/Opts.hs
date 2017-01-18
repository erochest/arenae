{-# LANGUAGE LambdaCase #-}


module Opts
    ( Actions(..)
    , opts
    , execParser
    , parseOpts
    ) where


-- import           Control.Monad       (mzero)
-- import qualified Data.List           as L
-- import qualified Data.Text           as T
import           Options.Applicative
import           Options.Applicative.Text

-- import           Arenae.Types

import           Types


outputOpt :: Parser FilePath
outputOpt = strOption (  short 'o' <> long "output" <> metavar "OUTPUT_FILE"
                      <> help "The file to write back to.")

inputOpt :: Parser FilePath
inputOpt = strOption (  short 'i' <> long "input" <> metavar "INPUT_FILE"
                     <> help "The input file to process.")

-- inputsOpt :: Parser [FilePath]
-- inputsOpt = many (strArgument (  metavar "INPUT_FILES ..."
                              -- <> help "Input data files."))

defaultOpts :: Parser Actions
defaultOpts = Default <$> outputOpt <*> inputOpt

opts' :: Parser Actions
opts' = subparser
      (  command "default" (info (helper <*> defaultOpts)
                          (progDesc "Default action and options."))
      )

opts :: ParserInfo Actions
opts = info (helper <*> opts')
            (  fullDesc
            <> progDesc "Working through the Field Guide for Genetic Programming."
            <> header "arenae - Genetic Programming")

parseOpts :: IO Actions
parseOpts = execParser opts