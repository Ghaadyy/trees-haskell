import Tree (
    Tree(Empty, Node), 
    search,
    insert,
    insertFoldl)

t1 = Node 5 
    (Node 2 Empty Empty) 
    (Node 6 Empty Empty)

t2 = Empty
t3 = insert 25 $ insert 50 $ insert 40 $ insert 30 $ insert 20 $ insert 10 t2
t3Folded = insertFoldl 25 $ insertFoldl 50 $ insertFoldl 40 $ insertFoldl 30 $ insertFoldl 20 $ insertFoldl 10 t2