package com.sulake.habbo.room.object.visualization.room
{
   import com.sulake.core.assets.AssetLibrary;
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.habbo.room.object.RoomPlaneBitmapMaskData;
   import com.sulake.habbo.room.object.RoomPlaneBitmapMaskParser;
   import com.sulake.habbo.room.object.RoomPlaneData;
   import com.sulake.habbo.room.object.RoomPlaneParser;
   import com.sulake.habbo.room.object.visualization.room.utils.Randomizer;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
   import com.sulake.room.utils.IRoomGeometry;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class RoomVisualization extends RoomObjectSpriteVisualization
   {
      
      public static const const_1306:int = 13421772;
      
      private static const const_1027:int = 16777215;
      
      public static const const_1259:int = 10066329;
      
      private static const const_1030:int = 13421772;
      
      public static const const_1272:int = 16777215;
      
      private static const const_1390:int = 0;
      
      public static const const_1286:int = 16777215;
      
      private static const const_1029:int = 10066329;
      
      private static const const_1028:int = 10066329;
      
      public static const const_1153:int = 13421772;
       
      
      private var var_1375:int = 0;
      
      private var var_1256:String = null;
      
      protected var _data:RoomVisualizationData = null;
      
      private var _assetLibrary:AssetLibrary = null;
      
      private var var_1758:int = -1000;
      
      private var var_929:uint = 16777215;
      
      private var var_1255:String = null;
      
      private var var_1757:Boolean = true;
      
      private var var_1079:int = -1;
      
      private var var_113:Array;
      
      private var var_1755:Boolean = false;
      
      private var var_1756:String = null;
      
      private const const_1590:int = 250;
      
      private var var_85:RoomPlaneParser = null;
      
      private var var_1588:Number = 0;
      
      private var var_1586:Number = 0;
      
      private var var_905:Number = 0;
      
      private var _floorType:String = null;
      
      private var _planeMaskParser:RoomPlaneBitmapMaskParser = null;
      
      private var var_1589:Number = 0;
      
      public function RoomVisualization()
      {
         var_113 = [];
         super();
         _assetLibrary = new AssetLibrary("room visualization");
         var_85 = new RoomPlaneParser();
         _planeMaskParser = new RoomPlaneBitmapMaskParser();
         Randomizer.setSeed(123);
         Randomizer.setSeed(124);
      }
      
      private function getLandscapeHeight() : Number
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc1_:* = 0;
         var _loc2_:int = 0;
         while(_loc2_ < var_85.planeCount)
         {
            _loc3_ = var_85.getPlaneType(_loc2_);
            if(_loc3_ == RoomPlaneData.const_259)
            {
               _loc4_ = var_85.getPlaneRightSide(_loc2_);
               if(_loc4_.length > _loc1_)
               {
                  _loc1_ = Number(_loc4_.length);
               }
            }
            _loc2_++;
         }
         if(_loc1_ > 5)
         {
            _loc1_ = 5;
         }
         return _loc1_;
      }
      
      override public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         reset();
         if(param1 == null || !(param1 is RoomVisualizationData))
         {
            return false;
         }
         _data = param1 as RoomVisualizationData;
         _data.initializeAssetCollection(assetCollection);
         return true;
      }
      
      protected function initializeRoomPlanes() : void
      {
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:int = 0;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:int = 0;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         if(var_1755)
         {
            return;
         }
         var _loc1_:IRoomObject = object;
         if(_loc1_ == null)
         {
            return;
         }
         var _loc2_:String = _loc1_.getModel().getString(RoomObjectVariableEnum.const_799);
         if(!var_85.initializeFromXML(new XML(_loc2_)))
         {
            return;
         }
         var _loc3_:Number = getLandscapeWidth();
         var _loc4_:Number = getLandscapeHeight();
         var _loc5_:* = 0;
         var _loc6_:int = _loc1_.getModel().getNumber(RoomObjectVariableEnum.const_839);
         var _loc7_:int = 0;
         while(_loc7_ < var_85.planeCount)
         {
            _loc8_ = var_85.getPlaneLocation(_loc7_);
            _loc9_ = var_85.getPlaneLeftSide(_loc7_);
            _loc10_ = var_85.getPlaneRightSide(_loc7_);
            _loc11_ = var_85.getPlaneSecondaryNormals(_loc7_);
            _loc12_ = var_85.getPlaneType(_loc7_);
            _loc13_ = null;
            if(!(_loc8_ != null && _loc9_ != null && _loc10_ != null))
            {
               return;
            }
            _loc14_ = Vector3d.crossProduct(_loc9_,_loc10_);
            _loc6_ = _loc6_ * 7613 + 517;
            _loc13_ = null;
            if(_loc12_ == RoomPlaneData.const_138)
            {
               _loc13_ = new RoomPlane(_loc1_.getLocation(),_loc8_,_loc9_,_loc10_,RoomPlane.const_181,true,_loc11_,_loc6_);
               if(_loc14_.z != 0)
               {
                  _loc13_.color = const_1272;
               }
               else
               {
                  _loc13_.color = const_1306;
               }
               if(_loc9_.length < 1 || _loc10_.length < 1)
               {
                  _loc13_.hasTexture = false;
               }
               if(_data != null)
               {
                  _loc13_.rasterizer = _data.floorRasterizer;
               }
            }
            else if(_loc12_ == RoomPlaneData.const_136)
            {
               _loc13_ = new RoomPlane(_loc1_.getLocation(),_loc8_,_loc9_,_loc10_,RoomPlane.const_228,true,_loc11_,_loc6_);
               if(_loc9_.length < 1 || _loc10_.length < 1)
               {
                  _loc13_.hasTexture = false;
               }
               if(_loc14_.x == 0 && _loc14_.y == 0)
               {
                  _loc13_.color = const_1028;
               }
               else if(_loc14_.y > 0)
               {
                  _loc13_.color = const_1027;
               }
               else if(_loc14_.y == 0)
               {
                  _loc13_.color = const_1030;
               }
               else
               {
                  _loc13_.color = const_1029;
               }
               if(_data != null)
               {
                  _loc13_.rasterizer = _data.wallRasterizer;
               }
            }
            else if(_loc12_ == RoomPlaneData.const_259)
            {
               _loc13_ = new RoomPlane(_loc1_.getLocation(),_loc8_,_loc9_,_loc10_,RoomPlane.const_179,true,_loc11_,_loc6_,_loc5_,0,_loc3_,_loc4_);
               if(_loc14_.y > 0)
               {
                  _loc13_.color = const_1286;
               }
               else if(_loc14_.y == 0)
               {
                  _loc13_.color = const_1153;
               }
               else
               {
                  _loc13_.color = const_1259;
               }
               if(_data != null)
               {
                  _loc13_.rasterizer = _data.landscapeRasterizer;
               }
               _loc5_ += _loc9_.length;
            }
            if(_loc13_ != null)
            {
               _loc13_.maskManager = _data.maskManager;
               _loc15_ = 0;
               while(_loc15_ < var_85.getPlaneMaskCount(_loc7_))
               {
                  _loc16_ = var_85.getPlaneMaskLeftSideLoc(_loc7_,_loc15_);
                  _loc17_ = var_85.getPlaneMaskRightSideLoc(_loc7_,_loc15_);
                  _loc18_ = var_85.getPlaneMaskLeftSideLength(_loc7_,_loc15_);
                  _loc19_ = var_85.getPlaneMaskRightSideLength(_loc7_,_loc15_);
                  _loc13_.addRectangleMask(_loc16_,_loc17_,_loc18_,_loc19_);
                  _loc15_++;
               }
               var_113.push(_loc13_);
            }
            _loc7_++;
         }
         var_1755 = true;
         defineSprites();
      }
      
      protected function defineSprites() : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc1_:int = 0;
         createSprites(_loc1_ + 1);
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            _loc3_ = var_113[_loc2_] as RoomPlane;
            _loc4_ = getSprite(1 + _loc2_);
            if(_loc4_ != null && _loc3_ != null && _loc3_.leftSide != null && _loc3_.rightSide != null)
            {
               if(_loc3_.type == RoomPlane.const_228 && (_loc3_.leftSide.length < 1 || _loc3_.rightSide.length < 1))
               {
                  _loc4_.capturesMouse = false;
               }
               else
               {
                  _loc4_.capturesMouse = true;
               }
               _loc4_.tag = "plane@" + (_loc2_ + 1);
            }
            _loc2_++;
         }
      }
      
      override public function dispose() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         super.dispose();
         if(_assetLibrary != null)
         {
            _assetLibrary.dispose();
            _assetLibrary = null;
         }
         if(var_113 != null)
         {
            _loc1_ = 0;
            while(_loc1_ < var_113.length)
            {
               _loc2_ = var_113[_loc1_] as RoomPlane;
               if(_loc2_ != null)
               {
                  _loc2_.dispose();
               }
               _loc1_++;
            }
            var_113 = null;
         }
         if(var_85 != null)
         {
            var_85.dispose();
            var_85 = null;
         }
         if(_planeMaskParser != null)
         {
            _planeMaskParser.dispose();
            _planeMaskParser = null;
         }
      }
      
      public function get floorRelativeDepth() : Number
      {
         return 100.1;
      }
      
      public function get wallRelativeDepth() : Number
      {
         return 100.5;
      }
      
      protected function updatePlaneMasks(param1:String) : void
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:int = 0;
         var _loc10_:* = null;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         if(param1 == null)
         {
            return;
         }
         var _loc2_:XML = XML(param1);
         _planeMaskParser.initialize(_loc2_);
         var _loc3_:* = null;
         var _loc4_:int = 0;
         while(_loc4_ < var_113.length)
         {
            _loc3_ = var_113[_loc4_] as RoomPlane;
            if(_loc3_ != null)
            {
               _loc3_.resetBitmapMasks();
            }
            _loc4_++;
         }
         var _loc5_:int = 0;
         while(_loc5_ < _planeMaskParser.maskCount)
         {
            _loc6_ = _planeMaskParser.getMaskType(_loc5_);
            _loc7_ = _planeMaskParser.getMaskLocation(_loc5_);
            _loc8_ = _planeMaskParser.getMaskCategory(_loc5_);
            if(_loc7_ != null)
            {
               _loc9_ = 0;
               while(_loc9_ < var_113.length)
               {
                  _loc3_ = var_113[_loc9_] as RoomPlane;
                  if(_loc3_.type == RoomPlane.const_228 || _loc3_.type == RoomPlane.const_179 && _loc8_ == RoomPlaneBitmapMaskData.const_192)
                  {
                     if(_loc3_ != null && _loc3_.location != null && _loc3_.normal != null)
                     {
                        _loc10_ = Vector3d.dif(_loc7_,_loc3_.location);
                        _loc11_ = Math.abs(Vector3d.scalarProjection(_loc10_,_loc3_.normal));
                        if(_loc11_ < 0.01)
                        {
                           if(_loc3_.leftSide != null && _loc3_.rightSide != null)
                           {
                              _loc12_ = Vector3d.scalarProjection(_loc10_,_loc3_.leftSide);
                              _loc13_ = Vector3d.scalarProjection(_loc10_,_loc3_.rightSide);
                              _loc3_.addBitmapMask(_loc6_,_loc12_,_loc13_);
                           }
                        }
                     }
                  }
                  _loc9_++;
               }
            }
            _loc5_++;
         }
      }
      
      protected function updatePlanes(param1:IRoomGeometry, param2:Boolean, param3:int) : void
      {
         var _loc7_:* = null;
         var _loc8_:Boolean = false;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:int = 0;
         var _loc15_:* = null;
         var _loc4_:IRoomObject = object;
         if(_loc4_ == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         ++var_1375;
         var _loc5_:int = param3;
         var _loc6_:int = 0;
         while(_loc6_ < var_113.length)
         {
            _loc7_ = null;
            _loc8_ = false;
            _loc9_ = var_113[_loc6_] as RoomPlane;
            if(_loc9_ != null)
            {
               if(_loc9_.update(param1,_loc5_,param2))
               {
                  if(_loc9_.visible)
                  {
                     _loc11_ = "plane " + _loc6_ + " " + param1.scale;
                     _loc7_ = _assetLibrary.getAssetByName(_loc11_) as BitmapDataAsset;
                     if(_loc7_ == null)
                     {
                        _loc7_ = new BitmapDataAsset(_assetLibrary.getAssetTypeDeclarationByClass(BitmapDataAsset));
                        _assetLibrary.setAsset(_loc11_,_loc7_);
                     }
                     _loc12_ = _loc7_.content as BitmapData;
                     _loc13_ = _loc9_.copyBitmapData(_loc12_);
                     if(_loc13_ == null)
                     {
                        _loc13_ = _loc9_.bitmapData;
                     }
                     if(_loc13_ == null)
                     {
                        _loc7_ = null;
                     }
                     else if(_loc12_ != _loc13_)
                     {
                        if(_loc12_ != null)
                        {
                           _loc12_.dispose();
                        }
                        else
                        {
                           _loc14_ = 1;
                        }
                        _loc7_.setUnknownContent(_loc13_);
                     }
                  }
                  _loc8_ = true;
               }
            }
            else
            {
               _loc7_ = null;
            }
            _loc10_ = getSprite(1 + _loc6_);
            if(_loc10_ != null)
            {
               if(_loc9_ != null)
               {
                  _loc10_.visible = _loc9_.visible;
                  if(_loc10_.visible)
                  {
                     _loc15_ = _loc9_.offset;
                     _loc10_.offsetX = -_loc15_.x;
                     _loc10_.offsetY = -_loc15_.y;
                     _loc10_.color = _loc9_.color;
                     if(_loc8_)
                     {
                        _loc10_.asset = _loc7_;
                        _loc10_.assetName = _loc11_ + "_" + var_1375;
                     }
                     if(var_85.getPlaneType(_loc6_) == RoomPlaneData.const_138)
                     {
                        _loc10_.relativeDepth = _loc9_.relativeDepth + floorRelativeDepth + Number(_loc6_) / 1000;
                     }
                     else
                     {
                        _loc10_.relativeDepth = _loc9_.relativeDepth + wallRelativeDepth + Number(_loc6_) / 1000;
                     }
                  }
               }
               else
               {
                  _loc10_.visible = false;
               }
            }
            _loc6_++;
         }
      }
      
      private function getLandscapeWidth() : Number
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc1_:* = 0;
         var _loc2_:int = 0;
         while(_loc2_ < var_85.planeCount)
         {
            _loc3_ = var_85.getPlaneType(_loc2_);
            if(_loc3_ == RoomPlaneData.const_259)
            {
               _loc4_ = var_85.getPlaneLeftSide(_loc2_);
               _loc1_ += _loc4_.length;
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      override public function update(param1:IRoomGeometry = null, param2:int = 0) : void
      {
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = 0;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var _loc16_:* = null;
         var _loc17_:* = 0;
         var _loc18_:* = 0;
         var _loc19_:* = 0;
         var _loc20_:* = 0;
         var _loc21_:* = 0;
         var _loc3_:IRoomObject = object;
         if(_loc3_ == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         var _loc4_:Boolean = false;
         var _loc5_:Boolean = false;
         if(param1.updateId != var_1079)
         {
            var_1079 = param1.updateId;
            _loc9_ = param1.direction;
            if(_loc9_ != null && (_loc9_.x != var_905 || _loc9_.y != var_1588 || _loc9_.z != var_1586 || param1.scale != var_1589))
            {
               var_905 = _loc9_.x;
               var_1588 = _loc9_.y;
               var_1586 = _loc9_.z;
               var_1589 = param1.scale;
               _loc4_ = true;
            }
         }
         var _loc6_:IRoomObjectModel = _loc3_.getModel();
         initializeRoomPlanes();
         if(var_166 != _loc6_.getUpdateID())
         {
            _loc10_ = _loc6_.getString(RoomObjectVariableEnum.const_960);
            if(_loc10_ != var_1756)
            {
               updatePlaneMasks(_loc10_);
               var_1756 = _loc10_;
               _loc5_ = true;
            }
            _loc11_ = uint(_loc6_.getNumber(RoomObjectVariableEnum.const_713));
            if(_loc11_ != var_929)
            {
               var_929 = _loc11_;
               _loc5_ = true;
            }
         }
         var _loc7_:int = param2;
         if(_loc7_ < var_1758 + const_1590 && !_loc4_ && !_loc5_)
         {
            return;
         }
         var_1758 = _loc7_;
         if(var_166 != _loc6_.getUpdateID())
         {
            _loc12_ = _loc6_.getString(RoomObjectVariableEnum.const_684);
            _loc13_ = _loc6_.getString(RoomObjectVariableEnum.const_513);
            _loc14_ = _loc6_.getString(RoomObjectVariableEnum.const_604);
            updatePlaneTextureTypes(_loc13_,_loc12_,_loc14_);
            var_1757 = Boolean(_loc6_.getNumber(RoomObjectVariableEnum.const_1000));
            var_166 = _loc6_.getUpdateID();
         }
         updatePlanes(param1,_loc4_,param2);
         var _loc8_:int = 0;
         while(_loc8_ < var_113.length)
         {
            _loc15_ = getSprite(1 + _loc8_);
            _loc16_ = var_113[_loc8_] as RoomPlane;
            if(_loc15_ != null && _loc16_ != null && _loc16_.type != RoomPlane.const_179)
            {
               _loc17_ = uint(_loc16_.color);
               if(var_1757)
               {
                  _loc18_ = uint((_loc17_ & 255) * (var_929 & 255) / 255);
                  _loc19_ = uint((_loc17_ >> 8 & 255) * (var_929 >> 8 & 255) / 255);
                  _loc20_ = uint((_loc17_ >> 16 & 255) * (var_929 >> 16 & 255) / 255);
                  _loc21_ = uint(_loc17_ >> 24);
                  _loc17_ = uint((_loc21_ << 24) + (_loc20_ << 16) + (_loc19_ << 8) + _loc18_);
               }
               _loc15_.color = _loc17_;
            }
            _loc8_++;
         }
      }
      
      protected function updatePlaneTextureTypes(param1:String, param2:String, param3:String) : Boolean
      {
         var _loc5_:* = null;
         if(param1 != _floorType)
         {
            _floorType = param1;
         }
         else
         {
            param1 = null;
         }
         if(param2 != var_1256)
         {
            var_1256 = param2;
         }
         else
         {
            param2 = null;
         }
         if(param3 != var_1255)
         {
            var_1255 = param3;
         }
         else
         {
            param3 = null;
         }
         if(param1 == null && param2 == null && param3 == null)
         {
            return false;
         }
         var _loc4_:int = 0;
         while(_loc4_ < var_113.length)
         {
            _loc5_ = var_113[_loc4_] as RoomPlane;
            if(_loc5_ != null)
            {
               if(_loc5_.type == RoomPlane.const_181 && param1 != null)
               {
                  _loc5_.id = param1;
               }
               else if(_loc5_.type == RoomPlane.const_228 && param2 != null)
               {
                  _loc5_.id = param2;
               }
               else if(_loc5_.type == RoomPlane.const_179 && param3 != null)
               {
                  _loc5_.id = param3;
               }
            }
            _loc4_++;
         }
         return true;
      }
   }
}
