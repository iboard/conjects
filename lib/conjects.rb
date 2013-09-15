require "conjects/version"
require "conjects/arguments/arguments"
require "conjects/connections/connections"
require "conjects/connections/connector"

# Module Conjects connects objects with one_to_many and many_to_many relations
# @example
#
#     class Person
#       argument :name
#       connect  :father
#       connect  :mother
#       connects :children
#       connects :brothers
#       connects :sisters
#       def initialize _name
#         name = _name
#       end
#     end
#
#     father = Person.new name: 'Frank'
#     mother = Person.new name: 'Gail'
#     son1   = Person.new name: 'Ahmet'
#     son2   = Person.new name: 'Dweezil'
#     daughter=Person.new name: 'Moon'
#
#     Connector.one_to_many father, son1,      as: :father,   of: :children
#     Connector.one_to_many father, son2,      as: :father,   of: :children
#     Connector.one_to_many father, daughter,  as: :father,   of: :children
#     Connector.one_to_many mother, son1,      as: :mother,   of: :children
#     Connector.one_to_many mother, son2,      as: :mother,   of: :children
#     Connector.one_to_many mother, daughter,  as: :mother,   of: :children
#
#     Connector.many_to_many son1, daughter,   to: :sisters , of: brothers
#     Connector.many_to_many son2, daughter,   to: :sisters,  of: brothers
#     Connector.many_to_many son1, son2    ,   to: :brothers, of: brothers
#
#     son1.father        # => Frank
#     son2.mother        # => Gail
#     son1.sisters       # => Moon
#     daughter.father    # => Frank
#     daughter.mother    # => Gail
#
#     father.children    # => Moon, Dweezil
#     mother.children    # => Moon, Dweezil
#
#     son1.brothers      # => Dweezil
#     son1.sisters       # => Moon
#     daughter.brothers  # => Ahmet, Dweezil
#
module Conjects
end
