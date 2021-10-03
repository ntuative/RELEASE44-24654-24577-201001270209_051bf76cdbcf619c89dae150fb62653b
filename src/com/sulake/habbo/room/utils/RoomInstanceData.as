package com.sulake.habbo.room.utils
{
   public class RoomInstanceData
   {
       
      
      private var var_767:LegacyWallGeometry = null;
      
      private var var_534:SelectedRoomObjectData = null;
      
      private var _roomCategory:int = 0;
      
      private var var_535:TileHeightMap = null;
      
      private var var_1815:String = null;
      
      private var _roomId:int = 0;
      
      private var var_766:RoomCamera = null;
      
      public function RoomInstanceData(param1:int, param2:int)
      {
         super();
         _roomId = param1;
         _roomCategory = param2;
         var_767 = new LegacyWallGeometry();
         var_766 = new RoomCamera();
      }
      
      public function set tileHeightMap(param1:TileHeightMap) : void
      {
         if(var_535 != null)
         {
            var_535.dispose();
         }
         var_535 = param1;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function set worldType(param1:String) : void
      {
         var_1815 = param1;
      }
      
      public function get legacyGeometry() : LegacyWallGeometry
      {
         return var_767;
      }
      
      public function get roomCamera() : RoomCamera
      {
         return var_766;
      }
      
      public function dispose() : void
      {
         if(var_535 != null)
         {
            var_535.dispose();
            var_535 = null;
         }
         if(var_767 != null)
         {
            var_767.dispose();
            var_767 = null;
         }
         if(var_766 != null)
         {
            var_766.dispose();
            var_766 = null;
         }
         if(var_534 != null)
         {
            var_534.dispose();
            var_534 = null;
         }
      }
      
      public function get tileHeightMap() : TileHeightMap
      {
         return var_535;
      }
      
      public function get worldType() : String
      {
         return var_1815;
      }
      
      public function set selectedObject(param1:SelectedRoomObjectData) : void
      {
         if(var_534 != null)
         {
            var_534.dispose();
         }
         var_534 = param1;
      }
      
      public function get roomCategory() : int
      {
         return _roomCategory;
      }
      
      public function get selectedObject() : SelectedRoomObjectData
      {
         return var_534;
      }
   }
}
