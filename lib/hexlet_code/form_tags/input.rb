# frozen_string_literal: true

module HexletCode
  module FormTags
    autoload(:Base, 'hexlet_code/form_tags/base')

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
