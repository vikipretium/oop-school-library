require './app'

def main
  puts "\nWelcome to School Library App!\n"
  app = App.new
  loop do
    app.display_app
    app.choose_action
  end
end

main
