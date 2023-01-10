require_relative './app'

def main
  app = App.new
  app.prompt
  app.get_input
end

main
