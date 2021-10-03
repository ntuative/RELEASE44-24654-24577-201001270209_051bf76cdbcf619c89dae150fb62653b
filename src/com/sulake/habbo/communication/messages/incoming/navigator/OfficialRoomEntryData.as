package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_1297:int = 4;
      
      public static const const_719:int = 3;
      
      public static const const_687:int = 2;
      
      public static const const_800:int = 1;
       
      
      private var var_2164:String;
      
      private var _disposed:Boolean;
      
      private var var_1733:int;
      
      private var var_2165:Boolean;
      
      private var var_792:String;
      
      private var var_873:PublicRoomData;
      
      private var var_2167:int;
      
      private var _index:int;
      
      private var var_2166:String;
      
      private var _type:int;
      
      private var var_1660:String;
      
      private var var_874:GuestRoomData;
      
      private var var_2163:String;
      
      private var _open:Boolean;
      
      public function OfficialRoomEntryData(param1:IMessageDataWrapper)
      {
         super();
         _index = param1.readInteger();
         var_2164 = param1.readString();
         var_2163 = param1.readString();
         var_2165 = param1.readInteger() == 1;
         var_2166 = param1.readString();
         var_792 = param1.readString();
         var_2167 = param1.readInteger();
         var_1733 = param1.readInteger();
         _type = param1.readInteger();
         if(_type == const_800)
         {
            var_1660 = param1.readString();
         }
         else if(_type == const_719)
         {
            var_873 = new PublicRoomData(param1);
         }
         else if(_type == const_687)
         {
            var_874 = new GuestRoomData(param1);
         }
      }
      
      public function get folderId() : int
      {
         return var_2167;
      }
      
      public function get popupCaption() : String
      {
         return var_2164;
      }
      
      public function get userCount() : int
      {
         return var_1733;
      }
      
      public function get open() : Boolean
      {
         return _open;
      }
      
      public function get showDetails() : Boolean
      {
         return var_2165;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_800)
         {
            return 0;
         }
         if(this.type == const_687)
         {
            return this.var_874.maxUserCount;
         }
         if(this.type == const_719)
         {
            return this.var_873.maxUsers;
         }
         return 0;
      }
      
      public function get popupDesc() : String
      {
         return var_2163;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(this.var_874 != null)
         {
            this.var_874.dispose();
            this.var_874 = null;
         }
         if(this.var_873 != null)
         {
            this.var_873.dispose();
            this.var_873 = null;
         }
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return var_874;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get picText() : String
      {
         return var_2166;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return var_873;
      }
      
      public function get picRef() : String
      {
         return var_792;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get tag() : String
      {
         return var_1660;
      }
      
      public function toggleOpen() : void
      {
         _open = !_open;
      }
   }
}
