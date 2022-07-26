# frozen_string_literal: true

module HexletCode
  module Formatters
    class Html
      def initialize(structure, options)
        @structure = structure
        @options = options
        @url = options[:url] || '#'
        @result = []
      end

      def build
        @structure.each do |item|
          tag, attrs, content = item.values_at(:tag, :attrs, :content)
          @result << Tag.build(tag, attrs) { content }
        end
        Tag.build('form', { action: @url, method: 'post' }.merge(@options.except(:url))) { @result.join }
      end
    end
  end
end
