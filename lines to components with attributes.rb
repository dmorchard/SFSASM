mod = Sketchup.active_model # Open model
ent = mod.entities # All entities in model
sel = mod.selection # Current selection

c = 0
nodes = []

ent.each { |e|
  if e.typename == "Edge"
    nodes.push e.vertices
  end
}

nodes.flatten!
nodes.uniq!

c = 0
nodes.each { |n|
  c = c + 1
  t = ent.add_text "N" + c.to_s, n
  g = ent.add_group(t)
  g.name="N" + c.to_s
}

c = 0
ent.each { |e|
  if e.typename == "Edge"
    c = c + 1
    t = ent.add_text "M" + c.to_s, e.bounds.center
    g = ent.add_group(e,t)
    g.name="M" + c.to_s
  end
}

ent.each { |e|
  if e.typename == "Group"
    name = e.name
    c = e.to_component
    c.definition.name = name

    case name[0]
    when "M"
      c.definition.add_classification("DMO_member_input", "Member physical properties")
    when "N"
      c.definition.add_classification("DMO_node_input", "Nodal constraints, applied loads, displacements")
      c.definition.behavior.always_face_camera = true
    end
  end
}
