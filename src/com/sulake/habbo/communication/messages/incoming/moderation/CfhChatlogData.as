package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_1014:int;
      
      private var var_1827:int;
      
      private var var_1388:int;
      
      private var var_118:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         var_1388 = param1.readInteger();
         var_1827 = param1.readInteger();
         var_1014 = param1.readInteger();
         var_118 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + var_1388);
      }
      
      public function get reportedUserId() : int
      {
         return var_1014;
      }
      
      public function get callerUserId() : int
      {
         return var_1827;
      }
      
      public function get callId() : int
      {
         return var_1388;
      }
      
      public function get room() : RoomChatlogData
      {
         return var_118;
      }
   }
}
