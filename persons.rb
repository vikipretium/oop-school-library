class Person
  # constructors and instance vars
  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  # getters and setter
  attr_reader :id
  attr_accessor :name, :age

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
