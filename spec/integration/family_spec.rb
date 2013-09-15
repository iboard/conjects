# -*- encoding : utf-8 -*-"
require "spec_helper"

describe "Family Example" do

  before :all do
    # Altendorfers
    @grete  = Person.new name: "Grete"
    @rudolf = Person.new name: "Rudolf"
    @rudi   = Person.new name: "Rudi"
    @andi   = Person.new name: "Andi"

    # Prokops
    @gerda  = Person.new name: "Gerda"
    @helmut = Person.new name: "Helmut"
    @heidi  = Person.new name: "Heidi"
    @elke   = Person.new name: "Elke"

    # Grandchildren
    @jan   = Person.new name: "Jan"
    @hannah= Person.new name: "Hannah"
    @julian= Person.new name: "Julian"
    @tina  = Person.new name: "Tina"
    @michi = Person.new name: "Michi"
    @alex  = Person.new name: "Alex"

    Connector.one_to_many @grete,  @rudi,    as: :mother,   of: :children
    Connector.one_to_many @grete,  @andi,    as: :mother,   of: :children
    Connector.one_to_many @rudolf, @rudi,    as: :father,   of: :children
    Connector.one_to_many @rudolf, @andi,    as: :father,   of: :children
    Connector.one_to_many @gerda,  @elke,    as: :mother,   of: :children
    Connector.one_to_many @helmut, @elke,    as: :father,   of: :children
    Connector.one_to_many @gerda,  @heidi,   as: :mother,   of: :children
    Connector.one_to_many @helmut, @heidi,   as: :father,   of: :children
    Connector.one_to_many @elke,   @jan,     as: :mother,   of: :children
    Connector.one_to_many @elke,   @hannah,  as: :mother,   of: :children
    Connector.one_to_many @heidi,  @julian,  as: :mother,   of: :children
    Connector.one_to_many @heidi,  @tina,    as: :mother,   of: :children
    Connector.one_to_many @andi,   @julian,  as: :father,   of: :children
    Connector.one_to_many @andi,   @tina,    as: :father,   of: :children
    Connector.one_to_many @rudi,   @michi,   as: :father,   of: :children
    Connector.one_to_many @rudi,   @alex,    as: :father,   of: :children
  end

  let(:grete) { @grete }
  let(:rudolf) { @rudolf }
  let(:rudi) { @rudi }
  let(:andi) { @andi }
  let(:gerda) { @gerda }
  let(:helmut) { @helmut }
  let(:heidi) { @heidi }
  let(:elke) { @elke }
  let(:jan) { @jan }
  let(:hannah) { @hannah }
  let(:julian) { @julian }
  let(:tina) { @tina }
  let(:alex) { @alex }
  let(:michi) { @michi }


  it "Rudolf's and Grete's children are Rudi and Andi"  do
    expect( grete.children ).to eq( [rudi, andi] )
    expect( rudolf.children ).to eq([rudi,andi])
  end

  it "Rudi's parents are Grete and Rudolf" do
    expect( rudi.father ).to eq( rudolf )
    expect( rudi.mother ).to eq( grete )
  end

  it "Andi's parents are Grete and Rudolf" do
    expect( andi.father ).to eq( rudolf )
    expect( andi.mother ).to eq( grete )
  end


  it "Gerda's and Helmut's children are Elke and Heidi" do
    expect( helmut.children ).to eq([elke,heidi])
    expect( gerda.children ).to eq([elke,heidi])
  end

  it "Heidi's parents are Gerda and Helmut" do
    expect( heidi.mother ).to eq(gerda)
    expect( heidi.father).to eq(helmut)
  end

  it "Elkes's parents are Gerda and Helmut" do
    expect( elke.mother ).to eq(gerda)
    expect( elke.father).to eq(helmut)
  end

  it "Heidi's and Andi's children are Julian and Tina" do
    expect( andi.children ).to eq([julian,tina])
    expect( heidi.children ).to eq([julian,tina])
  end

  it "Julian's parents are Andi and Heidi" do
    expect( julian.mother ).to eq(heidi)
    expect( julian.father).to eq(andi)
  end

  it "Tina's parents are Andi and Heidi" do
    expect( tina.mother ).to eq(heidi)
    expect( tina.father).to eq(andi)
  end

  it "Elke's children are Jan and Hannah" do
    expect( elke.children ).to eq([ jan, hannah ])
  end

  it "Hannah's ma is Elke" do
    expect( hannah.mother ).to eq(elke)
  end

  it "Jan's ma is Elke" do
    expect( jan.mother ).to eq(elke)
  end

  it "Andi's and Heidi's children has the same grandmas" do
    expect( tina.grandmas ).to eq( [grete, gerda] )
    expect( julian.grandmas ).to eq( [grete, gerda] )
  end

  it "Elke's children has the same grandmas" do
    expect( jan.grandmas).to eq( [gerda] )
    expect( hannah.grandmas).to eq( [gerda] )
  end

  it "Andi's and Heidi's children has the same grandpas" do
    expect( tina.grandpas ).to eq( [rudolf, helmut] )
    expect( julian.grandpas ).to eq( [rudolf, helmut] )
  end

  it "Elke's children has the same grandpas" do
    expect( jan.grandpas).to eq( [helmut] )
    expect( hannah.grandpas).to eq( [helmut] )
  end

  it "Gerda and Helmut have 4 grandchildren" do
    expect( gerda.grandchildren ).to eq( [jan,hannah,julian,tina] )
    expect( helmut.grandchildren ).to eq( [jan,hannah,julian,tina] )
  end

  it "Grete and Rudolf have 4 grandchildren" do
    expect( grete.grandchildren ).to eq( [michi,alex,julian,tina] )
    expect( rudolf.grandchildren ).to eq( [michi,alex,julian,tina] )
  end

end
