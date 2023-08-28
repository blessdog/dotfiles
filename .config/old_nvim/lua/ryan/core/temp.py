#class Pizza:
#	def __init__(self, toppings):
#		self.toppings = toppings
#
#	@staticmethod
#	def validate_topping(topping):
#		if topping == "pineapple":
#			raise ValueError("No pineapples!")
#		else:
#			return True
#
#ingredients = ["cheese", "onions", "spam"]
#pizza = Pizza(ingredients)
#if pizza

#if all(Pizza.validate_topping(i) for i in ingredients):

class Pizza:
    def __init__(self, toppings):

        @staticmethod
        def validate_toppings(topping):
            if 'pineapple' in toppings:
                raise ValueError("Sorry, we don't allow pineapple on our pizzas!")
            self.toppings = toppings

        def describe(self):
            print(f"This pizza has the following toppings: {', '.join(self.toppings)}")


ingredients = ["cheese", "onions", "spam"]


