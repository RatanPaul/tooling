Tooling API bindings for Apex
=============================

This package provides an Apex entry point into the Salesforce Tooling API.

Install from the [AppExchange](http://appexchange.salesforce.com/) then try these examples:
-------------------------------------------------------------------------------------------

**1. Running arbitrary Apex code:**

    Tooling.Api.Client client = new Tooling.Api.Client();
    String command = 'System.debug(true);';
    Tooling.Api.ExecuteAnonymousResult result = client.executeAnonymous(command);
    System.assert(result.success);

**2. Adding a custom field:**

    Tooling.Api.CustomField customField = new Tooling.Api.CustomField();
    customField.FullName = 'Account.TaxNumber__c';
    customField.Metadata = new Tooling.Api.CustomFieldMetadata();
    customField.Metadata.label = 'Company Taxation Number';
    customField.Metadata.type_x = 'Text';
    customField.Metadata.length = 32;
    
    Tooling.Api.Client client = new Api.Client();
    client.create(new List<Tooling.Api.CustomField>{customField});

**3. Creating a Visualforce Page:**

    Tooling.Api.ApexPageMember apexPageMember = new Tooling.Api.ApexPageMember();
    apexPageMember.Body = '<apex:page />';
    apexPageMember.Content = 'TestPage';
    
    Tooling.Api.Client client = new Tooling.Api.Client();
    client.create(new List<Tooling.Api.ApexPageMember>{apexPageMember});

**4. Creating an Apex Class:**

    Tooling.Api.ApexClass apex = new Api.ApexClass();
    apex.Body = 'public class MyClass { /* ... */ }';
    
    Tooling.Api.Client client = new Tooling.Api.Client();
    client.create(new List<Tooling.Api.ApexClass>{apex});

**5. Creating an Apex Trigger:**

    Tooling.Api.ApexTrigger apexTrigger = new Tooling.Api.ApexTrigger();
    apexTrigger.Name = 'MyTestTrigger';
    apexTrigger.TableEnumOrId = 'Account';
    apexTrigger.Body = 'trigger TestTrigger on Account (before insert) { /* ... */ }';
    
    Tooling.Api.Client client = new Tooling.Api.Client();
    client.create(new List<Api.ApexTrigger>{apexTrigger});
