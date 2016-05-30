({
    answer : function(component, event, helper) {
        var text = event.getParam("text");
        component.set("v.myText", text);
    }
})