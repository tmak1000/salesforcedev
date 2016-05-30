trigger EventTrigger on Event (after delete, after insert, after undelete,  after update, before delete, before insert, before update) {
    EventTriggerHandler handler = new EventTriggerHandler(Trigger.isExecuting, Trigger.size);
     if(Trigger.isInsert && Trigger.isBefore){
        handler.OnBeforeInsert(Trigger.new);
    }
}