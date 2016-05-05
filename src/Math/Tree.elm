module Math.Tree (satisfies, Tree(..)) where


satisfies : (a -> a -> Bool) -> Tree a -> Tree a -> Bool
satisfies check a b =
  case ( a, b ) of
    ( Leaf aVal, Leaf bVal ) ->
      check aVal bVal

    ( Leaf aVal, Node bVal bFst bSnd ) ->
      if check aVal bVal then
        (satisfies check a bFst) || (satisfies check a bSnd)
      else
        False

    ( Node aVal aFst aSnd, Leaf bVal ) ->
      if check aVal bVal then
        (satisfies check aFst b) || (satisfies check aSnd b)
      else
        False

    ( Node aVal aFst aSnd, Node bVal bFst bSnd ) ->
      if check aVal bVal then
        (satisfies check aFst bFst)
          || (satisfies check aFst bSnd)
          || (satisfies check aSnd bFst)
          || (satisfies check aSnd bSnd)
      else
        False


type Tree a
  = Leaf a
  | Node a (Tree a) (Tree a)
