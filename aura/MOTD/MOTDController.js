({
	checkWeekday: function(component) {
            var d = new Date();
        	console.log(d);
            var weekday = $A.get("$Locale.nameOfWeekdays");
        	console.log(weekday);
            var n = weekday[d.getDay()].fullName;
        	console.log(n);
            component.set("v.DayOfTheWeek", n);
        }
})