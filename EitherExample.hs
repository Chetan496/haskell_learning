-- goal is to know more about the Either datatype
-- Left values are for showing error conditions
-- Right values are for results

-- Imagine a square area of 5x5.
-- the origin (i.e left-bottom)is (0,0) and maxX is 5, maxY is 5 (means 5,5 is the farthest in horz and vertical dir)
-- lets allow moving either up, down, left, right
-- If after a sequence of moves, we end up in coordinates outside the max area, then we signal it as an error
-- else we report the new co-ordinates

type Pos = (Int, Int)

isValidPosition::Pos->Bool
isValidPosition (x, y) 
    | (x < 0 ) || (x > 5) = False
    | (y < 0 ) || (y > 5) = False
    | otherwise = True



-- allowed directions

data Dir =   West
           | East 
           | North
           | South

instance Show Dir where
 show West = "West dir"
 show East = "East dir"
 show North = "North dir"
 show South = "South dir"


decrement::Int->Int
decrement x = x - 1


wrapNewPos::Pos->Either String Pos
wrapNewPos pos
   | isValidPosition pos = Right pos
   | otherwise = Left "Invalid position"



-- initialpos is assumed to be valid one
move::Pos->Dir->Either String Pos
move prevPos West = wrapNewPos $ ( decrement $ fst prevPos  ,  snd prevPos)     
move prevPos East = wrapNewPos $ ( (+1) $ fst prevPos ,  snd prevPos )
move prevPos North = wrapNewPos $ ( fst prevPos, (+1) $ snd prevPos  )
move prevPos South = wrapNewPos $ ( fst prevPos, decrement $ snd prevPos )

