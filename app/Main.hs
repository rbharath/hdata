module Main where

import Lib

import Numeric.Datasets (getDataset)
import Numeric.Datasets.Iris (iris, irisClass)
import Numeric.Datasets.Abalone (abalone)
import Numeric.LinearAlgebra

main = do

  -- The Iris data set is embedded
  print (length iris)
  print (head iris)
  let irisClasses = map irisClass iris
  print irisClasses

  -- The Abalone dataset is fetched
  abas <- getDataset abalone
  print (length abas)
  print (head abas)
