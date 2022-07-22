# frozen_string_literal: true

module HexletCode
  module FormTags
    class Text
      def initialize(model, key, options = {})
        @model = model
        @key = key
        @options = options
        @content = model.public_send(key)
      end

      def build
        [
          { tag: 'label', attrs: { for: @key }, content: @key.capitalize },
          { tag: 'textarea', attrs: { name: @key }.merge(@options), content: @content }
        ]
      end
    end
  end
end
