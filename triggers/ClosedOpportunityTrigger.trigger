trigger ClosedOpportunityTrigger on Opportunity (before insert,before update) {
   List<Task> taskList = New List<Task>();
    //for(Opportunity opp : [SELECT StageName FROM Opportunity WHERE StageName = 'Closed Won' AND Id = :Trigger.New]){
    for(Opportunity opp : Trigger.New){
        if(opp.StageName == 'Closed Won'){
	    	taskList.add(New Task(Subject = 'Follow Up Test Task',WhatId = opp.Id));
        }
    }
    insert taskList;
}