package com.sulake.habbo.room.events
{
   import com.sulake.room.events.RoomObjectEvent;
   
   public class RoomObjectDimmerStateUpdateEvent extends RoomObjectEvent
   {
      
      public static const DIMMER_STATE:String = "RODSUE_DIMMER_STATE";
       
      
      private var var_913:int;
      
      private var _color:uint;
      
      private var var_914:int;
      
      private var var_1631:int;
      
      private var var_46:int;
      
      public function RoomObjectDimmerStateUpdateEvent(param1:int, param2:String, param3:int, param4:int, param5:int, param6:uint, param7:int, param8:Boolean = false, param9:Boolean = false)
      {
         super(DIMMER_STATE,param1,param2,param8,param9);
         var_46 = param3;
         var_1631 = param4;
         var_913 = param5;
         _color = param6;
         var_914 = param7;
      }
      
      public function get brightness() : uint
      {
         return var_914;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get effectId() : int
      {
         return var_913;
      }
      
      public function get state() : int
      {
         return var_46;
      }
      
      public function get presetId() : int
      {
         return var_1631;
      }
   }
}
