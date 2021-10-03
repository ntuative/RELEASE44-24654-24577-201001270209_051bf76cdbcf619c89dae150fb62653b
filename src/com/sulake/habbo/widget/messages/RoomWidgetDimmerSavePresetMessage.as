package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_620:String = "RWSDPM_SAVE_PRESET";
       
      
      private var _color:uint;
      
      private var var_2103:int;
      
      private var var_2101:int;
      
      private var var_2102:Boolean;
      
      private var var_914:int;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_620);
         var_2101 = param1;
         var_2103 = param2;
         _color = param3;
         var_914 = param4;
         var_2102 = param5;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get effectTypeId() : int
      {
         return var_2103;
      }
      
      public function get presetNumber() : int
      {
         return var_2101;
      }
      
      public function get brightness() : int
      {
         return var_914;
      }
      
      public function get apply() : Boolean
      {
         return var_2102;
      }
   }
}
