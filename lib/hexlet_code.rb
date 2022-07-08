# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'hexlet_code/form'
require_relative 'hexlet_code/tag'

module HexletCode
  class Error < StandardError; end

  def self.form_for(model, url: '#', &block)
    form = HexletCode::Form.new(model, url)
    block.call(form)
  end
end
