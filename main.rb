require_relative './app'

def main
  app = App.new
  loop do
    app.prompt
    user_input = app.user_input('Enter a number: ')
    app.selected_option(user_input)
  end
end

main
