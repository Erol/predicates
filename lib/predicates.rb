require "predicates/version"

module Predicates
  class NameError < Exception; end

  # Defines a predicate (truth accessor) for a given attribute. If the attribute has not been defined yet,
  # the attribute will be created along with the predicate via +attr_accessor+.
  #
  # == Class Example
  #
  #   class User
  #     extend Predicates
  #
  #     predicate :confirmed?
  #   end
  #
  #   user = User.new
  #   user.single = 1
  #   user.confirmed? #=> true
  #   user.single = nil
  #   user.confirmed? #=> false
  #
  # == Ohm Model Example
  #
  #   class User < Ohm::Model
  #     include Predicates
  #
  #     attribute :confirmed
  #     predicate :confirmed?
  #   end
  #
  #   user = User.new
  #   user.confirmed = 1
  #   user.confirmed? #=> true
  #   user.confirmed = nil
  #   user.confirmed? #=> false

  def predicate(method)
    if method.to_s =~ /(.*?)\?+$/
      attribute = $1.to_sym
    else
      raise NameError
    end

    attr_accessor attribute unless method_defined? attribute

    define_method method do
      !!send(attribute)
    end
  end
end
