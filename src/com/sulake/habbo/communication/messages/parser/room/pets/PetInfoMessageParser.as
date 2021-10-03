package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1897:int;
      
      private var var_544:String;
      
      private var var_1825:int;
      
      private var var_1790:int;
      
      private var var_1901:int;
      
      private var var_2109:int;
      
      private var _nutrition:int;
      
      private var var_1240:int;
      
      private var var_2111:int;
      
      private var var_2112:int;
      
      private var _energy:int;
      
      private var _name:String;
      
      private var _ownerName:String;
      
      private var var_1904:int;
      
      private var var_2110:int;
      
      public function PetInfoMessageParser()
      {
         super();
      }
      
      public function get level() : int
      {
         return var_1825;
      }
      
      public function get energy() : int
      {
         return _energy;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get maxEnergy() : int
      {
         return var_2109;
      }
      
      public function flush() : Boolean
      {
         var_1240 = -1;
         return true;
      }
      
      public function get maxLevel() : int
      {
         return var_2111;
      }
      
      public function get experienceRequiredToLevel() : int
      {
         return var_2112;
      }
      
      public function get maxNutrition() : int
      {
         return var_2110;
      }
      
      public function get figure() : String
      {
         return var_544;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get respect() : int
      {
         return var_1790;
      }
      
      public function get petId() : int
      {
         return var_1240;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var_1240 = param1.readInteger();
         _name = param1.readString();
         var_1825 = param1.readInteger();
         var_2111 = param1.readInteger();
         var_1901 = param1.readInteger();
         var_2112 = param1.readInteger();
         _energy = param1.readInteger();
         var_2109 = param1.readInteger();
         _nutrition = param1.readInteger();
         var_2110 = param1.readInteger();
         var_544 = param1.readString();
         var_1790 = param1.readInteger();
         var_1904 = param1.readInteger();
         var_1897 = param1.readInteger();
         _ownerName = param1.readString();
         return true;
      }
      
      public function get nutrition() : int
      {
         return _nutrition;
      }
      
      public function get experience() : int
      {
         return var_1901;
      }
      
      public function get ownerId() : int
      {
         return var_1904;
      }
      
      public function get age() : int
      {
         return var_1897;
      }
   }
}
