package com.sulake.habbo.communication.messages.parser.inventory.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetReceivedMessageParser implements IMessageParser
   {
       
      
      private var var_976:PetData;
      
      private var var_1433:Boolean;
      
      public function PetReceivedMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1433 = param1.readBoolean();
         var_976 = new PetData(param1);
         Logger.log("Got PetReceived: " + var_1433 + ", " + var_976.id + ", " + var_976.name + ", " + pet.figure + ", " + var_976.type);
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get boughtAsGift() : Boolean
      {
         return var_1433;
      }
      
      public function get pet() : PetData
      {
         return var_976;
      }
   }
}
