# frozen_string_literal: true

module HexletCode
  module Formatters
    autoload(:Html, 'hexlet_code/formatters/html')
  end

  class Parser
    def self.convert(structure, options, format = 'html')
      (Formatters.const_get format.capitalize).new(structure, options).build
    end
  end
end
