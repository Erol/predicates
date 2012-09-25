require_relative 'test_helper.rb'

require 'predicates.rb'

class WithPredicates
  extend Predicates
end

class PredicatesTest < MiniTest::Unit::TestCase
  def test_predicate_names_must_contain_a_question_mark
    assert_raises Predicates::NameError do
      Class.new WithPredicates do
        predicate :name
      end
    end

    assert_silent do
      Class.new WithPredicates do
        predicate :name?
      end
    end
  end

  def test_define_a_predicate_with_a_predefined_attribute_accessor
    klass = Class.new WithPredicates do
      attr_accessor :attribute
      predicate :attribute?
    end

    object = klass.new

    assert object.respond_to?(:attribute?)

    object.attribute = 1
    assert object.attribute?

    object.attribute = true
    assert object.attribute?

    object.attribute = nil
    refute object.attribute?
  end

  def test_define_a_predicate_with_only_a_predefined_attribute_reader
    klass = Class.new WithPredicates do
      attr_reader :attribute
      predicate :attribute?

      def initialize
        @attribute = 1
      end
    end

    object = klass.new

    assert object.respond_to?(:attribute?)
    refute object.respond_to?(:attribute=)

    assert object.attribute?
  end

  def test_define_a_predicate_with_only_a_predefined_attribute_method
    klass = Class.new WithPredicates do
      def attribute
        1
      end

      predicate :attribute?
    end

    object = klass.new

    assert object.respond_to?(:attribute?)
    refute object.respond_to?(:attribute=)

    assert object.attribute?
  end

  def test_define_a_predicate_with_only_a_predefined_attribute_writer
    klass = Class.new WithPredicates do
      attr_writer :attribute
      predicate :attribute?
    end

    object = klass.new

    assert object.respond_to?(:attribute?)
    refute object.respond_to?(:attribute)

    object.attribute = 1
    assert object.attribute?

    object.attribute = true
    assert object.attribute?

    object.attribute = nil
    refute object.attribute?
  end

  def test_define_a_predicate_with_no_predefined_attribute_accessor
    klass = Class.new WithPredicates do
      predicate :attribute?
    end

    object = klass.new

    assert object.respond_to?(:attribute?)
    assert object.respond_to?(:attribute=)
    refute object.respond_to?(:attribute)

    object.attribute = 1
    assert object.attribute?

    object.attribute = true
    assert object.attribute?

    object.attribute = nil
    refute object.attribute?
  end
end
