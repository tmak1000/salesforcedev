({
	doInit : function(cmp){
		$A.createComponent(
            {
                "aura:id": "findableAuraId",
                "label": "Press Me",
                "press": cmp.getReference("c.handlePress")
            },
            function(newButton){
                if(cmp.isValid()){
                    var body = cmp.get("v.body");
                    body.push(newButton);
                    cmp.set("v.body",body);
                }
            }
        );
    },
    handlePress : function(cmp){
		console.log("button pressed");
	}
})