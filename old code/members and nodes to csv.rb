mod = Sketchup.active_model  # Open model
ent = mod.entities  # All entities in model
sel = mod.selection  # Current selection

members = []
nodes = []

sel.each { |e|
  if e.typename == "Edge"
    members.push e.entityID
    nodes.push e.vertices
  end
}

# Remove any sub-arrays & duplicates
nodes.flatten!
nodes.uniq!

filename = UI.openpanel 'Text file for node coordinates'
if filename
    f = File.open(filename, 'w')
    # Write x,y,z coordinates in specific units
    nodes.each { |n|
        f.print n.position.x.to_inch,',',n.position.y.to_inch,',',n.position.z.to_inch,"\n"
    }
    f.close    
end

filename = UI.openpanel 'Text file for member IDs'
if filename
    f = File.open(filename, 'w')
    members.each { |m|
        f.print m.to_s,"\n"
    }
    f.close
end
