package com.sulake.habbo.communication.messages.parser.availability
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class AvailabilityStatusMessageParser implements IMessageParser
   {
       
      
      private var var_948:Boolean;
      
      private var var_1269:Boolean;
      
      public function AvailabilityStatusMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_948 = param1.readInteger() > 0;
         var_1269 = param1.readInteger() > 0;
         return true;
      }
      
      public function get isOpen() : Boolean
      {
         return var_948;
      }
      
      public function get onShutDown() : Boolean
      {
         return var_1269;
      }
      
      public function flush() : Boolean
      {
         var_948 = false;
         var_1269 = false;
         return true;
      }
   }
}
