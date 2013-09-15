# -*- encoding : utf-8 -*-"

module Conjects

  # Base class of all connectors.
  #
  # When you derive your own class from _Connector_, implement the method `add_connection` as
  # shown in the derived classes implemented here. This `add_connection` will be called twice.
  # One time for the left, one time for the right object of the connection.
  class Connector

    # Initialize and connect using a OneToManyConnector
    # @param [Object] left
    # @param [Object] right
    # @option *options [Symbol] :as argument-name to be assigned in right object
    # @option *options [Symbol] :of array to be added to on left object
    def self.one_to_many left, right, *options
      OneToManyConnector.new left, right, *options
    end

    # Initialize and connect using a ManyToManyConnector
    # @param [Object] left
    # @param [Object] right
    # @option *options [Symbol] :to array to be appended to on the left object
    # @option *options [Symbol] :of array to be appended to on the right object
    def self.many_to_many left, right, *options
      ManyToManyConnector.new left, right, *options
    end

    # Initialize and connect using a OneToOneConnector
    # @param [Object] left
    # @param [Object] right
    # @option *options [Symbol] :as value to be set on left object.
    # @option *options [Symbol] :of value to be set on right object.
    def self.one_to_one left, right, *options
      OneToOneConnector.new left, right, *options
    end

    def initialize left, right, *options
      @left = left
      @right= right
      connect *options
    end

    # Connect left and right as defined in options.
    # @param [Hash] options
    # @see one_to_one
    # @see one_to_many
    # @see many_to_many
    def connect options
      left_opts = options.shift
      right_opts= options.shift

      add_connection( @left,  @right, left_opts )
      add_connection( @left,  @right, right_opts )
    end

  end

  # The One-To-Many Connector
  class OneToManyConnector < Connector

    # Assign left to right's attribute. And add right to left's array.
    # @param [Object] left
    # @param [Object] right
    # @see many_to_many Connector for a list of possible options
    def add_connection left, right, options
      case options[0]
      when :as
        right.link( options[1], left )
      when :of
        left.add(options[1], right )
      end
    end

  end

  # The Many-To-Many Connector
  class ManyToManyConnector < Connector

    # Add right to left's array and left to right's array.
    # @param [Object] left
    # @param [Object] right
    # @see many_to_many Connector for a list of possible options
    def add_connection left, right, options
      case options[0]
      when :to
        left.add options[1], right
      when :of
        right.add options[1], left
      end
    end

  end

  # The OneToOne Connector
  class OneToOneConnector < Connector

    # Set value on left object to right and value of right object to left
    # @param [Object] left
    # @param [Object] right
    # @see one_to_one Connector for a list of possible options
    def add_connection left, right, options
      case options[0]
      when :as
        left.link options[1], right
      when :of
        right.link options[1], left
      end
    end
  end

end
