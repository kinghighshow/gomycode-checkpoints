
import math

class Calculator:
    def __init__(self):
        self.operations = {
            '+': self.addition,
            '-': self.subtraction,
            '*': self.multiplication,
            '/': self.division
        }

        # Add the new operations
        self.add_operation('**', self.exponentiation)
        self.add_operation('sqrt', self.square_root)
        self.add_operation('log', self.logarithm)

    def add_operation(self, symbol, function):
        self.operations[symbol] = function

    def addition(self, x, y):
        return x + y

    def subtraction(self, x, y):
        return x - y

    def multiplication(self, x, y):
        return x * y

    def division(self, x, y):
        if y == 0:
            raise ValueError("Error! Input a non-zero value")
        else:
            return x / y

    def calculate(self, x, symbol, y):
        if symbol in self.operations:
            function = self.operations[symbol]
            return function(x, y)
        else:
            raise ValueError(f"Operation '{symbol}' not found")
        
    def exponentiation(self, x, y):
        return x ** y

    def square_root(self, x, y):
        return math.sqrt(x)

    def logarithm(self, x, base=10):
        return math.log(x, base)

def main():
    my_calculator = Calculator()

    while True:
        print("Available operations")
        print("1. + (Addition)")
        print("2. - (Subtraction)")
        print("3. * (Multiplication)")
        print("4. / (Division)")
        print("5. ** (Exponential)")
        print("6. sqrt (Square Root)")
        print("7. log (Logarithm)")
        print("8. exit (Exit)")

        choice = input("Input the symbol of the operation you wish to carry out: ")

        if choice in my_calculator.operations:
            x = float(input("Enter the first number: "))
            y = float(input("Enter the second number: "))

            try:
                result = my_calculator.calculate(x, choice, y)
                print(f"Result is {result}")
            except (ValueError, TypeError) as e:
                print(e)
        elif choice == "exit":
            break
        else:
            print("Invalid operation. Please choose a valid operation.")

if __name__ == "__main__":
    main()

        