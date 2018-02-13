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
			
			tree.nameMap[name] = new_node
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
		
		mo_parse($(this),lvl+1,parent_tree_node)
	})
}

function processXMLFile(filepath) {
	tree.nameMap = tree.nameMap || {};
	
// console.info("loading " + filepath);
	jQuery.ajaxSetup({async:false});

	$.get(filepath, function(d) {		
		mo_parse($(d.documentElement))
	})
}

function loadMoSpecs() {
	for (var key in configServiceDefFiles) {
		processXMLFile(configServiceDefFiles[key]);
	}
}

function selectNodeFromURL() {
	var nodePath = getUrlParameter("u");
	if (typeof nodePath !== "undefined") {
		tree.selectNodeFromPath(nodePath);
	}
}

window.onload = function() {
	tree = createTree('div_tree', 'white', null);
	div_tree = document.getElementById('div_tree');
	div_main = document.getElementById('div_main');

	tree.nodeSelectedEvent = onNodeSelect

	tree.mouseOverNodeEvent 	= function (node, span) {hoverInToMiniview(node.xml_node,span) }
	tree.mouseLeavesNodeEvent	= function (node, span) {hoverOutOfMiniview(node.xml_node,span) }

	loadMoSpecs();

	tree.drawTree();
	div_tree.appendChild(tree_fragment)

	selectNodeFromURL();
}

$(window).on("popstate", function(e) {
	selectNodeFromURL();
})
