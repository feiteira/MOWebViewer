//DOM patches
Node.prototype.getAttributeNames = Node.prototype.getAttributeNames || function(){var y = this; return Object.keys(y.attributes).map(function(x){return y.attributes[x].name})}

// DOM Addons
// index is optional, if < 0 then returns the full array, otherwise, the
// position in the provided index
Node.prototype.childrenByTag = function(tag,index=-1){
	var self = this
	if(self.tagMap){
		if(index <= -1)
			return self.tagMap[tag]
		if(self.tagMap[tag])
			return self.tagMap[tag][index]
		
		return null;
	}
	
	// if here, then initiate the map
	self.tagMap = {}
	$(self).children().each(function(c) {
		self.tagMap[self.children[c].tagName] = self.tagMap[self.children[c].tagName] || []
		self.tagMap[self.children[c].tagName].push(self.children[c])
	})

	// now we're sure the map has been initiated
	return self.childrenByTag(tag,index)
}

Node.prototype.isTag = function(tag){
	var self = this
	return (self.tagName == tag)
}

Node.prototype.eachTag = function(tag,func){
	var self = this
	if(self.childrenByTag(tag)){
		self.childrenByTag(tag).map(function(n){
			func(n)
		})
	}
}




// Constants

TABLE_COMMENT_LENGTH_LIMIT = 80
COMMENT_MIN_WORDS = 12

SERVICE_HEADER = [ "Area Identifier", "Service Identifier", "Area Number",
	"Service Number", "Area Version" ]

OP_LIST_HEADER = [ "Interaction Pattern", "Operation Identifier",
	"Operation Number", "Support in Replay", "Capability Set" ]

ENUM_LIST_HEADER = ["Enumeration Value", "Numerical Value", "Comment"]

ERROR_HEADER = [ "Error", "Comment", "Extra Info - Type", "Extra Info - Comment" ]


LONG_NAMES = {
		"mal:submitIP" 	: "Submit",
		"mal:requestIP" : "Request",
		"mal:invokeIP" 	: "Invoke",
		"mal:progressIP": "Progress",
		"mal:pubsubIP" 	: "Pub-Sub",
		// COM
		"com:events"			: "Events",
		// "com:objects" : "Objects",
		// Others
		"mal:dataTypes"			: "Data",
}

MESSAGE_NAMES = {
		"mal:invoke"			: "Invoke",
		"mal:acknowledgement"	: "Ack",
		"mal:response"			: "Response",		
		"mal:request"			: "Request",		
		"mal:progress"			: "Progress",
		"mal:update"			: "Update",
		"mal:submit"			: "Submit",
		"mal:publishNotify"		: "Publish / Notify",
}

IN_OR_OUT = {
		"mal:invoke"			: "IN",
		"mal:request"			: "IN",
		"mal:progress"			: "IN",
		"mal:submit"			: "IN",

		"mal:update"			: "OUT",
		"mal:acknowledgement"	: "OUT",
		"mal:response"			: "OUT",
		"mal:publishNotify"		: "OUT",
}

// these nodes will be processed but skipped from the tree. their children will
// be the children of these' nodes parents
OMMITED_NODE_TYPES = [ "mal:specification", "mal:capabilitySet",
	"mal:documentation", "mal:messages", "mal:errors", "com:features",
	"mal:errorRef",
	 // "mal:dataTypes",
	"mal:item","mal:type","mal:extends","mal:field","mal:extraInformation",
	// IP related
	"mal:invoke","mal:acknowledgement","mal:response","mal:request","mal:progress","mal:update","mal:submit","mal:publishNotify",
	// COM related
	// "com:events",
	]


OMMITED_TYPE_NAME_IN_TREE = [ "mal:area", "mal:service" , "mal:composite","mal:error",
	]

TAG_TO_ICON = {
		"unknown" 		: "fff/asterisk_yellow.png",

		"mal:area" 		: "fff/report.png",
		"mal:service" 	: "fff/page_white_stack.png",
		"mal:sendIP" 	: "fff/page_white.png",
		"mal:requestIP" : "fff/page.png",
		"mal:submitIP" 	: "fff/page_green.png",
		"mal:progressIP": "fff/page_red.png",
		"mal:invokeIP" 	: "fff/page_purple.png",
		"mal:pubsubIP" 	: "fff/page_orange.png",

		"mal:errorRef" 	: "fff/link_error.png",

		"mal:fundamental" 	: "fff/tag_blue.png",
		"mal:attribute" 	: "fff/tag_green.png",
		"mal:enumeration" 	: "fff/tag_red.png",

		"mal:error" 		: "fff/error.png",

		"mal:dataTypes" 	: "fff/bricks.png",
		"mal:composite" 	: "fff/brick.png",		
// COM types
		"com:events" 	: "fff/page_bell.png",
		"com:event" 	: "fff/bell.png",
		"com:object" 	: "fff/database.png",
		"com:objects" 	: "fff/page_white_database.png",
}

function iconPath(tag) {
	if (tag in TAG_TO_ICON) {
		return "icons/" + TAG_TO_ICON[tag]
	}
	return "icons/" + TAG_TO_ICON["unknown"];
}

function tableRow(headers) {
	var row = document.createElement("tr");

	// header row
	for (str_cnt in headers) {
		var cell = document.createElement("td");
		cell.innerHTML = headers[str_cnt];
		row.appendChild(cell)
	}
	return row
}


function treeElementTag(element) {
	var tag = element.tagName

	// shows only node name, but not the type (e.g. 'mal:area' will never be
	// shown)
	if (OMMITED_TYPE_NAME_IN_TREE.includes(tag)) {
		tag = null
	} else if (tag in LONG_NAMES) {
		tag = LONG_NAMES[tag]
	}
	return tag
}


function treeElementName(element) {
	var name
	
	if (element.getAttribute("name") == null) {
		name = treeElementTag(element)
	} 
	else {
		name = element.getAttribute("name")
	}
	return name
}



// ------------------ Table helpers ----------------------

function td_with_element(elem){
	var cell = document.createElement("td");
	cell.appendChild(elem)
	return cell
}

function td_with_text(text,span = 1) {
	var cell = document.createElement("td");
	cell.innerHTML = text.replace(/\n/g,"\n<br/>")
	if(span > 1)
		cell.setAttribute("colspan",span)
		return cell
}

function blue_td_with_text(text,span = 1){
	var cell = td_with_text(text,span)
	cell.setAttribute("class", "blue_bg");
	return cell
}

function gray_td_with_text(text,span = 1){
	var cell = td_with_text(text,span)
	cell.setAttribute("class", "gray_bg");
	return cell
}

function str_mal_node_type(node){
	return str_mal_type(node.children[0])
}

function str_mal_type(type){
	var type_str = ""

	var appendIf = function(a){	if(type.getAttribute(a)) type_str+= type.getAttribute(a) +":"}

	appendIf("area")
	appendIf("service")

	type_str += type.getAttribute("name")
	
	// remove current area
	if(type.area){
		var area_prefix = type.area + ":"
		if(type_str.indexOf(area_prefix) == 0)
			type_str = type_str.slice(type_str.indexOf(area_prefix)+area_prefix.length)
	}

	// remove current service
	if(type.service){
		var service_prefix = type.service + ":"
		if(type_str.indexOf(service_prefix) == 0)
			type_str = type_str.slice(type_str.indexOf(service_prefix)+service_prefix.length)
	}
	
	if(type.getAttribute("list") == "true"){
		type_str = "List&lt;" + type_str + "&gt; "
	}

	return type_str
}


function str_mal_field(node){
	return str_mal_type(node) + " " + node.getAttribute("name")
}

// it returns a function that will hide/show the divs upon mouse hoover
// it is necessary hack due to variable scope
// if we were to simply pass the function, then the same 'comment_div_id'
// variable reference (and others)
// would pushed in (post_draw.push) on all calls
// this way, the comment_management_function creates a context/scope, and it is
// that scope that defines the function
function comment_management_function(trigger_div_id,comment_div_id,reference_position_div_id,relWidth = 1,relHeight = 1){
	return function(){
		$('#' + trigger_div_id).on("mouseover", function() {
			var w =  Math.trunc($('#' + reference_position_div_id).width() * relWidth)
			var h =  Math.trunc($('#' + reference_position_div_id).height() * relHeight)			
			
			$('#' + comment_div_id).css('margin-left', w + 'px');
			$('#' + comment_div_id).css('margin-top', '-' + h + 'px');

			$('#' + comment_div_id).show();
		}).on("mouseout", function() {
			$('#' + comment_div_id).hide();
		});
	}
}

// --------------------- AimaraJS extentions ------------------------

function onNodeSelect(tree_node) {
	var xml_node = tree_node.xml_node
	div_main.innerHTML = ""

		// this variable will contain a list of function to be executed after
		// hte
		// drawer_func has been called
		post_draw = []	

	var drawer_func = drawers[xml_node.tagName]
	if (typeof drawer_func == 'undefined')
		drawer_func = drawers["default"]

	var stateObj = {};
	history.pushState(stateObj, tree_node.path, "index.html?u=" + tree_node.path);

	drawer_func(xml_node);
	draw_errors(xml_node);
	draw_comments(xml_node);
		
	for(p in post_draw){
		post_draw[p]()
	}
}
