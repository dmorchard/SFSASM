mod = Sketchup.active_model # Open model
ent = mod.entities # All entities in model
sel = mod.selection # Current selection

require "matrix"

nodes = []
msup = []
add_u_X = ["DMO_node_input",
  "Nodal constraints, applied loads, displacements",
  "Constraint, tanslational, u_X"]
add_u_Y = ["DMO_node_input",
  "Nodal constraints, applied loads, displacements",
  "Constraint, tanslational, u_Y"]
add_r_Z = ["DMO_node_input",
  "Nodal constraints, applied loads, displacements",
  "Constraint, rotational, r_Z"]

ent.each { |e|
  if e.typename == "ComponentInstance" && "N" == e.definition.name[0]
    nodes.push e

  end
}
#UI.messagebox("nodes: #{nodes.length}", MB_OK)

nodes.each { |e|
  n = e.definition.name[1..-1].to_i
  u_X = e.definition.get_classification_value(add_u_X).to_i
  u_Y = e.definition.get_classification_value(add_u_Y).to_i
  r_Z = e.definition.get_classification_value(add_r_Z).to_i
  msup.push [n, u_X, u_Y, r_Z]
}
# Next we want to eliminate any node that has no constraint (i.e. is not a support)
# Remember that non-constraint may show up as "" (i.e. empty), nil or "0"
# Whereas only "1" shall be an acceptable indication of constraint

# For good measure we should bubble-sort too

msup
