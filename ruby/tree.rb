class Tree
  attr_accessor :children, :node_name

  def initialize(name, children=[])
    @children = children
    @node_name = name
  end

  def visit_all(&block)
    visit(&block)
    children.each { |c| c.visit_all(&block)}
  end

  def visit(&block)
    block.call self
  end
end

ruby_tree = Tree.new(
  "Ruby",
  [
    Tree.new("Reia"),
    Tree.new("MacRuby")
  ]
)

ruby_tree.visit { |node| puts node.node_name }
ruby_tree.visit_all { |node| puts node.node_name }

class BetterTree
  attr_accessor :children, :node_name

  def initialize(structure={})
    @node_name = structure.keys.first
    @children = structure[@node_name].map do |name, value|
      BetterTree.new({ "#{name}": value })
    end
  end

  def visit_all(&block)
    visit(&block)
    children.each { |c| c.visit_all(&block)}
  end

  def visit(&block)
    block.call self
  end
end

better_tree = BetterTree.new(
  {
    'grandpa': {
      'dad': {
        'child1': {},
        'child2': {}
      },
      'uncle': {
        'child3': {},
        'child4': {}
      }
    }
  }
)

better_tree.visit { |node| puts node.node_name }
better_tree.visit_all { |node| puts node.node_name }
