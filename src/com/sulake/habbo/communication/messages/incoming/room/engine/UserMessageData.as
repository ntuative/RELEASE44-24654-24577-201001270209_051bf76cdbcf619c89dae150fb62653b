package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserMessageData
   {
      
      public static const const_1126:String = "F";
      
      public static const const_914:String = "M";
       
      
      private var var_94:Number = 0;
      
      private var var_544:String = "";
      
      private var var_2015:int = 0;
      
      private var var_2016:String = "";
      
      private var var_2012:int = 0;
      
      private var var_1892:int = 0;
      
      private var var_2013:String = "";
      
      private var var_1173:String = "";
      
      private var _id:int = 0;
      
      private var var_204:Boolean = false;
      
      private var var_228:int = 0;
      
      private var var_2014:String = "";
      
      private var _name:String = "";
      
      private var var_1887:int = 0;
      
      private var _y:Number = 0;
      
      private var var_93:Number = 0;
      
      public function UserMessageData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get z() : Number
      {
         return var_93;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get dir() : int
      {
         return var_228;
      }
      
      public function set dir(param1:int) : void
      {
         if(!var_204)
         {
            var_228 = param1;
         }
      }
      
      public function set name(param1:String) : void
      {
         if(!var_204)
         {
            _name = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get userType() : int
      {
         return var_2015;
      }
      
      public function set groupStatus(param1:int) : void
      {
         if(!var_204)
         {
            var_2012 = param1;
         }
      }
      
      public function get subType() : String
      {
         return var_2014;
      }
      
      public function set groupID(param1:String) : void
      {
         if(!var_204)
         {
            var_2013 = param1;
         }
      }
      
      public function set subType(param1:String) : void
      {
         if(!var_204)
         {
            var_2014 = param1;
         }
      }
      
      public function set xp(param1:int) : void
      {
         if(!var_204)
         {
            var_1892 = param1;
         }
      }
      
      public function set figure(param1:String) : void
      {
         if(!var_204)
         {
            var_544 = param1;
         }
      }
      
      public function set userType(param1:int) : void
      {
         if(!var_204)
         {
            var_2015 = param1;
         }
      }
      
      public function set sex(param1:String) : void
      {
         if(!var_204)
         {
            var_1173 = param1;
         }
      }
      
      public function get groupStatus() : int
      {
         return var_2012;
      }
      
      public function get groupID() : String
      {
         return var_2013;
      }
      
      public function set webID(param1:int) : void
      {
         if(!var_204)
         {
            var_1887 = param1;
         }
      }
      
      public function set custom(param1:String) : void
      {
         if(!var_204)
         {
            var_2016 = param1;
         }
      }
      
      public function setReadOnly() : void
      {
         var_204 = true;
      }
      
      public function get sex() : String
      {
         return var_1173;
      }
      
      public function get figure() : String
      {
         return var_544;
      }
      
      public function get webID() : int
      {
         return var_1887;
      }
      
      public function get custom() : String
      {
         return var_2016;
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_204)
         {
            _y = param1;
         }
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_204)
         {
            var_93 = param1;
         }
      }
      
      public function set x(param1:Number) : void
      {
         if(!var_204)
         {
            var_94 = param1;
         }
      }
      
      public function get x() : Number
      {
         return var_94;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get xp() : int
      {
         return var_1892;
      }
   }
}
