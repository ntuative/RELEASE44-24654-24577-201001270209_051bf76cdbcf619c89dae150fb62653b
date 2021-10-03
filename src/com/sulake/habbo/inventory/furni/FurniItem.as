package com.sulake.habbo.inventory.furni
{
   import flash.display.BitmapData;
   
   public class FurniItem
   {
       
      
      private var _isSelected:Boolean = false;
      
      private var var_1823:int;
      
      private var var_1818:Boolean;
      
      private var var_1695:int;
      
      private var var_1320:String;
      
      private var var_1822:Boolean = false;
      
      private var var_1821:int;
      
      private var var_428:int;
      
      private var var_1040:String;
      
      private var var_1661:String;
      
      private var _image:BitmapData;
      
      private var _objId:int;
      
      private var var_1301:int;
      
      private var var_1820:Boolean;
      
      private var var_1819:int;
      
      public function FurniItem(param1:int, param2:String, param3:int, param4:int, param5:String, param6:Boolean, param7:Boolean, param8:int, param9:String, param10:int)
      {
         super();
         var_1823 = param1;
         var_1040 = param2;
         _objId = param3;
         var_1301 = param4;
         var_1320 = param5;
         var_1818 = param6;
         var_1820 = param7;
         var_1821 = param8;
         var_1661 = param9;
         var_1695 = param10;
         var_428 = -1;
      }
      
      public function get songId() : int
      {
         return var_1695;
      }
      
      public function get iconCallbackId() : int
      {
         return var_428;
      }
      
      public function get expiryTime() : int
      {
         return var_1821;
      }
      
      public function set prevCallbackId(param1:int) : void
      {
         var_1819 = param1;
      }
      
      public function set isLocked(param1:Boolean) : void
      {
         var_1822 = param1;
      }
      
      public function set iconCallbackId(param1:int) : void
      {
         var_428 = param1;
      }
      
      public function get isTradeable() : Boolean
      {
         return var_1820;
      }
      
      public function get slotId() : String
      {
         return var_1661;
      }
      
      public function get classId() : int
      {
         return var_1301;
      }
      
      public function get isRecyclable() : Boolean
      {
         return var_1818;
      }
      
      public function get stuffData() : String
      {
         return var_1320;
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         _isSelected = param1;
      }
      
      public function get stripId() : int
      {
         return var_1823;
      }
      
      public function get isLocked() : Boolean
      {
         return var_1822;
      }
      
      public function get prevCallbackId() : int
      {
         return var_1819;
      }
      
      public function get iconImage() : BitmapData
      {
         return _image;
      }
      
      public function get isSelected() : Boolean
      {
         return _isSelected;
      }
      
      public function get objId() : int
      {
         return _objId;
      }
      
      public function get itemType() : String
      {
         return var_1040;
      }
   }
}
