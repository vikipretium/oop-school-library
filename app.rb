require './display'
require './user_interaction'

# app class
class App
  attr_reader :create_class

  def initialize
    @user_interaction = UserInteraction.new
    @create_class = @user_interaction.create_class
  end

  def display_app
    puts "\nPlease choose an option by enter a number:"
    puts ['1 - List all books', '2 - List all people', '3 - Create a person',
          '4 - Create a book', '5 - Create a rental', '6 - List all rentals for a given person id',
          '7 - Exit']
  end

  def choose_action
    decision = gets.chomp
    puts 'please choose of the list' unless '1234567'.include?(decision)
    decision == '7' && exit_program
    methods = [
      method(:display_books), method(:display_people), method(:create_people),
      method(:create_book), method(:handle_rental), method(:list_rental_for_person)
    ]
    '123456'.include?(decision) && methods[decision.to_i - 1].call
  end

  def exit_program
    puts 'Thank you for using this app!'
    exit
  end

  def display_books
    Display.new.display_books(@create_class.book_list)
  end

  def display_people
    Display.new.display_people(@create_class.people_list)
  end

  def create_people
    @user_interaction.create_people
  end

  def create_book
    @user_interaction.create_book
  end

  def handle_rental
    @user_interaction.handle_rental
  end

  def list_rental_for_person
    Display.new.display_rental_for_id(@create_class.rental_list)
  end
end
