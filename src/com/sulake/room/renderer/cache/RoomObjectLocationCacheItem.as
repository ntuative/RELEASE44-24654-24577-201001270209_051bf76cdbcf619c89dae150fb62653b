package com.sulake.room.renderer.cache
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomObjectLocationCacheItem
   {
       
      
      private var var_1916:int = -1;
      
      private var var_1079:int = -1;
      
      private var var_649:Vector3d = null;
      
      public function RoomObjectLocationCacheItem()
      {
         super();
         var_649 = new Vector3d();
      }
      
      public function get objectUpdateId() : int
      {
         return var_1916;
      }
      
      public function set objectUpdateId(param1:int) : void
      {
         var_1916 = param1;
      }
      
      public function set screenLoc(param1:IVector3d) : void
      {
         var_649.assign(param1);
         var_649.x = Math.round(var_649.x);
         var_649.y = Math.round(var_649.y);
      }
      
      public function set geometryUpdateId(param1:int) : void
      {
         var_1079 = param1;
      }
      
      public function get screenLoc() : IVector3d
      {
         return var_649;
      }
      
      public function get geometryUpdateId() : int
      {
         return var_1079;
      }
   }
}
