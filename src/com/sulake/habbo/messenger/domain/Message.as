package com.sulake.habbo.messenger.domain
{
   public class Message
   {
      
      public static const const_631:int = 2;
      
      public static const const_824:int = 6;
      
      public static const const_682:int = 1;
      
      public static const const_622:int = 3;
      
      public static const const_873:int = 4;
      
      public static const const_565:int = 5;
       
      
      private var var_1770:String;
      
      private var var_921:int;
      
      private var var_1615:String;
      
      private var _type:int;
      
      public function Message(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         _type = param1;
         var_921 = param2;
         var_1615 = param3;
         var_1770 = param4;
      }
      
      public function get time() : String
      {
         return var_1770;
      }
      
      public function get senderId() : int
      {
         return var_921;
      }
      
      public function get messageText() : String
      {
         return var_1615;
      }
      
      public function get type() : int
      {
         return _type;
      }
   }
}
