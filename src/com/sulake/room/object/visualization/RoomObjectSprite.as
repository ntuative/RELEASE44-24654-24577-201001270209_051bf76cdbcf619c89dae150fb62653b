package com.sulake.room.object.visualization
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public final class RoomObjectSprite implements IRoomObjectSprite
   {
       
      
      private var var_930:Boolean = false;
      
      private var var_1763:Boolean = false;
      
      private var var_2161:String = "normal";
      
      private var var_1277:String = "";
      
      private var var_1764:Boolean = false;
      
      private var _offset:Point;
      
      private var var_327:Boolean = true;
      
      private var var_2162:Boolean = true;
      
      private var var_987:Number = 0;
      
      private var _height:int = 0;
      
      private var _width:int = 0;
      
      private var var_1660:String = "";
      
      private var var_1655:int = 255;
      
      private var _color:int = 16777215;
      
      private var var_809:IAsset = null;
      
      private var var_931:Boolean = false;
      
      public function RoomObjectSprite()
      {
         _offset = new Point(0,0);
         super();
      }
      
      public function get flipV() : Boolean
      {
         return var_930;
      }
      
      public function get clickHandling() : Boolean
      {
         return var_1764;
      }
      
      public function set flipV(param1:Boolean) : void
      {
         var_930 = param1;
      }
      
      public function get tag() : String
      {
         return var_1660;
      }
      
      public function dispose() : void
      {
         var_809 = null;
         _width = 0;
         _height = 0;
      }
      
      public function get offsetX() : int
      {
         return _offset.x;
      }
      
      public function get offsetY() : int
      {
         return _offset.y;
      }
      
      public function get height() : int
      {
         return _height;
      }
      
      public function set blendMode(param1:String) : void
      {
         var_2161 = param1;
      }
      
      public function set capturesMouse(param1:Boolean) : void
      {
         var_2162 = param1;
      }
      
      public function get blendMode() : String
      {
         return var_2161;
      }
      
      public function set relativeDepth(param1:Number) : void
      {
         var_987 = param1;
      }
      
      public function set tag(param1:String) : void
      {
         var_1660 = param1;
      }
      
      public function set alpha(param1:int) : void
      {
         param1 &= 255;
         var_1655 = param1;
      }
      
      public function get assetName() : String
      {
         return var_1277;
      }
      
      public function get capturesMouse() : Boolean
      {
         return var_2162;
      }
      
      public function get varyingDepth() : Boolean
      {
         return var_1763;
      }
      
      public function set assetName(param1:String) : void
      {
         var_1277 = param1;
      }
      
      public function set offsetX(param1:int) : void
      {
         _offset.x = param1;
      }
      
      public function set offsetY(param1:int) : void
      {
         _offset.y = param1;
      }
      
      public function get width() : int
      {
         return _width;
      }
      
      public function get relativeDepth() : Number
      {
         return var_987;
      }
      
      public function get alpha() : int
      {
         return var_1655;
      }
      
      public function set asset(param1:IAsset) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(param1 is BitmapDataAsset)
         {
            var_809 = param1;
            _width = 0;
            _height = 0;
            if(param1 != null)
            {
               _loc2_ = param1 as BitmapDataAsset;
               _loc3_ = _loc2_.content as BitmapData;
               if(_loc3_ != null)
               {
                  _width = _loc3_.width;
                  _height = _loc3_.height;
               }
            }
         }
         else if(param1 == null)
         {
            var_809 = null;
            _width = 0;
            _height = 0;
         }
      }
      
      public function set color(param1:int) : void
      {
         param1 &= 16777215;
         _color = param1;
      }
      
      public function get color() : int
      {
         return _color;
      }
      
      public function set varyingDepth(param1:Boolean) : void
      {
         var_1763 = param1;
      }
      
      public function set clickHandling(param1:Boolean) : void
      {
         var_1764 = param1;
      }
      
      public function get asset() : IAsset
      {
         return var_809;
      }
      
      public function set visible(param1:Boolean) : void
      {
         var_327 = param1;
      }
      
      public function set flipH(param1:Boolean) : void
      {
         var_931 = param1;
      }
      
      public function get visible() : Boolean
      {
         return var_327;
      }
      
      public function get flipH() : Boolean
      {
         return var_931;
      }
   }
}
