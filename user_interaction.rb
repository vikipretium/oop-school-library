require './create_class'

class UserInteraction
  attr_reader :create_class

  def initialize
    @create_class = CreateClass.new
  end

  def create_people
    print 'Do you want to create a student (1) or a teacher (2)? [input the number]: '
    choice = gets.chomp
    if choice != '1' && choice != '2'
      puts "\n Invalid input: Please enter valid input 1 for create student or 2 for create teacher\n"
      method(:create_people).call
      return
    end
    create_student if choice == '1'
    create_teacher if choice == '2'
    puts 'Person created successfully'
  end

  def create_student
    print "\nAge: "
    age = gets.chomp
    print "\nName: "
    name = gets.chomp
    print "\nHas parent permission? [Y/N]: "
    permission_value = gets.chomp
    permission = permission_value.capitalize
    permission_value = true if permission.include?('Y')
    permission_value = false if permission.include?('N')
    @create_class.add_student(age.to_i, name, permission_value)
  end

  def create_teacher
    print "\nAge: "
    age = gets.chomp
    print "\nName: "
    name = gets.chomp
    print "\nSpecialization: "
    specialization = gets.chomp
    @create_class.add_teacher(age.to_i, name, specialization)
  end

  def create_book
    print "\nTitle: "
    title = gets.chomp
    print "\nAuthor: "
    author = gets.chomp
    @create_class.add_book(title, author)
    puts 'Book created successfully'
  end

  def create_rental
    choose_book_to_create_rental
    book_num = gets.chomp
    choose_person_to_create_rental
    person_num = gets.chomp
    print "\nDate: "
    date = gets.chomp
    @create_class.add_rental(date, book_num.to_i, person_num.to_i)
    puts 'Rental created successfully'
  end

  def handle_rental
    @create_class.people_list.length.positive? && @create_class.book_list.length.positive? && create_rental
  end

  def choose_book_to_create_rental
    puts 'Select a book from the following list by number'
    @create_class.book_list.each_with_index do |book, i|
      puts "#{i + 1}) Title: \"#{book.title}\", Author: #{book.author}"
    end
  end

  def list_rental_for_person
    print "\nID of person: "
    id = gets.chomp
    puts 'Rentals:'
    @create_class.display_rental_for_id(id.to_i)
  end

  def choose_person_to_create_rental
    puts 'Select a person from the following list by number (not id)'
    @create_class.people_list.each_with_index do |person, i|
      puts "#{i + 1}) [#{person[:type]}] Name: #{person[:value].name},"
      + " ID: #{person[:value].id}, Age: #{person[:value].age}"
    end
  end
end
