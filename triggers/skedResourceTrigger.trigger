trigger skedResourceTrigger on sked__Resource__c (after insert, after update, before delete) {
    if (Trigger.isAfter) {
        if (Trigger.isInsert) {
            skedResourceHandler.afterInsert(Trigger.new);
            //Added by Priya
            skedResourcetoILTInstructor.afterInsert(Trigger.new);
        }
        else if (Trigger.isUpdate) {
            skedResourceHandler.afterUpdate(Trigger.new, Trigger.oldMap);
            //Added by Priya
            skedResourcetoILTInstructor.afterUpdate(Trigger.new, Trigger.oldMap);
        }
    }
    if(Trigger.IsDelete){
        skedResourcetoILTInstructor.beforeDelete(Trigger.OldMap);
    }
}