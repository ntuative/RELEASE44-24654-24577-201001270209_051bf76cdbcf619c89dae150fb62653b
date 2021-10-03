package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_1733:int;
      
      private var var_1738:String;
      
      private var var_1737:int;
      
      private var var_1735:int;
      
      private var var_692:Boolean;
      
      private var var_1600:Boolean;
      
      private var var_381:int;
      
      private var var_1110:String;
      
      private var var_1601:int;
      
      private var var_1117:int;
      
      private var _ownerName:String;
      
      private var var_718:String;
      
      private var var_1739:int;
      
      private var var_1734:RoomThumbnailData;
      
      private var var_1736:Boolean;
      
      private var var_600:Array;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         var_600 = new Array();
         super();
         var_381 = param1.readInteger();
         var_692 = param1.readBoolean();
         var_718 = param1.readString();
         _ownerName = param1.readString();
         var_1601 = param1.readInteger();
         var_1733 = param1.readInteger();
         var_1739 = param1.readInteger();
         var_1110 = param1.readString();
         var_1737 = param1.readInteger();
         var_1736 = param1.readBoolean();
         var_1735 = param1.readInteger();
         var_1117 = param1.readInteger();
         var_1738 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            var_600.push(_loc4_);
            _loc3_++;
         }
         var_1734 = new RoomThumbnailData(param1);
         var_1600 = param1.readBoolean();
      }
      
      public function get maxUserCount() : int
      {
         return var_1739;
      }
      
      public function get roomName() : String
      {
         return var_718;
      }
      
      public function get userCount() : int
      {
         return var_1733;
      }
      
      public function get score() : int
      {
         return var_1735;
      }
      
      public function get eventCreationTime() : String
      {
         return var_1738;
      }
      
      public function get allowTrading() : Boolean
      {
         return var_1736;
      }
      
      public function get tags() : Array
      {
         return var_600;
      }
      
      public function get allowPets() : Boolean
      {
         return var_1600;
      }
      
      public function get event() : Boolean
      {
         return var_692;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         this.var_600 = null;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get categoryId() : int
      {
         return var_1117;
      }
      
      public function get srchSpecPrm() : int
      {
         return var_1737;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get method_1() : RoomThumbnailData
      {
         return var_1734;
      }
      
      public function get doorMode() : int
      {
         return var_1601;
      }
      
      public function get flatId() : int
      {
         return var_381;
      }
      
      public function get description() : String
      {
         return var_1110;
      }
   }
}
