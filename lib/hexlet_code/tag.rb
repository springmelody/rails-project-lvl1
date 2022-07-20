# frozen_string_literal: true

module HexletCode
  class Tag
    def self.build(tag, attrs = {})
      content = block_given? ? yield : ''
      return "<#{tag}#{get_attr(attrs)}>#{content}</#{tag}>" if paired?(tag)

      "<#{tag}#{get_attr(attrs)}>"
    end

    def self.paired?(tag)
      single_tags = %w[input br img]
      !single_tags.include? tag
    end

    def self.get_attr(options_part)
      options_part.map { |key, value| " #{key}=\"#{value}\"" unless value.nil? }.join
    end
  end
end
