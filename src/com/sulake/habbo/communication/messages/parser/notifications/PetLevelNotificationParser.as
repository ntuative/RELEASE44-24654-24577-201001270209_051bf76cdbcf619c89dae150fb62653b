package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_544:String;
      
      private var var_1825:int;
      
      private var var_1826:String;
      
      private var var_950:int;
      
      private var var_1240:int;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return var_1240;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1240 = param1.readInteger();
         var_1826 = param1.readString();
         var_1825 = param1.readInteger();
         var_544 = param1.readString();
         var_950 = param1.readInteger();
         return true;
      }
      
      public function get petName() : String
      {
         return var_1826;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get figure() : String
      {
         return var_544;
      }
      
      public function get petType() : int
      {
         return var_950;
      }
      
      public function get level() : int
      {
         return var_1825;
      }
   }
}
