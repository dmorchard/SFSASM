mod = Sketchup.active_model # Open model
ent = mod.entities # All entities in model
sel = mod.selection # Current selection

require "matrix"

nodes = []
ns = []
coord = []

ent.each { |e|
  if e.typename == "ComponentInstance" && "N" == e.definition.name[0]
    nodes.push e
    ns.push e.definition.name
  end
}

  n = nodes.length
  UI.messagebox(n,MB_OK)
loop do
    swapped = false

    (n-1).times do |i|
      if ns[i] > ns[i+1]
        nodes[i], nodes[i+1] = nodes[i+1], nodes[i]
        ns[i], ns[i+1] = ns[i+1], ns[i]
        swapped = true
      end
    end
    break if not swapped
end

nodes.each { |e|
  coord.push e.transformation.origin.to_a
}

coord = Matrix[*coord] #the array "coord" is converted to a matrix