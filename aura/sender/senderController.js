({
	send : function(component, event, helper) {
        	var text = event.source.get("v.label");
        $A.get("e.c:message").setParams({text: text}).fire();
	}
})