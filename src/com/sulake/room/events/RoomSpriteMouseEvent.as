package com.sulake.room.events
{
   public class RoomSpriteMouseEvent
   {
       
      
      private var var_1616:Boolean = false;
      
      private var var_1618:Boolean = false;
      
      private var var_1646:String = "";
      
      private var _type:String = "";
      
      private var var_1617:Boolean = false;
      
      private var var_1766:Number = 0;
      
      private var var_1765:Number = 0;
      
      private var var_1767:Number = 0;
      
      private var var_1769:String = "";
      
      private var var_1768:Number = 0;
      
      private var var_1619:Boolean = false;
      
      public function RoomSpriteMouseEvent(param1:String, param2:String, param3:String, param4:Number, param5:Number, param6:Number = 0, param7:Number = 0, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false)
      {
         super();
         _type = param1;
         var_1769 = param2;
         var_1646 = param3;
         var_1765 = param4;
         var_1767 = param5;
         var_1766 = param6;
         var_1768 = param7;
         var_1619 = param8;
         var_1618 = param9;
         var_1617 = param10;
         var_1616 = param11;
      }
      
      public function get ctrlKey() : Boolean
      {
         return var_1619;
      }
      
      public function get buttonDown() : Boolean
      {
         return var_1616;
      }
      
      public function get localX() : Number
      {
         return var_1766;
      }
      
      public function get localY() : Number
      {
         return var_1768;
      }
      
      public function get canvasId() : String
      {
         return var_1769;
      }
      
      public function get altKey() : Boolean
      {
         return var_1618;
      }
      
      public function get spriteTag() : String
      {
         return var_1646;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function get screenX() : Number
      {
         return var_1765;
      }
      
      public function get screenY() : Number
      {
         return var_1767;
      }
      
      public function get shiftKey() : Boolean
      {
         return var_1617;
      }
   }
}
