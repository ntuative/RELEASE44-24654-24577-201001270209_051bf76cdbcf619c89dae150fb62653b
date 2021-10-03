package com.sulake.habbo.widget.events
{
   public class RoomWidgetRoomQueueUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_380:String = "RWRQUE_SPECTATOR_QUEUE_STATUS";
      
      public static const const_294:String = "RWRQUE_VISITOR_QUEUE_STATUS";
       
      
      private var var_879:int;
      
      private var var_267:Boolean;
      
      private var var_1754:Boolean;
      
      private var var_1497:Boolean;
      
      public function RoomWidgetRoomQueueUpdateEvent(param1:String, param2:int, param3:Boolean, param4:Boolean, param5:Boolean, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         var_879 = param2;
         var_1754 = param3;
         var_267 = param4;
         var_1497 = param5;
      }
      
      public function get position() : int
      {
         return var_879;
      }
      
      public function get isActive() : Boolean
      {
         return var_267;
      }
      
      public function get isClubQueue() : Boolean
      {
         return var_1497;
      }
      
      public function get hasHabboClub() : Boolean
      {
         return var_1754;
      }
   }
}
