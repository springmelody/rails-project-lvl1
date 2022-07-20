# frozen_string_literal: true

module HexletCode
  autoload(:Html, 'hexlet_code/formatters/html')

  class Parser
    def self.convert(structure, options, format = 'html')
      (HexletCode.const_get format.capitalize).new(structure, options).build
    end
  end
end
