

in_range :: Integer -> Integer -> Integer -> Bool
in_range min max x =
  x >= min && x <= max


-- fac :: Integer -> Integer
-- fac 1 = 1
-- fac n = n * fac (n-1)


fac n = aux n 1
  where
    aux n acc
      | n <= 1    = acc
      | otherwise = aux (n-1) (n*acc)
  
leibniz n = aux n 1
  where
    aux n acc
      | n == 0 = acc
      | otherwise = aux (n - 1) (acc +  ((-1.0)^n / (2.0 * fromIntegral n + 1.0)))
