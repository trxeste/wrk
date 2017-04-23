module MAC where
import CLaSH.Prelude

ma acc (x, y) = acc + x * y

macT acc (x,y) = (acc', o)
  where
    acc' = ma acc(x,y)
    o    = acc
--macT acc inp = (ma acc inp, acc)

mac = mealy macT 0

topEntity :: Signal (Signed 9, Signed 9) -> Signal (Signed 9)
topEntity = mac

testInput :: Signal (Signed 9,Signed 9)
testInput = stimuliGenerator $(listToVecTH [(1,1) :: (Signed 9,Signed 9),(2,2),(3,3),(4,4)])

expectedOutput :: Signal (Signed 9) -> Signal Bool
expectedOutput = outputVerifier $(listToVecTH [0 :: Signed 9,1,5,14])
