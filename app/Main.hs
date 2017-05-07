module Main where

import Lib

import Numeric.Datasets (getDataset)
import Numeric.Datasets.Iris
import Numeric.Datasets.Abalone (abalone)
import Numeric.LinearAlgebra


parseIrisClass :: IrisClass -> Integer
parseIrisClass Setosa = 0
parseIrisClass Versicolor = 1
parseIrisClass Virginica = 2

getIrisLabels :: [Iris] -> Vector R
getIrisLabels irises = fromList $ irisDoubles
  where irisDoubles = map (fromIntegral . parseIrisClass . irisClass) irises

getIrisFeatures :: [Iris] -> Matrix R
getIrisFeatures irises = tr $ fromLists [sepalLengths, sepalWidths, petalLengths, petalWidths]
  where sepalLengths = map sepalLength irises
        sepalWidths = map sepalWidth irises
        petalLengths = map petalLength irises
        petalWidths = map petalWidth irises

getIris :: [Iris] -> (Matrix R, Vector R)
getIris irises = (getIrisFeatures irises, getIrisLabels irises)
    

main = do

  -- The Iris data set is embedded
  print (length iris)
  print (head iris)
  let (irisFeatures, irisLabels) = getIris iris
  print $ irisLabels
  disp 2 irisFeatures
