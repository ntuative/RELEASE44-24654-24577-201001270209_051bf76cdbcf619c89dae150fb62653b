package com.sulake.habbo.communication.messages.parser.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import flash.utils.getTimer;
   
   public class IssueInfoMessageParser implements IMessageParser
   {
       
      
      private var var_66:IssueMessageData;
      
      public function IssueInfoMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_66 = new IssueMessageData();
         var_66.issueId = param1.readInteger();
         var_66.state = param1.readInteger();
         var_66.categoryId = param1.readInteger();
         var_66.reportedCategoryId = param1.readInteger();
         var_66.timeStamp = getTimer() - param1.readInteger();
         var_66.priority = param1.readInteger();
         var_66.reporterUserId = param1.readInteger();
         var_66.reporterUserName = param1.readString();
         var_66.reportedUserId = param1.readInteger();
         var_66.reportedUserName = param1.readString();
         var_66.pickerUserId = param1.readInteger();
         var_66.pickerUserName = param1.readString();
         var_66.message = param1.readString();
         var_66.chatRecordId = param1.readInteger();
         var_66.roomName = param1.readString();
         var_66.roomType = param1.readInteger();
         if(false)
         {
            var_66.roomResources = param1.readString();
            var_66.unitPort = param1.readInteger();
            var_66.worldId = param1.readInteger();
         }
         if(false)
         {
            var_66.flatType = param1.readString();
            var_66.flatId = param1.readInteger();
            var_66.flatOwnerName = param1.readString();
         }
         return true;
      }
      
      public function get issueData() : IssueMessageData
      {
         return var_66;
      }
      
      public function flush() : Boolean
      {
         var_66 = null;
         return true;
      }
   }
}
