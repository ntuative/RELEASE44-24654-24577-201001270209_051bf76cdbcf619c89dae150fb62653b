package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
   public class FurniData
   {
       
      
      private var var_1320:String;
      
      private var var_1040:String;
      
      private var var_2036:Boolean;
      
      private var var_1350:int;
      
      private var var_1823:int;
      
      private var var_2035:Boolean;
      
      private var var_1661:String = "";
      
      private var var_1818:Boolean;
      
      private var _category:int;
      
      private var _objId:int;
      
      private var var_1301:int;
      
      private var var_1820:Boolean;
      
      private var var_1695:int = -1;
      
      private var var_1821:int;
      
      public function FurniData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:int)
      {
         super();
         var_1823 = param1;
         var_1040 = param2;
         _objId = param3;
         var_1301 = param4;
         _category = param5;
         var_1320 = param6;
         var_2036 = param7;
         var_1818 = param8;
         var_1820 = param9;
         var_2035 = param10;
         var_1821 = param11;
      }
      
      public function get slotId() : String
      {
         return var_1661;
      }
      
      public function get extra() : int
      {
         return var_1350;
      }
      
      public function get classId() : int
      {
         return var_1301;
      }
      
      public function get category() : int
      {
         return _category;
      }
      
      public function get isSellable() : Boolean
      {
         return var_2035;
      }
      
      public function get isGroupable() : Boolean
      {
         return var_2036;
      }
      
      public function get stripId() : int
      {
         return var_1823;
      }
      
      public function get stuffData() : String
      {
         return var_1320;
      }
      
      public function get songId() : int
      {
         return var_1695;
      }
      
      public function setExtraData(param1:String, param2:int) : void
      {
         var_1661 = param1;
         var_1350 = param2;
      }
      
      public function get itemType() : String
      {
         return var_1040;
      }
      
      public function get objId() : int
      {
         return _objId;
      }
      
      public function get expiryTime() : int
      {
         return var_1821;
      }
      
      public function get isTradeable() : Boolean
      {
         return var_1820;
      }
      
      public function get isRecyclable() : Boolean
      {
         return var_1818;
      }
   }
}
