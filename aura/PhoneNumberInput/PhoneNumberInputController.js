({
	send : function(component, event, helper) {
		var text = component.find("phone").get("v.value");
        console.log('send:'+text);
        var messageEvent = component.getEvent("messageEvent");
        messageEvent.setParams({
            "phone":text
        });
        messageEvent.fire();
	}
})