require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

class Foo
  ___ "Ants!"
  def bar
    "blah"
  end

  ___ "Monkeys!"
  def baz
    "boop"
  end

  def qux x
    [x]
  end
end

describe "Foo" do
  it "has the expected docstrings" do
    Foo.doc_for(:bar).should == "Ants!"
    Foo.doc_for(:baz).should == "Monkeys!"
    Foo.describe
  end
end
