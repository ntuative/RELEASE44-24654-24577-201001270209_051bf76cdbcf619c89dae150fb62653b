package com.sulake.habbo.communication.messages.outgoing.handshake
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class VersionCheckMessageComposer implements IMessageComposer
   {
       
      
      private var var_1962:String;
      
      private var var_1215:String;
      
      private var var_1961:int;
      
      public function VersionCheckMessageComposer(param1:int, param2:String, param3:String)
      {
         super();
         var_1961 = param1;
         var_1215 = param2;
         var_1962 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1961,var_1215,var_1962];
      }
      
      public function dispose() : void
      {
      }
   }
}
