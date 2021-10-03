package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendRequestData
   {
       
      
      private var var_1760:int;
      
      private var var_1759:String;
      
      private var var_1086:int;
      
      public function FriendRequestData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1086 = param1.readInteger();
         this.var_1759 = param1.readString();
         this.var_1760 = int(param1.readString());
      }
      
      public function get requestId() : int
      {
         return this.var_1086;
      }
      
      public function get requesterUserId() : int
      {
         return this.var_1760;
      }
      
      public function get requesterName() : String
      {
         return this.var_1759;
      }
   }
}
