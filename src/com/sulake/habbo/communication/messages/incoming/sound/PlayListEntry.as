package com.sulake.habbo.communication.messages.incoming.sound
{
   public class PlayListEntry
   {
       
      
      private var var_1695:int;
      
      private var var_1698:int = 0;
      
      private var var_1696:String;
      
      private var var_1697:int;
      
      private var var_1699:String;
      
      public function PlayListEntry(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         var_1695 = param1;
         var_1697 = param2;
         var_1699 = param3;
         var_1696 = param4;
      }
      
      public function get length() : int
      {
         return var_1697;
      }
      
      public function get name() : String
      {
         return var_1699;
      }
      
      public function get creator() : String
      {
         return var_1696;
      }
      
      public function get startPlayHeadPos() : int
      {
         return var_1698;
      }
      
      public function get id() : int
      {
         return var_1695;
      }
      
      public function set startPlayHeadPos(param1:int) : void
      {
         var_1698 = param1;
      }
   }
}
