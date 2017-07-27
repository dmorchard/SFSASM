# SFSASM (pre-alpha)
Space frame structural analysis by stiffness matrix... via Ruby in SketchUp

## Goals
- In short: create a poor man's Robobat-Revit funcionality via a plugin in SketchUp
- Integrate the basic capabilities of proprietary structural analysis software (i.e. RISA 3D, WoodWorks Sizer) into SketchUp such that there is less disconnect between the initial conceptual/aesthetic phase of design, the middle iterative structural engineering phase, and the final phase of design that results in shop drawings and/or construction drawings.
- The anticipated user is a P.Eng with projects of residential or light commercial/industrial scale, especially those involving timber frame & post frame
- Development will be specific to a Canadian Limit States Design context, but with an eye towards being as generic as is practical

## References
### Structural theory
- Matrix Analysis of Structures; Kassimali, Aslam
- Matrix Analysis of Structures, 2nd SI Edition; Kassimali, Aslam
- Structural Analysis, 6th Edition; Hibbeler, R.C.
- Structural Analysis, 8th Edition; Hibbeler, R.C.
- Annigeri's algorithm for numbering DsOF (http://www.annigeri.in/2012/04/direct-stiffness-method-dof-numbering.html)
### Applicable codes & design guidance...
- CAN/CSA O86-14, Engineering design in wood
- NBCC-2015, National Building Code of Canada, Vol. 1, Div. B, Part 4 - Structural Design
- NFBA's Post Frame Building Design Manual (PFBDM 2015)
- Diaphragm and Frame Interaction (DAFI) theory and documentation (link to papers by Bohnhoff...)
- ANSI-ASAE EP484.2 FEB2003 - Diaphragm Design of Metal-Clad, Wood-Frame Rectangular Buildings
- ANSI-ASAE EP486.1 DEC1999 (R2005) - Shallow Post Foundation Design
- ANSI-ASAE EP559  FEB2003 - Design Requirements and Bending Properties for Mechanically Laminated Columns
- ASABE-152190408 Lateral Strength and Stiffness of Post and Pier Foundations, Bohnhoff 2015
### Previous efforts of dmorchard...
- DMO_PFSA_2016.xlsm, a proof-of-concept written in VBA able to handle 2D (a.k.a. plane frame) structures
- BA DAFI calculator.xlsm, a proof-of-concept written in VBA to perform a DAFI analysis
### Other feely available, relevant tools...
- Diaphragm and Frame Interaction (DAFI) calculator (http://www.nfba.org/index.php/resources/technical)
- various SketchUp extensions by Daiku (Clark Bremer) relevant to timber frame design & fabrication (http://extensions.sketchup.com/en/user/2666/store)
- "Face centroid & properties" SketchUp extension by Alex Schreyer (https://github.com/alexschreyer/Face-Centroid-and-Properties-Plugin)
### Ruby documentaion...
- http://ruby-for-beginners.rubymonstas.org/index.html
- matrix class (http://ruby-doc.org/stdlib-2.0.0/libdoc/matrix/rdoc/Matrix.html)
- (under construction)

## Planned features...
- [ ] Basic/generic structural analysis of space frames via the stiffness method
	- Get it functioning with "spoon fed" inputs
	- Use solved examples from Hibbeler & Kassimali to bug test
- [ ] I/O w/ any existing SketchUp model...
	- For purposes of analysis user would need to create a wireframe by "tracing" inside modeled structural elements and wrap those lines into a group/component with a predetermined name (i.e. "structural_wireframe")
	- Proof-of-concept coding has already demonstrated automation of the next step: labeling members and nodes.  Beyond that, retreival of nodal coordinates, member lengths and other simple geometric inputs required by the stiffness analysis will also be automated, as will the addition of attribute definitions to nodes and members, where further user-defined properties will be stored
	- More user input will be required to set parameters such as member properties (E, I, A...), nodal support conditions (restrained DsOF), application of design loads (represented by more sub-components with attributes)
	- Automatic graphical indication of structural inadequacy; at a coarse level this could be via colour-coding of members; at a fine level this could be via an overlay of a member's 
- [ ] Shear (V), moment (M), rotation & deflection diagrams...
	- Once stiffness matrices have been solved, reaction forces, nodal displacements and internal member forces can be used to determine the shear, moment, rotation and deflection diagrams of each member, including identification of x-intercepts, local max/min values and other points of interest.  This was a convoluted but ultimately manageable process via VBA in MS Excel (DMO_PFSA_2016.xlsm)
	- Try using Bezier curves to accomplish the necessary graphical representation in SketchUp
- [ ] Timber connection analysis...
	- Daiku's TF Rubies already provide a method of defining connection geometry; the user could be asked to identify critical shear planes and/or net areas (more SketchUp components w/ attributes)
- [ ] DAFI analysis for post frame structures...
	- Include compatibility for spliced multi-ply lumber posts (more SketchUp components w/ attributes)
	- Include modeling of soil interactions via spring stiffness (more SketchUp components w/ attributes)
- [ ] Use of "preset" files for user-defined default section/material properties
- [ ] Support for composite members such as box beams & flitch beams
