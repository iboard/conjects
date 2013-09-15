# -*- encoding : utf-8 -*-"

module Conjects

  # Base class of all connectors
  class Connector

    # Initialize a OneToMany-connector
    # @param [Object] left
    # @param [Object] right
    # @param [Hash] options
    # @option options as: [Symbol] argument-name to be assigned in right object
    # @option options of: [Symbol] argument-name to be added to on left object
    def self.one_to_many left, right, *options
      OneToManyConnector.new left, right, *options
    end

    # Initialize a OneToMany-connector
    # @param [Object] left
    # @param [Object] right
    # @param [Hash] options
    # @option options to: [Symbol] argument-name to be added to on left object
    # @option options of: [Symbol] argument-name to be added to on right object
    def self.many_to_many left, right, *options
      ManyToManyConnector.new left, right, *options
    end

    def initialize left, right, *options
      @left = left
      @right= right
      connect *options
    end

    # Connect left and right as defined in options
    # @param [Hash] options - see [one_to_many] and [many_to_many]
    def connect options
      left_opts = options.shift
      right_opts= options.shift

      add_connection( @left,  @right, left_opts )
      add_connection( @left,  @right, right_opts )
    end

  end

  # The One-To-Many Connector
  class OneToManyConnector < Connector

    # Add right to left or left to right as defined in options.
    # Where one side is a single value and the other side is an Array
    # see [one_to_many]
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

    # Add right to left or left to right as defined in options.
    # Where we have Arrays on both sides
    # see [many_to_many]
    def add_connection source, target, options
      case options[0]
      when :to
        source.add options[1], target
      when :of
        target.add options[1], source
      end
    end

  end

end
