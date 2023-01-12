require_relative './app'

def main
  loop do
    app = App.new
    app.prompt
    user_input = app.user_input('Enter a number: ')
    app.selected_option(user_input)
  end
end

main
