trigger skedLocationTrigger on sked__Location__c (after insert, after update, before delete) {
    if (Trigger.isAfter) {
        if (Trigger.isInsert) {
            skedLocationHandler.afterInsert(Trigger.new);
            //Added by Priya
            skedLocationtoILTlocation.afterInsert(Trigger.new);
        }
        else if (Trigger.isUpdate) {
            skedLocationHandler.afterUpdate(Trigger.new, Trigger.oldMap);
            //Added by Priya
            skedLocationtoILTlocation.afterupdate(Trigger.new,Trigger.oldMap);
        }
    }
    if(Trigger.IsDelete){
            skedLocationtoILTlocation.beforeDelete(Trigger.oldMap);
        }
}