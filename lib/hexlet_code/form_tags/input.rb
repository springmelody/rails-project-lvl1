# frozen_string_literal: true

module HexletCode
  autoload(:Tag, 'hexlet_code/tag')

  class Input
    def initialize(model, key, kwargs = {})
      @key = key
      @kwargs = kwargs
      @value = model.public_send(key)
    end

    def label
      Tag.build('label', { for: @key }) { @key.capitalize }
    end

    def input
      Tag.build('input', { name: @key, type: 'text', value: @value }.merge(@kwargs))
    end

    def build
      [label, input]
    end
  end
end
