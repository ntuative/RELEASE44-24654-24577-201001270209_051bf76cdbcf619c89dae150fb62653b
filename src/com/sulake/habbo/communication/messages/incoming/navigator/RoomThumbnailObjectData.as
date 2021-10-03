package com.sulake.habbo.communication.messages.incoming.navigator
{
   public class RoomThumbnailObjectData
   {
       
      
      private var var_1431:int;
      
      private var var_1432:int;
      
      public function RoomThumbnailObjectData()
      {
         super();
      }
      
      public function get pos() : int
      {
         return var_1431;
      }
      
      public function set pos(param1:int) : void
      {
         this.var_1431 = param1;
      }
      
      public function getCopy() : RoomThumbnailObjectData
      {
         var _loc1_:RoomThumbnailObjectData = new RoomThumbnailObjectData();
         _loc1_.var_1431 = this.var_1431;
         _loc1_.var_1432 = this.var_1432;
         return _loc1_;
      }
      
      public function set imgId(param1:int) : void
      {
         this.var_1432 = param1;
      }
      
      public function get imgId() : int
      {
         return var_1432;
      }
   }
}
