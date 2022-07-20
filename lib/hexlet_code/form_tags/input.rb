# frozen_string_literal: true

module HexletCode
  class Input
    def initialize(model, key, options = {})
      @key = key
      @options = options
      @value = model.public_send(key)
    end

    def build
      [
        { tag: 'label', attrs: { for: @key }, content: @key.capitalize },
        { tag: 'input', attrs: { name: @key, type: 'text', value: @value }.merge(@options) }
      ]
    end
  end
end
