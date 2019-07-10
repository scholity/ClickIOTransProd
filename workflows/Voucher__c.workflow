<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Reset_Voucher_RCO_Order_Id</fullName>
        <field>RCO_Order_Id__c</field>
        <name>Reset Voucher RCO Order Id</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Reset_Voucher_RCO_Reservation_Timestamp</fullName>
        <field>RCO_Reservation_Timestamp__c</field>
        <name>Reset Voucher RCO Reservation Timestamp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Reset_Voucher_Status_to_Issued</fullName>
        <description>After one hour, a reserved voucher that is not claimed is released to inventory</description>
        <field>Status__c</field>
        <literalValue>Issued</literalValue>
        <name>Reset Voucher Status to Issued</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Release Expired Hold</fullName>
        <active>true</active>
        <formula>ISPICKVAL(Status__c, &apos;Temp Hold&apos;) &amp;&amp; LastModifiedDate+0.0000578704 &gt;= NOW()</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Reset_Voucher_RCO_Order_Id</name>
                <type>FieldUpdate</type>
            </actions>
            <actions>
                <name>Reset_Voucher_RCO_Reservation_Timestamp</name>
                <type>FieldUpdate</type>
            </actions>
            <actions>
                <name>Reset_Voucher_Status_to_Issued</name>
                <type>FieldUpdate</type>
            </actions>
            <offsetFromField>Voucher__c.RCO_Reservation_Timestamp__c</offsetFromField>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
</Workflow>
