package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomModerationData implements IDisposable
   {
       
      
      private var var_118:RoomData;
      
      private var _disposed:Boolean;
      
      private var var_1733:int;
      
      private var var_381:int;
      
      private var var_692:RoomData;
      
      private var var_1904:int;
      
      private var _ownerName:String;
      
      private var var_1922:Boolean;
      
      public function RoomModerationData(param1:IMessageDataWrapper)
      {
         super();
         var_381 = param1.readInteger();
         var_1733 = param1.readInteger();
         var_1922 = param1.readBoolean();
         var_1904 = param1.readInteger();
         _ownerName = param1.readString();
         var_118 = new RoomData(param1);
         var_692 = new RoomData(param1);
      }
      
      public function get userCount() : int
      {
         return var_1733;
      }
      
      public function get event() : RoomData
      {
         return var_692;
      }
      
      public function get room() : RoomData
      {
         return var_118;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(var_118 != null)
         {
            var_118.dispose();
            var_118 = null;
         }
         if(var_692 != null)
         {
            var_692.dispose();
            var_692 = null;
         }
      }
      
      public function get flatId() : int
      {
         return var_381;
      }
      
      public function get ownerId() : int
      {
         return var_1904;
      }
      
      public function get ownerInRoom() : Boolean
      {
         return var_1922;
      }
   }
}
