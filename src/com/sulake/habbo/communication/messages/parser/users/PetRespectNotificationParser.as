package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.parser.inventory.pets.PetData;
   
   public class PetRespectNotificationParser implements IMessageParser
   {
       
      
      private var var_1790:int;
      
      private var var_1131:PetData;
      
      private var var_1789:int;
      
      public function PetRespectNotificationParser()
      {
         super();
      }
      
      public function get respect() : int
      {
         return var_1790;
      }
      
      public function get petData() : PetData
      {
         return var_1131;
      }
      
      public function flush() : Boolean
      {
         var_1131 = null;
         return true;
      }
      
      public function get petOwnerId() : int
      {
         return var_1789;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1790 = param1.readInteger();
         var_1789 = param1.readInteger();
         var_1131 = new PetData(param1);
         return true;
      }
   }
}
