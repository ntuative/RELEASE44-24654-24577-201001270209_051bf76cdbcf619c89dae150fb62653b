package com.sulake.room.object
{
   import com.sulake.room.object.logic.IRoomObjectEventHandler;
   import com.sulake.room.object.logic.IRoomObjectMouseHandler;
   import com.sulake.room.object.visualization.IRoomObjectVisualization;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomObject implements IRoomObjectController
   {
      
      private static var var_1103:int = 0;
       
      
      private var var_82:Vector3d;
      
      private var _updateID:int;
      
      private var _type:String = "";
      
      private var _visualization:IRoomObjectVisualization;
      
      private var _model:RoomObjectModel;
      
      private var var_372:IRoomObjectEventHandler;
      
      private var var_1365:Vector3d;
      
      private var var_1710:int = 0;
      
      private var _id:int;
      
      private var var_1366:Vector3d;
      
      private var var_228:Vector3d;
      
      private var var_438:Array;
      
      public function RoomObject(param1:int, param2:int)
      {
         super();
         _id = param1;
         var_82 = new Vector3d();
         var_228 = new Vector3d();
         var_1365 = new Vector3d();
         var_1366 = new Vector3d();
         var_438 = new Array(param2);
         var _loc3_:Number = param2 - 1;
         while(_loc3_ >= 0)
         {
            var_438[_loc3_] = 0;
            _loc3_--;
         }
         _model = new RoomObjectModel();
         _visualization = null;
         var_372 = null;
         _updateID = 0;
         var_1710 = var_1103++;
      }
      
      public function getInstanceId() : int
      {
         return var_1710;
      }
      
      public function getId() : int
      {
         return _id;
      }
      
      public function getUpdateID() : int
      {
         return _updateID;
      }
      
      public function dispose() : void
      {
         var_82 = null;
         var_228 = null;
         if(_model != null)
         {
            _model.dispose();
            _model = null;
         }
         var_438 = null;
         setVisualization(null);
         setEventHandler(null);
      }
      
      public function getType() : String
      {
         return _type;
      }
      
      public function getLocation() : IVector3d
      {
         var_1365.assign(var_82);
         return var_1365;
      }
      
      public function setLocation(param1:IVector3d) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(var_82.x != param1.x || var_82.y != param1.y || var_82.z != param1.z)
         {
            var_82.x = param1.x;
            var_82.y = param1.y;
            var_82.z = param1.z;
            ++_updateID;
         }
      }
      
      public function setDirection(param1:IVector3d) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(var_228.x != param1.x || var_228.y != param1.y || var_228.z != param1.z)
         {
            var_228.x = (param1.x % 360 + 360) % 360;
            var_228.y = (param1.y % 360 + 360) % 360;
            var_228.z = (param1.z % 360 + 360) % 360;
            ++_updateID;
         }
      }
      
      public function setType(param1:String) : void
      {
         _type = param1;
      }
      
      public function getEventHandler() : IRoomObjectEventHandler
      {
         return var_372;
      }
      
      public function getDirection() : IVector3d
      {
         var_1366.assign(var_228);
         return var_1366;
      }
      
      public function setState(param1:int, param2:int) : Boolean
      {
         if(param2 >= 0 && param2 < var_438.length)
         {
            if(var_438[param2] != param1)
            {
               var_438[param2] = param1;
               ++_updateID;
            }
            return true;
         }
         return false;
      }
      
      public function setEventHandler(param1:IRoomObjectEventHandler) : void
      {
         if(param1 == var_372)
         {
            return;
         }
         var _loc2_:IRoomObjectEventHandler = var_372;
         if(_loc2_ != null)
         {
            var_372 = null;
            _loc2_.object = null;
         }
         var_372 = param1;
         if(var_372 != null)
         {
            var_372.object = this;
         }
      }
      
      public function getState(param1:int) : int
      {
         if(param1 >= 0 && param1 < var_438.length)
         {
            return var_438[param1];
         }
         return -1;
      }
      
      public function setVisualization(param1:IRoomObjectVisualization) : void
      {
         if(param1 != _visualization)
         {
            if(_visualization != null)
            {
               _visualization.dispose();
            }
            _visualization = param1;
            if(_visualization != null)
            {
               _visualization.object = this;
            }
         }
      }
      
      public function getVisualization() : IRoomObjectVisualization
      {
         return _visualization;
      }
      
      public function getModel() : IRoomObjectModel
      {
         return _model;
      }
      
      public function getModelController() : IRoomObjectModelController
      {
         return _model;
      }
      
      public function getMouseHandler() : IRoomObjectMouseHandler
      {
         return getEventHandler();
      }
   }
}
