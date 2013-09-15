require "conjects"
require "securerandom"

class Person
  include Conjects::Arguments
  include Conjects::Connections
  argument    :name
  connection  :mother
  connection  :father
  connections :children

  def initialize args={}
    @name    = args.fetch(:name)
    @mother  = args.fetch(:mother) { nil }
    @father  = args.fetch(:father) { nil }
    @children= args.fetch(:children) { [] }
  end

  def grandchildren
    children.map(&:children).flatten
  end

  def grandmas
    _ = []
    _ << father.mother if father
    _ << mother.mother if mother
    _.compact
  end

  def grandpas
    _ = []
    _ << father.father if father
    _ << mother.father if mother
    _.compact
  end
end
