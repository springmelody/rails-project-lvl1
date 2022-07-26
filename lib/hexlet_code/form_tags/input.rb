# frozen_string_literal: true

module HexletCode
  module FormTags
    class Input < Base
      def build
        [
          label,
          { tag: 'input', attrs: { name: @key, type: 'text', value: @value }.merge(@options) }
        ]
      end
    end
  end
end
