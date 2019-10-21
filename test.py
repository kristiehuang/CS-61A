from enum import *

class Operations(Enum):
    ADD = 0
    SUBTRACT = 1
    SET = 2
    ROUND_TO_CLOSEST_MULTIPLE_OF_FIVE = 3
    REPEAT_LAST_OPERATION = 4

class Calculator:
    def __init__(self):
        self.total = 0
        self.last_op = Operations.SET
        self.last_val = 0

    def performOperation(self, op, value):
        # Write your code here
        if op.value == 0:
            self.total += value
        elif op.value == 1:
            self.total -= value
        elif op.value == 2:
            self.total = value
        elif op.value == 3:
            mult1 = self.total - (self.total % 5)
            mult2 = self.total + 5 - (self.total % 5)
            diff1, diff2 = self.total - mult1, mult2 - self.total
            self.total = mult1 if diff1 < diff2 else mult2
        elif op.value == 4:
            self.performOperation(self.last_op, self.last_val)
        
        if op.value != 4:
            self.last_op, self.last_val = op, value
        return self.total
        

        
calc = Calculator()
calc.performOperation(Operations.ADD, 11)
calc.performOperation(Operations.SUBTRACT, 1)
calc.performOperation(Operations.REPEAT_LAST_OPERATION, 5)
calc.performOperation(Operations.REPEAT_LAST_OPERATION, 3)

if 0:
    print("HELLO")
if 32:
    print("HI THERE")



