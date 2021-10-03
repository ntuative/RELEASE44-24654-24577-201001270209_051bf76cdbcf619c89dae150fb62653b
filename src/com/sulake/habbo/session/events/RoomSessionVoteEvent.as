package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionVoteEvent extends RoomSessionEvent
   {
      
      public static const const_124:String = "RSPE_VOTE_RESULT";
      
      public static const const_105:String = "RSPE_VOTE_QUESTION";
       
      
      private var var_1137:int = 0;
      
      private var var_927:String = "";
      
      private var var_691:Array;
      
      private var var_940:Array;
      
      public function RoomSessionVoteEvent(param1:String, param2:IRoomSession, param3:String, param4:Array, param5:Array = null, param6:int = 0, param7:Boolean = false, param8:Boolean = false)
      {
         var_940 = [];
         var_691 = [];
         super(param1,param2,param7,param8);
         var_927 = param3;
         var_940 = param4;
         var_691 = param5;
         if(var_691 == null)
         {
            var_691 = [];
         }
         var_1137 = param6;
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
