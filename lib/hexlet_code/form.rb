# frozen_string_literal: true

module HexletCode
  module FormTags
    autoload(:Input, 'hexlet_code/form_tags/input')
    autoload(:Text, 'hexlet_code/form_tags/text')
  end

  module Formatters
    autoload(:Html, 'hexlet_code/formatters/html')
  end

  class Form
    def initialize(model)
      @model = model
      @result = []
    end

    def input(key, **options)
      type = options[:as] || :input
      @result << (FormTags.const_get type.capitalize).new(@model, key, options).build
    end

    def submit(value = 'Save')
      @result << { tag: 'input', attrs: { name: 'commit', type: 'submit', value: value } }
    end

    def generate_structure
      @result.flatten(1)
    end

    def self.convert(structure, options, format = 'html')
      (Formatters.const_get format.capitalize).new(structure, options).build
    end
  end
end
