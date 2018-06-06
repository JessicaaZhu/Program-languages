--problem1
removedups [] = []
removedups (x:xs)
	|elem x xs = removedups xs
	|otherwise = x:removedups xs

union lt1 lt2 = removedups (lt1++lt2)

--problem2
delete _ [] = []
delete k lt = take (k-1) lt ++ delete k (drop k lt)

--problem3
data Tree = Leaf Int | Node Tree Int Tree
occurs x (Leaf  n) = (x == n)
occurs x (Node t1 n t2)
	| x == n = True
	| otherwise = occurs x t1 || occurs x t2

--problem4

reversel [] = []
reversel (x:xs) = (reverse xs) ++ [x]

delete_first x [] = []
delete_first x (y:ys) 
	| x == y = ys
	| otherwise = [y] ++ (delete_first x ys)

func x lt = delete_first x (reversel lt)

delete_last x lt = reversel(func x lt)

--problem5
insert x [] = [x]
insert x (y:ys) = if x < y
	then x:y:ys
	else y:insert x ys

isort [x] = [x]
isort (x:xs) = insert x (isort xs)
