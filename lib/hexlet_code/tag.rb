# frozen_string_literal: true

module HexletCode
  class Error < StandardError; end

  class Tag
    def self.build(tag, attrs, &block)
      return build_paired_tag(tag, attrs, &block) if paired? tag

      build_single_tag(tag, attrs)
    end

    def self.paired?(tag)
      single_tags = %w[input br img]
      !single_tags.include? tag
    end

    def self.build_single_tag(tag, attr)
      "<#{tag} #{get_attr(attr)}>"
    end

    def self.build_paired_tag(tag, attr)
      content = block_given? ? yield : ''
      "<#{tag}#{get_attr(attr)}>#{content}</#{tag}>"
    end

    def self.get_attr(attr)
      attr.map { |key, value| " #{key}=\"#{value}\"" }.join
    end
  end
end
