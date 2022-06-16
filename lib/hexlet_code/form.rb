# frozen_string_literal: true

module HexletCode
  class Error < StandardError; end

  def self.form_for(struct, _attr)
    struct
  end
end
