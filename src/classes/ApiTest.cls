@isTest public class ApiTest {
    
    //00:26:24.286 (286492000)|CALLOUT_REQUEST|[2224]|<?xml version="1.0" encoding="UTF-8"?><env:Envelope xmlns:env="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"><env:Header><SessionHeader xmlns="urn:tooling.soap.sforce.com"><sessionId>00Db0000000d6mj!AQwAQChuDKw2PyUD_.Zgp9ABaRAvYfIlp0pjv1t0ZCkNmMp5s5.Z6ScDj6u0eYUmBRmjwE.yjUqAv09CgoXbdTVFgdZWSz78</sessionId></SessionHeader></env:Header><env:Body><retrieve xmlns="urn:tooling.soap.sforce.com"><select>Id</select><type>CustomField</type><ids>00Nb0000007p4tG</ids></retrieve></env:Body></env:Envelope>
    //00:26:24.286 (286571000)|CALLOUT_REQUEST|[2224]|retrieve_element:[apex_schema_type_info=(urn:tooling.soap.sforce.com, true, false), field_order_type_info=(select_x, type_x, ids), ids=(00Nb0000007p4tG), ids_type_info=(ids, urn:tooling.soap.sforce.com, null, 0, -1, false), select_x=Id, select_x_type_info=(select, urn:tooling.soap.sforce.com, null, 1, 1, false), type_x=CustomField, type_x_type_info=(type, urn:tooling.soap.sforce.com, null, 1, 1, false)]::SFDC_STACK_DEPTH=1 SOAPAction="" User-Agent=SFDC-Callout/29.0 Accept=text/xml Content-Type=text/xml; charset=UTF-8 
    //00:26:24.368 (368447000)|CALLOUT_RESPONSE|[2224]|<?xml version="1.0" encoding="UTF-8"?><soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns="urn:tooling.soap.sforce.com" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"><soapenv:Body><retrieveResponse><result xsi:type="CustomField"><Id>00Nb0000007p4tGEAQ</Id></result></retrieveResponse></soapenv:Body></soapenv:Envelope>
    public class RetrieveMock implements WebServiceMock {
        public void doInvoke(Object stub, Object request, Map<String, Object> response, String endpoint, String soapAction, String requestName, String responseNS, String responseName, String responseType) {
            Api.retrieveResponse_element responseElement = new Api.retrieveResponse_element();
            responseElement.result = new List<Api.sObject_x>{new Api.sObject_x()};
            response.put('response_x', responseElement); 
        }
    }
    
    static testMethod void coverRetrieve() {
        Test.setMock(WebServiceMock.class, new RetrieveMock());
        Object result = new Tooling.Api.Client().retrieve_x('Id', 'CustomField', new List<String>{'00Nb0000007p4tG'});
        System.assert(result instanceof List<Api.sObject_x>);
    }
    
}