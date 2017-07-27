mod = Sketchup.active_model # Open model
ent = mod.entities # All entities in model
sel = mod.selection # Current selection

#UI.messagebox(,M_OK)

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
