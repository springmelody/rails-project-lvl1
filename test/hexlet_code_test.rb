# frozen_string_literal: true

require 'test_helper'

User = Struct.new(:name, :job, :gender, keyword_init: true)

class HexletCodeTest < Minitest::Test
  def test_form
    user = User.new name: 'rob', job: 'hexlet', gender: 'm'
    expected = File.read("#{File.dirname(__FILE__)}/fixtures/form.html").strip
    result = HexletCode.form_for user do |f|
      f.input :name
      f.input :job, as: :text
      f.submit
    end
    assert { expected == result }
  end

  def test_form_simple
    user = User.new name: 'rob', job: 'hexlet', gender: 'm'
    expected = File.read("#{File.dirname(__FILE__)}/fixtures/form_simple.html").strip
    result = HexletCode.form_for user do |f|
      f.input :name
    end
    assert { expected == result }
  end
end
