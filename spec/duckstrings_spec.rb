require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

class Foo
  ___ "Ants!"
  def self.bar
    "blah"
  end

  ___ "Monkeys!"
  def baz
    "boop"
  end

  def qux x
    [x]
  end

  class << self
    ___ "Chins!"
    def frob x, y
      [x,y]
    end
  end
end

describe "Foo" do
  it "has the expected docstrings" do
    Foo.doc_for(:bar).should == "Ants!"
    Foo.doc_for(:baz).should == "Monkeys!"
    Foo.doc_for(:qux).should be_nil
    Foo.describe
  end
end
