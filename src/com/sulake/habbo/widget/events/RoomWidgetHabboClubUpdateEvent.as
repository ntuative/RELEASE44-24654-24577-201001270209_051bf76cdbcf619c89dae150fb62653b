package com.sulake.habbo.widget.events
{
   public class RoomWidgetHabboClubUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_210:String = "RWBIUE_HABBO_CLUB";
       
      
      private var var_2130:Boolean = false;
      
      private var var_2129:int = 0;
      
      private var var_2131:int = 0;
      
      private var var_2132:int = 0;
      
      public function RoomWidgetHabboClubUpdateEvent(param1:int, param2:int, param3:int, param4:Boolean, param5:Boolean = false, param6:Boolean = false)
      {
         super(const_210,param5,param6);
         var_2132 = param1;
         var_2131 = param2;
         var_2129 = param3;
         var_2130 = param4;
      }
      
      public function get pastPeriods() : int
      {
         return var_2129;
      }
      
      public function get periodsLeft() : int
      {
         return var_2131;
      }
      
      public function get daysLeft() : int
      {
         return var_2132;
      }
      
      public function get allowClubDances() : Boolean
      {
         return var_2130;
      }
   }
}
