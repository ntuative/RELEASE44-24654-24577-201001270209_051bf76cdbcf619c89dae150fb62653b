package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetPetInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const PET_INFO:String = "RWPIUE_PET_INFO";
       
      
      private var var_1825:int;
      
      private var var_1901:int;
      
      private var var_1896:int;
      
      private var _nutrition:int;
      
      private var var_1898:int;
      
      private var var_1899:int;
      
      private var _energy:int;
      
      private var var_950:int;
      
      private var var_1902:int;
      
      private var var_1903:int;
      
      private var var_1897:int;
      
      private var _id:int;
      
      private var _petRespect:int;
      
      private var _canOwnerBeKicked:Boolean;
      
      private var var_1900:int;
      
      private var _image:BitmapData;
      
      private var _ownerName:String;
      
      private var include:Boolean;
      
      private var _name:String;
      
      private var var_483:int;
      
      private var var_1904:int;
      
      public function RoomWidgetPetInfoUpdateEvent(param1:int, param2:int, param3:String, param4:int, param5:BitmapData, param6:Boolean, param7:int, param8:String, param9:int, param10:Boolean = false, param11:Boolean = false)
      {
         super(RoomWidgetPetInfoUpdateEvent.PET_INFO,param10,param11);
         var_950 = param1;
         var_1900 = param2;
         _name = param3;
         _id = param4;
         _image = param5;
         include = param6;
         var_1904 = param7;
         _ownerName = param8;
         var_1903 = param9;
      }
      
      public function get isOwnPet() : Boolean
      {
         return include;
      }
      
      public function get level() : int
      {
         return var_1825;
      }
      
      public function set levelMax(param1:int) : void
      {
         var_1899 = param1;
      }
      
      public function get energy() : int
      {
         return _energy;
      }
      
      public function set level(param1:int) : void
      {
         var_1825 = param1;
      }
      
      public function get petRace() : int
      {
         return var_1900;
      }
      
      public function set energy(param1:int) : void
      {
         _energy = param1;
      }
      
      public function get nutrition() : int
      {
         return _nutrition;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set petRespectLeft(param1:int) : void
      {
         var_483 = param1;
      }
      
      public function get experienceMax() : int
      {
         return var_1898;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get nutritionMax() : int
      {
         return var_1896;
      }
      
      public function get ownerId() : int
      {
         return var_1904;
      }
      
      public function set nutrition(param1:int) : void
      {
         _nutrition = param1;
      }
      
      public function set experienceMax(param1:int) : void
      {
         var_1898 = param1;
      }
      
      public function get roomIndex() : int
      {
         return var_1903;
      }
      
      public function get energyMax() : int
      {
         return var_1902;
      }
      
      public function get levelMax() : int
      {
         return var_1899;
      }
      
      public function get petRespect() : int
      {
         return _petRespect;
      }
      
      public function get petRespectLeft() : int
      {
         return var_483;
      }
      
      public function set canOwnerBeKicked(param1:Boolean) : void
      {
         _canOwnerBeKicked = param1;
      }
      
      public function set nutritionMax(param1:int) : void
      {
         var_1896 = param1;
      }
      
      public function get image() : BitmapData
      {
         return _image;
      }
      
      public function set petRespect(param1:int) : void
      {
         _petRespect = param1;
      }
      
      public function set experience(param1:int) : void
      {
         var_1901 = param1;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get canOwnerBeKicked() : Boolean
      {
         return _canOwnerBeKicked;
      }
      
      public function get experience() : int
      {
         return var_1901;
      }
      
      public function set energyMax(param1:int) : void
      {
         var_1902 = param1;
      }
      
      public function get petType() : int
      {
         return var_950;
      }
      
      public function set age(param1:int) : void
      {
         var_1897 = param1;
      }
      
      public function get age() : int
      {
         return var_1897;
      }
   }
}
