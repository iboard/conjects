# -*- encoding : utf-8 -*-"
require "spec_helper"

describe "School Example" do

  before :all do
    @otto = Teacher.new name: "Otto Benavides"
    @andi = Student.new name: "Andi Altendorfer"
    @romy = Student.new name: "Rosemarie Reisenberger"
    @physics = SchoolClass.new( name: "Physics" )
    @math = SchoolClass.new( name: "Math" )

    Connector.one_to_many  @otto,    @physics,  as: :teacher,  of: :classes
    Connector.one_to_many  @otto,    @math,     as: :teacher,  of: :classes
    Connector.many_to_many @physics, @andi,     to: :students, of: :classes
    Connector.many_to_many @physics, @romy,     to: :students, of: :classes
    Connector.many_to_many @math,    @romy,     to: :students, of: :classes
  end

  let(:teacher) { @otto }
  let(:andi) { @andi }
  let(:romy) { @romy }
  let(:students) { [ @andi, @romy ] }
  let(:physics) { @physics }
  let(:math) { @math }

  it "Otto teaches physics" do
    expect(teacher.classes).to include(physics)
  end

  it "The theacher of math is Otto" do
    expect(math.teacher).to eq(teacher)
  end

  it "Andy studies physics" do
    expect(andi.classes).to include(physics)
  end

  it "Romy studies physics and math" do
    expect(romy.classes).to eq([physics,math])
  end

  it "Otto's students are Romy and Andy" do
    expect(teacher.students).to eq([andi,romy])
  end

  it "Romy's teacher is Otto" do
    expect(romy.teachers).to include(teacher)
  end

  it "Andy's teacher is Otto" do
    expect(andi.teachers).to include(teacher)
  end
end
