module Tree (
    Tree(Empty, Node),
    search
) where 

-- data Tree a = Empty | Node a (Tree a) (Tree a)
--     deriving (Show, Read, Eq)

data Tree a = Empty | Node {
    value :: a,
    left :: Tree a,
    right :: Tree a
} deriving (Show, Read, Eq)

search :: (Eq a, Ord a) => Tree a -> a -> Bool
search Empty _1 = False
search (Node val l r) x
    | x == val = True
    | x < val = search l x
    | otherwise = search r x

-- BST insertions (balanced)
-- foldl

-- property based testing
-- Gallina
-- Test behaviour not the result