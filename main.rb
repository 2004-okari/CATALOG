# frozen_string_literal: true

require_relative 'user_interactions'

def main
  app = UserInteractions.new
  app.run
end

main
