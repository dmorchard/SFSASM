mod = Sketchup.active_model # Open model
ent = mod.entities # All entities in model
sel = mod.selection # Current selection

sel.definition.add_classification("test", "properties")

# definition.add_classification("IFC 2x3", "IfcDoor")
# path = ["IFC 2x3", "IfcDoor", "ObjectType", "IfcLabel"]
# value = definition.get_classification_value(path)
