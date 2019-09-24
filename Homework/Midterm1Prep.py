# zipper = lambda x: x
# helper = lambda func, existing: func(existing)
# while sequence > 0:
#   if sequence % 10 == 1:
#       zipper = helper(f1, zipper)
#   else:
#       zipper = helper(f2, zipper)
#   sequence = sequence // 10
# return zipper

def rect(area, perim):
    side = 1
    while side * side <= area:
        other = round(area/side)
        if side * other == area and 2*side + 2*other == perim:
            return max(side, other)

        side += 1
    return False
