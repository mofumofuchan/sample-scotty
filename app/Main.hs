{-# LANGUAGE OverloadedStrings #-}
module Main where

import           Control.Monad.IO.Class (liftIO)
import           Data.Text.Lazy         (pack)
import           Data.Time
import           Web.Scotty
--import           Web.Scotty                    as S
--import           Data.Monoid (mconcat)
--import qualified Data.Text   as T
-- import           Text.Blaze.Html.Renderer.Text
-- import           Text.Blaze.Html5
-- import qualified Text.Blaze.Html5              as H
-- import           Text.Blaze.Html5.Attributes
-- import qualified Text.Blaze.Html5.Attributes   as A

routes :: ScottyM ()
routes = do
  get "/" $ do
    text "hello"

  get "/get_time" $ do
    time_str <- pack <$> (show <$> liftIO getCurrentTime)
    text time_str

main :: IO ()
main = do
  putStrLn "Starting Server..."
  scotty 3000 routes


  -- get "/json" $ do
  --   json [(0::Int)..10]

  -- notFound $ do
  --   text "there is no such route"
