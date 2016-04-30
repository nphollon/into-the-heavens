module Math.Tree (collide, Tree(..)) where


collide : (a -> a -> Bool) -> Tree a -> Tree a -> Bool
collide check a b =
  case ( a, b ) of
    ( Leaf aVal, Leaf bVal ) ->
      check aVal bVal

    ( Leaf aVal, Node bVal bFst bSnd ) ->
      if check aVal bVal then
        (collide check a bFst) || (collide check a bSnd)
      else
        False

    ( Node aVal aFst aSnd, Leaf bVal ) ->
      if check aVal bVal then
        (collide check aFst b) || (collide check aSnd b)
      else
        False

    ( Node aVal aFst aSnd, Node bVal bFst bSnd ) ->
      if check aVal bVal then
        (collide check aFst bFst)
          || (collide check aFst bSnd)
          || (collide check aSnd bFst)
          || (collide check aSnd bSnd)
      else
        False


type Tree a
  = Leaf a
  | Node a (Tree a) (Tree a)
