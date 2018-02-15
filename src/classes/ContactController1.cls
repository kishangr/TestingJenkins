public with sharing class ContactController1 {

    	@AuraEnabled
    public static List<Contact> findAll(){
        return [SELECT id,name,phone FROM Contact LIMIT 50];
    }
    @AuraEnabled
    public static List<Contact> findByName(String searchKey){
        String name = '%' + searchKey + '%';
        return [SELECT id,name,phone FROM Contact where name LIKE :name LIMIT 50];
    }
    
    @AuraEnabled
    public static Contact findById(String contactId){
       
       return [SELECT Id,Name,Title,Phone,Mobilephone,Account.Name FROM Contact where Id =: contactId];
            
    }
   @AuraEnabled
    public static List<Case> findcaseByConId(String contactId){
       
       return [SELECT Id,ContactId,CaseNumber,Status FROM Case where ContactId =: contactId];
            
    } 
   
    
}