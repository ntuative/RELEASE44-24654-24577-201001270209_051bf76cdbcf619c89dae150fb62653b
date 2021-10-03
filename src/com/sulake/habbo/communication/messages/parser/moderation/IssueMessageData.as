package com.sulake.habbo.communication.messages.parser.moderation
{
   import flash.utils.getTimer;
   
   public class IssueMessageData
   {
      
      public static const const_142:int = 1;
      
      public static const const_1268:int = 3;
      
      public static const const_382:int = 2;
       
      
      private var var_2021:int;
      
      private var var_1805:int;
      
      private var var_2026:int;
      
      private var var_1803:int;
      
      private var var_46:int;
      
      private var var_381:int;
      
      private var var_1306:int;
      
      private var var_1669:int;
      
      private var var_1014:int;
      
      private var _roomResources:String;
      
      private var var_2022:int;
      
      private var var_2027:int;
      
      private var var_2024:String;
      
      private var var_1667:String;
      
      private var var_2020:int = 0;
      
      private var var_1266:String;
      
      private var _message:String;
      
      private var var_1652:int;
      
      private var var_2025:String;
      
      private var var_1117:int;
      
      private var var_718:String;
      
      private var var_2023:String;
      
      private var var_1472:int;
      
      public function IssueMessageData()
      {
         super();
      }
      
      public function set reportedUserId(param1:int) : void
      {
         var_1014 = param1;
      }
      
      public function set temporalPriority(param1:int) : void
      {
         var_2020 = param1;
      }
      
      public function get reporterUserId() : int
      {
         return var_2027;
      }
      
      public function set roomName(param1:String) : void
      {
         var_718 = param1;
      }
      
      public function set chatRecordId(param1:int) : void
      {
         var_2022 = param1;
      }
      
      public function get state() : int
      {
         return var_46;
      }
      
      public function get roomResources() : String
      {
         return _roomResources;
      }
      
      public function set roomResources(param1:String) : void
      {
         _roomResources = param1;
      }
      
      public function get roomName() : String
      {
         return var_718;
      }
      
      public function get message() : String
      {
         return _message;
      }
      
      public function set worldId(param1:int) : void
      {
         var_1803 = param1;
      }
      
      public function set state(param1:int) : void
      {
         var_46 = param1;
      }
      
      public function get unitPort() : int
      {
         return var_1805;
      }
      
      public function get priority() : int
      {
         return var_2021 + var_2020;
      }
      
      public function set issueId(param1:int) : void
      {
         var_1669 = param1;
      }
      
      public function get pickerUserName() : String
      {
         return var_1667;
      }
      
      public function getOpenTime() : String
      {
         var _loc1_:int = (getTimer() - var_1472) / 1000;
         var _loc2_:int = _loc1_ % 60;
         var _loc3_:int = _loc1_ / 60;
         var _loc4_:int = _loc3_ % 60;
         var _loc5_:int = _loc3_ / 60;
         var _loc6_:String = _loc2_ < 10 ? "0" + _loc2_ : "" + _loc2_;
         var _loc7_:String = _loc4_ < 10 ? "0" + _loc4_ : "" + _loc4_;
         var _loc8_:String = _loc5_ < 10 ? "0" + _loc5_ : "" + _loc5_;
         return _loc8_ + ":" + _loc7_ + ":" + _loc6_;
      }
      
      public function get categoryId() : int
      {
         return var_1117;
      }
      
      public function set reporterUserId(param1:int) : void
      {
         var_2027 = param1;
      }
      
      public function get roomType() : int
      {
         return var_1306;
      }
      
      public function set flatType(param1:String) : void
      {
         var_2024 = param1;
      }
      
      public function get chatRecordId() : int
      {
         return var_2022;
      }
      
      public function set message(param1:String) : void
      {
         _message = param1;
      }
      
      public function get worldId() : int
      {
         return var_1803;
      }
      
      public function set flatOwnerName(param1:String) : void
      {
         var_2023 = param1;
      }
      
      public function set reportedUserName(param1:String) : void
      {
         var_1266 = param1;
      }
      
      public function get issueId() : int
      {
         return var_1669;
      }
      
      public function set priority(param1:int) : void
      {
         var_2021 = param1;
      }
      
      public function set unitPort(param1:int) : void
      {
         var_1805 = param1;
      }
      
      public function get flatType() : String
      {
         return var_2024;
      }
      
      public function set reportedCategoryId(param1:int) : void
      {
         var_2026 = param1;
      }
      
      public function set pickerUserName(param1:String) : void
      {
         var_1667 = param1;
      }
      
      public function set pickerUserId(param1:int) : void
      {
         var_1652 = param1;
      }
      
      public function get reportedUserName() : String
      {
         return var_1266;
      }
      
      public function set roomType(param1:int) : void
      {
         var_1306 = param1;
      }
      
      public function get reportedCategoryId() : int
      {
         return var_2026;
      }
      
      public function set flatId(param1:int) : void
      {
         var_381 = param1;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_1117 = param1;
      }
      
      public function set timeStamp(param1:int) : void
      {
         var_1472 = param1;
      }
      
      public function get pickerUserId() : int
      {
         return var_1652;
      }
      
      public function set reporterUserName(param1:String) : void
      {
         var_2025 = param1;
      }
      
      public function get timeStamp() : int
      {
         return var_1472;
      }
      
      public function get reportedUserId() : int
      {
         return var_1014;
      }
      
      public function get flatId() : int
      {
         return var_381;
      }
      
      public function get flatOwnerName() : String
      {
         return var_2023;
      }
      
      public function get reporterUserName() : String
      {
         return var_2025;
      }
   }
}
