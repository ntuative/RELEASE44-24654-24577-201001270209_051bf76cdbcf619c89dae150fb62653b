package com.sulake.habbo.widget.events
{
   public class RoomWidgetVoteUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_124:String = "RWPUE_VOTE_RESULT";
      
      public static const const_105:String = "RWPUE_VOTE_QUESTION";
       
      
      private var var_1137:int;
      
      private var var_927:String;
      
      private var var_691:Array;
      
      private var var_940:Array;
      
      public function RoomWidgetVoteUpdateEvent(param1:String, param2:String, param3:Array, param4:Array = null, param5:int = 0, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         var_927 = param2;
         var_940 = param3;
         var_691 = param4;
         if(var_691 == null)
         {
            var_691 = [];
         }
         var_1137 = param5;
      }
      
      public function get votes() : Array
      {
         return var_691.slice();
      }
      
      public function get totalVotes() : int
      {
         return var_1137;
      }
      
      public function get question() : String
      {
         return var_927;
      }
      
      public function get choices() : Array
      {
         return var_940.slice();
      }
   }
}
