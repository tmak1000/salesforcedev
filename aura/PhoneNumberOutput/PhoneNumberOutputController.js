({
	receive : function(component, event, helper) {
		var text = event.getParam("phone");
        console.log("receive:"+text);
        component.set("v.number",text);
	}
})