<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Manager_Approval_Required</fullName>
        <field>Pricing_Approval_Level__c</field>
        <literalValue>Manager</literalValue>
        <name>Manager Approval Required</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <targetObject>OpportunityId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Discount_value</fullName>
        <field>Discount_Value__c</field>
        <formula>if(Product2.Name =&apos;On site course delivery fee&apos;,0,Discount_Percentage__c)</formula>
        <name>Update Discount value</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Update Discount value</fullName>
        <actions>
            <name>Update_Discount_value</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 OR 2</booleanFilter>
        <criteriaItems>
            <field>OpportunityLineItem.Discount_Percentage__c</field>
            <operation>greaterOrEqual</operation>
            <value>0</value>
        </criteriaItems>
        <criteriaItems>
            <field>OpportunityLineItem.Discount_Percentage__c</field>
            <operation>lessOrEqual</operation>
            <value>0</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
