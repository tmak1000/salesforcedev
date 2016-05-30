({
	toggle : function(component, event, helper) {
		var toggleText = component.find("text");
        $A.util.toggleClass(toggleText,"toggle");
	}
})