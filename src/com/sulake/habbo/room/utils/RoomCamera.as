package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const const_330:Number = 0.5;
      
      private static const const_738:int = 3;
      
      private static const const_1023:Number = 1;
       
      
      private var var_1686:Boolean = false;
      
      private var var_1691:Boolean = false;
      
      private var var_917:int = 0;
      
      private var var_248:Vector3d = null;
      
      private var var_1684:int = 0;
      
      private var var_1685:int = 0;
      
      private var var_1690:Boolean = false;
      
      private var var_1689:int = -2;
      
      private var var_1682:Boolean = false;
      
      private var var_1683:int = 0;
      
      private var var_1687:int = -1;
      
      private var var_369:Vector3d = null;
      
      private var var_1688:int = 0;
      
      public function RoomCamera()
      {
         super();
      }
      
      public function get roomWd() : int
      {
         return var_1684;
      }
      
      public function get targetId() : int
      {
         return var_1687;
      }
      
      public function set roomHt(param1:int) : void
      {
         var_1683 = param1;
      }
      
      public function set roomWd(param1:int) : void
      {
         var_1684 = param1;
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         var_1686 = param1;
      }
      
      public function set targetId(param1:int) : void
      {
         var_1687 = param1;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         var_1691 = param1;
      }
      
      public function dispose() : void
      {
         var_369 = null;
         var_248 = null;
      }
      
      public function set target(param1:IVector3d) : void
      {
         if(var_369 == null)
         {
            var_369 = new Vector3d();
         }
         var_369.assign(param1);
         var_917 = 0;
      }
      
      public function get targetCategory() : int
      {
         return var_1689;
      }
      
      public function get screenHt() : int
      {
         return var_1688;
      }
      
      public function set screenWd(param1:int) : void
      {
         var_1685 = param1;
      }
      
      public function get location() : IVector3d
      {
         return var_248;
      }
      
      public function set screenHt(param1:int) : void
      {
         var_1688 = param1;
      }
      
      public function get roomHt() : int
      {
         return var_1683;
      }
      
      public function get limitedLocationX() : Boolean
      {
         return var_1686;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return var_1691;
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:* = null;
         if(var_369 != null && var_248 != null)
         {
            ++var_917;
            _loc2_ = Vector3d.dif(var_369,var_248);
            if(_loc2_.length <= const_330)
            {
               var_248 = var_369;
               var_369 = null;
            }
            else
            {
               _loc2_.div(_loc2_.length);
               if(_loc2_.length < const_330 * (const_738 + 1))
               {
                  _loc2_.mul(const_330);
               }
               else if(var_917 <= const_738)
               {
                  _loc2_.mul(const_330);
               }
               else
               {
                  _loc2_.mul(const_1023);
               }
               var_248 = Vector3d.sum(var_248,_loc2_);
            }
         }
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         var_1690 = param1;
      }
      
      public function get screenWd() : int
      {
         return var_1685;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         var_1682 = param1;
      }
      
      public function set targetCategory(param1:int) : void
      {
         var_1689 = param1;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(var_248 != null)
         {
            return;
         }
         var_248 = new Vector3d();
         var_248.assign(param1);
      }
      
      public function get centeredLocX() : Boolean
      {
         return var_1690;
      }
      
      public function get centeredLocY() : Boolean
      {
         return var_1682;
      }
   }
}
