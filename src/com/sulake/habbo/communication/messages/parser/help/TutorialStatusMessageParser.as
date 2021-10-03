package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class TutorialStatusMessageParser implements IMessageParser
   {
       
      
      private var var_922:Boolean;
      
      private var var_924:Boolean;
      
      private var var_923:Boolean;
      
      public function TutorialStatusMessageParser()
      {
         super();
      }
      
      public function get hasCalledGuideBot() : Boolean
      {
         return var_922;
      }
      
      public function get hasChangedName() : Boolean
      {
         return var_924;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_923 = param1.readBoolean();
         var_924 = param1.readBoolean();
         var_922 = param1.readBoolean();
         return true;
      }
      
      public function get hasChangedLooks() : Boolean
      {
         return var_923;
      }
      
      public function flush() : Boolean
      {
         var_923 = false;
         var_924 = false;
         var_922 = false;
         return true;
      }
   }
}
