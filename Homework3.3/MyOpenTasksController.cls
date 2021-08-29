public class MyOpenTasksController {
@AuraEnabled 
    Public static void createTask(Task objtask){
        try{
           
            insert objtask; 
             
        }catch(Exception e){
           
            throw new AuraHandledException(e.getMessage());
        }
        finally {
        }
    }
     
    @AuraEnabled 
    public static Map<String, String> getStatus(){
        Map<String, String> options = new Map<String, String>();
        
        Schema.DescribeFieldResult fieldResult = Task.Status.getDescribe();
     
        List<Schema.PicklistEntry> pList = fieldResult.getPicklistValues();
        for (Schema.PicklistEntry p: pList) {
          
            options.put(p.getValue(), p.getLabel());
        }
        return options;
    }
}