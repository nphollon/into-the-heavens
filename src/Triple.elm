module Triple where

type alias Triple a = (a, a, a)

map : (a -> b) -> Triple a -> Triple b
map f (a, b, c) =
  (f a, f b, f c)


mapMaybe : (a -> Maybe b) -> Triple a -> Maybe (Triple b)
mapMaybe f triple =
  case map f triple of
    (Just a, Just b, Just c) -> Just (a, b, c)
    _ -> Nothing
