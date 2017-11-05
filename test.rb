require_relative "field.rb"
require 'minitest/autorun'

class FieldTest < Minitest::Test
    def test_basic
        field = Field.new()
        assert_equal(field.full?(), false)
        assert_equal(field.valid?(0), true)
        (0..8).each{|num| field.update('X', num)}
        assert_equal(field.full?(), true)
        assert_equal(field.valid?(0), false)
        assert_equal(field.win?('X'), true)
        your = Field.new()
        your.update('X', 0)
        your.update('X', 4)
        your.update('X', 8)
        assert_equal(your.win?('X'), true)
        ty = Field.new()
        ty.update('X', 1)
        assert_equal(ty.win?('X'), false)
        ty.update('X', 2)
        assert_equal(ty.win?('X'), false)
        ty.update('X', 0)
        assert_equal(ty.win?('X'), true)
    end
end
