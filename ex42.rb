## Animal is-a object look at the extra credit
class Animal
end

## Dog is-a Animal
class Dog < Animal

  def initialize(name)
    ## Dog has-a name
    @name = name
  end

  def bark
    puts "#{@name} goes woof woof."
  end
end

## Cat is-a Animal
class Cat < Animal

  def initialize(name)
    ## Cat has-a name
    @name = name
  end

  def meow
    puts "#{@name} goes meow."
  end
end

## Person is-a object
class Person

  def initialize(name)
    ## Person has-a name
    @name = name

    ## Person has-a pet of some kind
    @pet = nil
  end

  def scream
    puts "#{@name} screams eternally."
  end

  attr_accessor :pet
end

## Employee is-a Person
class Employee < Person

  def initialize(name, salary)
    ## Employee has-a name
    super(name)
    ## Person has-a salary
    @salary = salary
  end

  def work
    puts "#{@name} does work."
  end
end

## Fish is-a object
class Fish
end

## Salmon is-a Fish
class Salmon < Fish
end

## Halibut is-a Fish
class Halibut < Fish
end


## rover is-a Dog
rover = Dog.new("Rover")
rover.bark

## satan is-a Cat
satan = Cat.new("Satan")
satan.meow

## Mary is-a Person
mary = Person.new("Mary")
mary.scream

## Mary has-a pet
mary.pet = satan

## Frank is-a Employee and has-a salary
frank = Employee.new("Frank", 120000)
frank.work
frank.scream

## Frank has-a pet
frank.pet = rover

## Flipper is-a Fish
flipper = Fish.new()

## Crouse is-a Salmon
crouse = Salmon.new()

## Harry is-a Halibut
harry = Halibut.new()
