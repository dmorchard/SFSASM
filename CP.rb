mod = Sketchup.active_model # Open model
ent = mod.entities # All entities in model
sel = mod.selection # Current selection

path = ["DMO_member_input", "Member physical properties", "A, area"]
sel[0].definition.get_classification_value(path)
