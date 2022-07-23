# frozen_string_literal: true

module HexletCode
  module FormTags
    class Base
      def initialize(model, key, options = {})
        @key = key
        @options = options
        @value = model.public_send(key)
      end

      def label
        { tag: 'label', attrs: { for: @key }, content: @key.capitalize }
      end
    end
  end
end
