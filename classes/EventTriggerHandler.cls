public with sharing class EventTriggerHandler {
    private boolean m_isExecuting = false;
    private integer BatchSize = 0;
    
    public EventTriggerHandler(boolean isExecuting, integer size){
        m_isExecuting = isExecuting;
        BatchSize = size;
    }
    
    public void OnBeforeInsert(Event[] newEvents){
        //Example usage
        for(Event newEvent : newEvents){
            if(newEvent.Location == null){
                newEvent.StartDateTime.addError('Missing Location');
            }
            String newLocation = newEvent.Location;
            Integer age = Integer.valueOf(newEvent.SelectList__c);
            age = age * 2;
            newLocation = String.valueOf(age);
            newEvent.Location = newLocation + 'byTrigger';
        }
    
    }
     public void OnAfterInsert(Event [] newEvents){
           //Example usage

     }    
     
     
 }