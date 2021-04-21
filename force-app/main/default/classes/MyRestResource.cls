@RestResource(urlMapping='/Account/*')
global with sharing class MyRestResource {

    
  
    @HttpGet
    global static Account doGet() {
        String accountId = RestContext.request.params.get('id');
        
        Account result = [SELECT Id, Name, Phone, Website FROM Account WHERE Id = :accountId];
        return result;
    }
  
  
  
  @HttpPost
    global static String doPost(String name,  
        String testsfdc ) {
        Account account = new Account();
        account.Name = name;
        account.TestSfdc__c=testsfdc;
        
        insert account;
        return account.Id;
    }
    
    
    @HttpPut
 global static String updateAccount( String testsfdc) {
   String accountId = RestContext.request.params.get('id');
   Account a = [ Select ID, Name from Account where Id= :accountId];
   a.testsfdc__c = testsfdc;
   update a;

   return 'Account Updated';
 }
 
 
 @HttpPatch
 global static String updateAccountpatch( String testsfdc) {
   String accountId = RestContext.request.params.get('id');
   Account a = [ Select ID, Name from Account where Id= :accountId];
   a.testsfdc__c = testsfdc;
   upsert a;

   return 'Account Updated';
 }
}