module Prolude (
    proSort,
    proTake,
    proDrop,
) where



-- | Sort a list blabla
--
-- >>> proSort [3,1,2]
-- [1,2,3]
--
-- >>> proSort [1,2,3]
-- [1,2,3,4]
proSort :: Ord a => [a] -> [a]
proSort [] = []
proSort (x:xs) = proSort [y | y <- xs, y <= x] ++ [x] ++ proSort [y | y <- xs, y > x]

proTake 0 [] = []
proTake n (x:xs) = x : proTake (n-1) xs

proDrop 0 xs = xs
proDrop n (_:xs) = proDrop (n-1) xs


proSplitAt :: Int -> [a] -> ([a], [a])
proSplitAt n xs | n <= 0 = ([], xs)
proSplitAt _ [] = ([], [])
proSplitAt n (x:xs) =
    let (ys, zs) = proSplitAt (n-1) xs
    in (x:ys, zs)
