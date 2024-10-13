import Tree (
    Tree(Empty, Node), 
    search,
    insert)

t1 = Node 5 
    (Node 2 Empty Empty) 
    (Node 6 Empty Empty)

t2 = Empty
t3 = insert 25 $ insert 50 $ insert 40 $ insert 30 $ insert 20 $ insert 10 t2