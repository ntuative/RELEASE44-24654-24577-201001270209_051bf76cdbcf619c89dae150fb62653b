package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class ObjectMessageData
   {
       
      
      private var var_1047:int = 0;
      
      private var _data:String = "";
      
      private var var_1350:int = -1;
      
      private var var_46:int = 0;
      
      private var _type:int = 0;
      
      private var var_1046:int = 0;
      
      private var var_2323:String = "";
      
      private var var_1821:int = 0;
      
      private var _id:int = 0;
      
      private var var_204:Boolean = false;
      
      private var var_228:int = 0;
      
      private var var_2086:String = null;
      
      private var var_94:Number = 0;
      
      private var _y:Number = 0;
      
      private var var_93:Number = 0;
      
      public function ObjectMessageData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function set type(param1:int) : void
      {
         if(!var_204)
         {
            _type = param1;
         }
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_204)
         {
            _y = param1;
         }
      }
      
      public function get dir() : int
      {
         return var_228;
      }
      
      public function get extra() : int
      {
         return var_1350;
      }
      
      public function get state() : int
      {
         return var_46;
      }
      
      public function set dir(param1:int) : void
      {
         if(!var_204)
         {
            var_228 = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set x(param1:Number) : void
      {
         if(!var_204)
         {
            var_94 = param1;
         }
      }
      
      public function set extra(param1:int) : void
      {
         if(!var_204)
         {
            var_1350 = param1;
         }
      }
      
      public function get z() : Number
      {
         return var_93;
      }
      
      public function set state(param1:int) : void
      {
         if(!var_204)
         {
            var_46 = param1;
         }
      }
      
      public function get data() : String
      {
         return _data;
      }
      
      public function get expiryTime() : int
      {
         return var_1821;
      }
      
      public function get staticClass() : String
      {
         return var_2086;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function set expiryTime(param1:int) : void
      {
         if(!var_204)
         {
            var_1821 = param1;
         }
      }
      
      public function set data(param1:String) : void
      {
         if(!var_204)
         {
            _data = param1;
         }
      }
      
      public function set staticClass(param1:String) : void
      {
         if(!var_204)
         {
            var_2086 = param1;
         }
      }
      
      public function setReadOnly() : void
      {
         var_204 = true;
      }
      
      public function set sizeX(param1:int) : void
      {
         if(!var_204)
         {
            var_1047 = param1;
         }
      }
      
      public function set sizeY(param1:int) : void
      {
         if(!var_204)
         {
            var_1046 = param1;
         }
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_204)
         {
            var_93 = param1;
         }
      }
      
      public function get sizeX() : int
      {
         return var_1047;
      }
      
      public function get x() : Number
      {
         return var_94;
      }
      
      public function get sizeY() : int
      {
         return var_1046;
      }
   }
}
