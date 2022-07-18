# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'hexlet_code/form'
require_relative 'hexlet_code/tag'

module HexletCode
  class Error < StandardError; end

  def self.form_for(model, options = {})
    form = HexletCode::Form.new(model, options)

    yield(form) if block_given?
    form.build_form
  end
end
