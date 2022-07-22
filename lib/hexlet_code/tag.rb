# frozen_string_literal: true

module HexletCode
  class Tag
    def self.build(tag, attrs = {})
      content = block_given? ? yield : ''
      return "<#{tag}#{get_attrs(attrs)}>#{content}</#{tag}>" if paired?(tag)

      "<#{tag}#{get_attrs(attrs)}>"
    end

    def self.paired?(tag)
      single_tags = %w[input br img]
      !single_tags.include? tag
    end

    def self.get_attrs(attrs)
      attrs.map { |key, value| " #{key}=\"#{value}\"" unless value.nil? }.join
    end
  end
end
