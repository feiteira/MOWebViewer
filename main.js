//counter = 0
function mo_parse(node, lvl, parent_tree_node) {
	lvl = lvl || 0
	parent_tree_node = parent_tree_node || null
	// String.prototype.repeat() is not used below for IE compatibility
	var prfx = "";
	while (lvl-- > 0) {
		prfx += ". "
	}

	// should always be true, but just in case, for each node entry
	if (node.length > 0) node.map(function (attr_pos) {
		// skip from the tree
		// Array.prototype.includes() is not used below for IE compatibility
		if (OMMITED_NODE_TYPES.indexOf(node[attr_pos].tagName) === -1) {
			var node_name = treeElementName(node[attr_pos])
			var new_node = {
				"text": node_name,
				"children": [],
				"icon": iconPath(node[attr_pos].tagName),
				"id": parent_tree_node == null ? node_name : (parent_tree_node.id + "_" + node_name),
				"path": parent_tree_node == null ? node_name : (parent_tree_node.path + "/" + node_name)
			}
			if (parent_tree_node == null) {
				tree.data.push(new_node)
			} else {
				parent_tree_node.children.push(new_node)
			}

			new_node.xml_node = node[attr_pos]
			new_node.xml_node.tree_node = new_node // points back to tree
			tree.nameMap[name] = new_node
			tree.nodePathMap[new_node.path] = new_node

			parent_tree_node = new_node
		}
	})

	node.children().each(function () {
		var xml_node = $(this)[0]
		if (xml_node.isTag("mal:area")) {
			xml_node.area = xml_node.getAttribute("name")
		}
		xml_node.area = xml_node.area || xml_node.parentNode.area

		if (xml_node.isTag("mal:service")) {
			xml_node.service = xml_node.getAttribute("name")
		}
		xml_node.service = xml_node.service || xml_node.parentNode.service

		mo_parse($(this), lvl + 1, parent_tree_node)
	})
}

function processXMLFile(filepath) {
	// console.info("loading " + filepath);
	jQuery.ajaxSetup({ async: false });

	$.get(filepath, function (d) {
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
		selectNodeFromPath(nodePath);
	}
}

function selectNodeFromPath(p_node_path) {
	var tmp_node = tree.nodePathMap[p_node_path];
	if (tmp_node != null) {
		$("#div_tree").jstree("select_node", tmp_node.id);
		$("#div_tree").jstree("open_node", tmp_node.id);
	}
}

function onHoverHandler(event, data) {
	hoverInToMiniview(data.node.original.xml_node, $("#" + data.node.a_attr.id))
}

function onDehoverHandler(event, data) {
	hoverOutOfMiniview(data.node.original.xml_node, $("#" + data.node.a_attr.id))
}

function onSelectHandler(event, data) {
	onNodeSelect(data.node.original)
}

window.onload = function () {
	div_tree = document.getElementById('div_tree');
	div_main = document.getElementById('div_main');

	$("#div_tree").on("hover_node.jstree", onHoverHandler)
	$("#div_tree").on("dehover_node.jstree", onDehoverHandler)
	$("#div_tree").on("select_node.jstree", onSelectHandler)

	tree = {}
	tree.nodePathMap = {}
	tree.nameMap = {}
	tree.data = []
	loadMoSpecs();

	$("#div_tree").jstree({
		"core": {
			"multiple": false, // No multiselection
			"animation": false, // No animation
			"data": tree.data
		},
	});

	selectNodeFromURL();
}

$(window).on("popstate", function (e) {
	selectNodeFromURL();
})
