module Tree (
    Tree(Empty, Node),
    search,
    insert
) where 

-- data Tree a = Empty | Node a (Tree a) (Tree a)
--     deriving (Show, Read, Eq)

data Tree a = Empty | Node {
    value :: a,
    left :: Tree a,
    right :: Tree a
} deriving (Show, Read, Eq)

search :: (Eq a, Ord a) => Tree a -> a -> Bool
search Empty _ = False
search (Node val l r) x
    | x == val = True
    | x < val = search l x
    | otherwise = search r x

-- Standard BST insertion (no balancing)
-- insert :: (Eq a, Ord a) => a -> Tree a -> Tree a
-- insert el Empty  = Node el Empty Empty
-- insert el (Node v l r)
--     | el >= v = Node v l (insert el r)
--     | otherwise = Node v (insert el l) r

height :: Tree a -> Int
height Empty = 0
height (Node _ l r) = max (height l) (height r) + 1

--      x                               y
--     / \     Right Rotation          /  \
--    y   T3   - - - - - - - >        T1   x 
--   / \       < - - - - - - -            / \
--  T1  T2     Left Rotation            T2  T3

rotateLeft :: Tree a -> Tree a
rotateLeft (Node xv xl (Node yv yl yr)) = Node yv (Node xv xl yl) yr

rotateRight :: Tree a -> Tree a
rotateRight (Node xv (Node yv yl yr) xr) = Node yv yl (Node xv yr xr)

slope :: Tree a -> Int
slope Empty = 0
slope (Node _ l r) = height l - height r

balance :: Tree a -> Tree a
balance (Node v l r)
    | abs sv < 2         = Node v l r
    | sv == 2 && sl /= -1 = rotateRight (Node v l r)
    | sv == 2 && sl == -1 = rotateRight (Node v (rotateLeft l) r)
    | sv == -2 && sr /= 1 = rotateLeft (Node v l r)
    | sv == -2 && sr == 1 = rotateLeft (Node v l (rotateRight r))
    where 
       sv  = slope $ Node v l r
       sl = slope l
       sr = slope r

-- BST insertion (with AVL balancing)
insert :: (Eq a, Ord a) => a -> Tree a -> Tree a
insert el Empty  = Node el Empty Empty
insert el (Node v l r)
    | el >= v = balance $ Node v l (insert el r)
    | otherwise = balance $ Node v (insert el l) r

-- BST insertions (balanced)
-- foldl

-- property based testing
-- Gallina
-- Test behaviour not the result