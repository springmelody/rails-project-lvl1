# frozen_string_literal: true

module HexletCode
  module FormTags
    class Text < Base
      def build
        [
          label,
          { tag: 'textarea', attrs: { cols: 20, rows: 40, name: @key }.merge(@options), content: @value }
        ]
      end
    end
  end
end
