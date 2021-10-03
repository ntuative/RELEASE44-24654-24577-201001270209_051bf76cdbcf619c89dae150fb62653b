package com.sulake.habbo.communication.messages.parser.room.session
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class CantConnectMessageParser implements IMessageParser
   {
      
      public static const const_1535:int = 2;
      
      public static const const_312:int = 4;
      
      public static const const_1300:int = 1;
      
      public static const const_1194:int = 3;
       
      
      private var var_993:int = 0;
      
      private var var_828:String = "";
      
      public function CantConnectMessageParser()
      {
         super();
      }
      
      public function get reason() : int
      {
         return var_993;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_993 = param1.readInteger();
         if(var_993 == 3)
         {
            var_828 = param1.readString();
         }
         else
         {
            var_828 = "";
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         var_993 = 0;
         var_828 = "";
         return true;
      }
      
      public function get parameter() : String
      {
         return var_828;
      }
   }
}
