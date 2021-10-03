package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.communication.messages.incoming.navigator.FlatCategory;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomSearchResultData;
   import com.sulake.habbo.communication.messages.incoming.navigator.MsgWithRequestId;
   import com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PopularRoomTagsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.parser.navigator.FavouritesMessageParser;
   import com.sulake.habbo.communication.messages.parser.navigator.NavigatorSettingsMessageParser;
   import com.sulake.habbo.communication.messages.parser.room.engine.RoomEntryInfoMessageParser;
   import com.sulake.habbo.navigator.HabboNavigator;
   import flash.utils.Dictionary;
   
   public class NavigatorData
   {
      
      private static const const_1411:int = 10;
       
      
      private var var_1541:NavigatorSettingsMessageParser;
      
      private var var_1311:int;
      
      private var var_2210:Boolean;
      
      private var var_2208:int;
      
      private var var_886:Dictionary;
      
      private var var_2296:int;
      
      private var var_2209:int;
      
      private var var_1578:int;
      
      private var var_346:Array;
      
      private var var_2207:int;
      
      private var var_598:PublicRoomShortData;
      
      private var var_425:RoomEventData;
      
      private var var_149:MsgWithRequestId;
      
      private var var_2071:Boolean;
      
      private var _navigator:HabboNavigator;
      
      private var var_2206:Boolean;
      
      private var var_209:GuestRoomData;
      
      private var var_716:Boolean;
      
      private var _currentRoomOwner:Boolean;
      
      public function NavigatorData(param1:HabboNavigator)
      {
         var_346 = new Array();
         var_886 = new Dictionary();
         super();
         _navigator = param1;
      }
      
      public function get createdFlatId() : int
      {
         return var_2208;
      }
      
      public function get eventMod() : Boolean
      {
         return var_2206;
      }
      
      public function startLoading() : void
      {
         this.var_716 = true;
      }
      
      public function isRoomFavourite(param1:int) : Boolean
      {
         return false;
      }
      
      public function set eventMod(param1:Boolean) : void
      {
         var_2206 = param1;
      }
      
      public function set roomEventData(param1:RoomEventData) : void
      {
         if(var_425 != null)
         {
            var_425.dispose();
         }
         var_425 = param1;
      }
      
      public function get popularTagsArrived() : Boolean
      {
         return var_149 != null && var_149 as PopularRoomTagsData != null;
      }
      
      public function get guestRoomSearchArrived() : Boolean
      {
         return var_149 != null && var_149 as GuestRoomSearchResultData != null;
      }
      
      public function set officialRooms(param1:OfficialRoomsData) : void
      {
         disposeCurrentMsg();
         var_149 = param1;
         var_716 = false;
      }
      
      public function get guestRoomSearchResults() : GuestRoomSearchResultData
      {
         return var_149 as GuestRoomSearchResultData;
      }
      
      public function get enteredGuestRoom() : GuestRoomData
      {
         return var_209;
      }
      
      public function onRoomEnter(param1:RoomEntryInfoMessageParser) : void
      {
         var_598 = null;
         var_209 = null;
         _currentRoomOwner = false;
         if(param1.guestRoom)
         {
            _currentRoomOwner = param1.owner;
         }
         else
         {
            var_598 = param1.publicSpace;
            var_425 = null;
         }
      }
      
      public function onRoomExit() : void
      {
         if(var_425 != null)
         {
            var_425.dispose();
            var_425 = null;
         }
         if(var_598 != null)
         {
            var_598.dispose();
            var_598 = null;
         }
         if(var_209 != null)
         {
            var_209.dispose();
            var_209 = null;
         }
         _currentRoomOwner = false;
      }
      
      public function get settings() : NavigatorSettingsMessageParser
      {
         return var_1541;
      }
      
      public function set popularTags(param1:PopularRoomTagsData) : void
      {
         disposeCurrentMsg();
         var_149 = param1;
         var_716 = false;
      }
      
      public function get currentRoomOwner() : Boolean
      {
         return _currentRoomOwner;
      }
      
      public function getCategoryByIndex(param1:int) : FlatCategory
      {
         if(var_346.length > param1)
         {
            return var_346[param1] as FlatCategory;
         }
         return null;
      }
      
      public function onFavourites(param1:FavouritesMessageParser) : void
      {
         var _loc2_:int = 0;
         this.var_2296 = param1.limit;
         this.var_1311 = param1.favouriteRoomIds.length;
         this.var_886 = new Dictionary();
         for each(_loc2_ in param1.favouriteRoomIds)
         {
            this.var_886[_loc2_] = "yes";
         }
      }
      
      public function get popularTags() : PopularRoomTagsData
      {
         return var_149 as PopularRoomTagsData;
      }
      
      public function get categories() : Array
      {
         return var_346;
      }
      
      public function get enteredPublicSpace() : PublicRoomShortData
      {
         return var_598;
      }
      
      public function set avatarId(param1:int) : void
      {
         var_1578 = param1;
      }
      
      public function get hotRoomPopupOpen() : Boolean
      {
         return var_2210;
      }
      
      public function set guestRoomSearchResults(param1:GuestRoomSearchResultData) : void
      {
         disposeCurrentMsg();
         var_149 = param1;
         var_716 = false;
      }
      
      public function getCategoryIndexById(param1:int) : int
      {
         var _loc2_:int = 0;
         while(_loc2_ < var_346.length)
         {
            if((var_346[_loc2_] as FlatCategory).nodeId == param1)
            {
               return _loc2_;
            }
            _loc2_++;
         }
         return -1;
      }
      
      public function get canEditRoomSettings() : Boolean
      {
         return var_209 != null && _currentRoomOwner;
      }
      
      public function isLoading() : Boolean
      {
         return this.var_716;
      }
      
      public function set categories(param1:Array) : void
      {
         var_346 = param1;
      }
      
      public function get currentRoomRating() : int
      {
         return var_2209;
      }
      
      public function get publicSpaceNodeId() : int
      {
         return var_2207;
      }
      
      public function set settings(param1:NavigatorSettingsMessageParser) : void
      {
         var_1541 = param1;
      }
      
      private function disposeCurrentMsg() : void
      {
         if(var_149 == null)
         {
            return;
         }
         var_149.dispose();
         var_149 = null;
      }
      
      public function get roomEventData() : RoomEventData
      {
         return var_425;
      }
      
      public function favouriteChanged(param1:int, param2:Boolean) : void
      {
         var_886[param1] = !!param2 ? "yes" : null;
         var_1311 += !!param2 ? 1 : -1;
      }
      
      public function get officialRooms() : OfficialRoomsData
      {
         return var_149 as OfficialRoomsData;
      }
      
      public function get avatarId() : int
      {
         return var_1578;
      }
      
      public function isCurrentRoomFavourite() : Boolean
      {
         var _loc1_:int = 0;
         return false;
      }
      
      public function get officialRoomsArrived() : Boolean
      {
         return var_149 != null && var_149 as OfficialRoomsData != null;
      }
      
      public function set hotRoomPopupOpen(param1:Boolean) : void
      {
         var_2210 = param1;
      }
      
      public function set currentRoomRating(param1:int) : void
      {
         var_2209 = param1;
      }
      
      public function set hcMember(param1:Boolean) : void
      {
         var_2071 = param1;
      }
      
      public function set enteredRoom(param1:GuestRoomData) : void
      {
         if(var_209 != null)
         {
            var_209.dispose();
         }
         var_209 = param1;
      }
      
      public function getCategoryById(param1:int) : FlatCategory
      {
         var _loc2_:* = null;
         for each(_loc2_ in var_346)
         {
            if(_loc2_.nodeId == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function isCurrentRoomHome() : Boolean
      {
         if(var_209 == null)
         {
            return false;
         }
         var _loc1_:int = 0;
         return this.var_1541.homeRoomId == _loc1_;
      }
      
      public function isFavouritesFull() : Boolean
      {
         return var_1311 >= var_2296;
      }
      
      public function set publicSpaceNodeId(param1:int) : void
      {
         var_2207 = param1;
      }
      
      public function get hcMember() : Boolean
      {
         return var_2071;
      }
      
      public function get canAddFavourite() : Boolean
      {
         return var_209 != null && !_currentRoomOwner;
      }
      
      public function set createdFlatId(param1:int) : void
      {
         var_2208 = param1;
      }
   }
}
