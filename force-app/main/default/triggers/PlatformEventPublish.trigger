trigger PlatformEventPublish on Account (after insert , after update ) {
    
    If(trigger.isAfter && trigger.isUpdate){
        List<Employee_On_boarding__e> publishEvents = new List<Employee_On_boarding__e>();
        for(Account a : Trigger.new){
            Employee_On_boarding__e eve = new Employee_On_boarding__e();
            eve.Name__c = a.Name ;
            eve.Phone__c = a.Phone ;
            //eve.Salary__c = a.AnnualRevenue ;
            publishEvents.add(eve);            
        }
        if(publishEvents.size()>0){
            EventBus.publish(publishEvents);
        }
        
    }
    
}