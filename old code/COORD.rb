mod = Sketchup.active_model # Open model
ent = mod.entities # All entities in model
sel = mod.selection # Current selection

require "matrix"

coord = []

ent.each { |e|
  if e.typename == "ComponentInstance" && "N" == e.definition.name[0]
    coord.push e.transformation.origin.to_a
  end
}
  coord = Matrix[*coord] #the array "coord" is converted to a matrix
