package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserUpdateMessageData
   {
       
      
      private var _y:Number = 0;
      
      private var var_93:Number = 0;
      
      private var var_228:int = 0;
      
      private var var_1708:int = 0;
      
      private var var_1919:Number = 0;
      
      private var var_1918:Number = 0;
      
      private var var_1921:Number = 0;
      
      private var var_1917:Number = 0;
      
      private var var_1920:Boolean = false;
      
      private var var_94:Number = 0;
      
      private var _id:int = 0;
      
      private var var_196:Array;
      
      public function UserUpdateMessageData(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:int, param8:Number, param9:Number, param10:Number, param11:Boolean, param12:Array)
      {
         var_196 = [];
         super();
         _id = param1;
         var_94 = param2;
         _y = param3;
         var_93 = param4;
         var_1917 = param5;
         var_228 = param6;
         var_1708 = param7;
         var_1919 = param8;
         var_1918 = param9;
         var_1921 = param10;
         var_1920 = param11;
         var_196 = param12;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get z() : Number
      {
         return var_93;
      }
      
      public function get dir() : int
      {
         return var_228;
      }
      
      public function get localZ() : Number
      {
         return var_1917;
      }
      
      public function get isMoving() : Boolean
      {
         return var_1920;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get dirHead() : int
      {
         return var_1708;
      }
      
      public function get targetX() : Number
      {
         return var_1919;
      }
      
      public function get targetY() : Number
      {
         return var_1918;
      }
      
      public function get targetZ() : Number
      {
         return var_1921;
      }
      
      public function get x() : Number
      {
         return var_94;
      }
      
      public function get actions() : Array
      {
         return var_196.slice();
      }
   }
}
