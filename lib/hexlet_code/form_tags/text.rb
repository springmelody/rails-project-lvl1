# frozen_string_literal: true

module HexletCode
  module FormTags
    autoload(:Base, 'hexlet_code/form_tags/base')

    class Text < Base
      def build
        cols = @options.fetch(cols, '20')
        rows = @options.fetch(rows, '40')

        [
          label,
          { tag: 'textarea', attrs: { cols: cols, rows: rows, name: @key }.merge(@options), content: @value }
        ]
      end
    end
  end
end
