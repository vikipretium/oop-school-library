class Person < Nameable
  # constructors and instance vars
  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  # getters and setter
  attr_reader :id
  attr_accessor :name, :age

  def correct_name
    @name
  end

  def person_rentals(rental)
    rental.instance_of?(Rental) && !@rentals.include?(rental) &&
      @rentals.push(rental)
    @rentals
  end

  # private method is_of_age?

  def of_age?
    return true if @age >= 18

    false
  end
  private :of_age?

  # public method can_use_services?
  def can_use_services?
    return true if is_of_age? || parent_permission == true

    false
  end
end
