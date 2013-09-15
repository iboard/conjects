require "conjects"
require "securerandom"

class Teacher < Person
  connections :classes
  def initialize args={}
    super
    @classes= args.fetch(:classes) { [] }
  end
  def students
    @classes.map(&:students).flatten.uniq
  end
end

class Student < Person
  connections :classes
  def initialize args={}
    super
    @classes= args.fetch(:classes) { [] }
  end
  def teachers
    @classes.map(&:teacher).uniq
  end
end

class SchoolClass
  include Conjects::Arguments
  include Conjects::Connections
  argument :name
  connection :teacher
  connections :students
  def initialize args={}
    @name = args.fetch(:name)
    @teacher = args.fetch(:teacher) { nil }
    @students = args.fetch(:students) { [] }
  end
end

