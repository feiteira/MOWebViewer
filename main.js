//counter = 0
function mo_parse(node,lvl,parent_tree_node) {	
	lvl = lvl || 0
	parent_tree_node = parent_tree_node || null
	var prfx = ". ".repeat(lvl);

	// should always be true, but just in case, for each node entry
	if (node.length > 0) node.map(function(attr_pos) {		
		// skip from the tree
		if(!OMMITED_NODE_TYPES.includes(node[attr_pos].tagName)
		){
			var name = treeElementName(node[attr_pos])
			var icon_path = iconPath(node[attr_pos].tagName)
			var new_node			

			if(parent_tree_node == null){
				new_node = tree.createNode(name, false, icon_path ,	null, null, null);				
			}else{
				new_node = parent_tree_node.createChildNode(name, false, icon_path,null,null);
			}
			
			new_node.xml_node = node[attr_pos]
			new_node.xml_node.tree_node =new_node // points back to tree 
			
			parent_tree_node = new_node
		}
	})

	node.children().each(function() {
		var xml_node =  $(this)[0]
		if(xml_node.isTag("mal:area")){
			xml_node.area = xml_node.getAttribute("name")
		}
		xml_node.area = xml_node.area || xml_node.parentNode.area 

		if(xml_node.isTag("mal:service")){
			xml_node.service = xml_node.getAttribute("name")
		}
		xml_node.service = xml_node.service || xml_node.parentNode.service
		
		
		kas = xml_node
		mo_parse($(this),lvl+1,parent_tree_node)
	})
}

function processXMLFile(filepath) {
// console.info("loading " + filepath);
	jQuery.ajaxSetup({async:false});

	$.get(filepath, function(d) {		
		mo_parse($(d.documentElement))
	})
}

//$(window).on('load', function () {
//})