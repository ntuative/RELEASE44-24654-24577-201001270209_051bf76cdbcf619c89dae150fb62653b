package com.sulake.habbo.navigator.inroom
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.outgoing.navigator.AddFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.CanCreateEventMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.DeleteFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RateFlatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.UpdateNavigatorSettingsMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.SimpleAlertView;
   import com.sulake.habbo.navigator.TagRenderer;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.events.HabboRoomSettingsTrackingEvent;
   import com.sulake.habbo.navigator.roomsettings.IRoomSettingsCtrlOwner;
   import com.sulake.habbo.navigator.roomsettings.RoomSettingsCtrl;
   import com.sulake.habbo.navigator.roomthumbnails.RoomThumbnailCtrl;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class RoomInfoViewCtrl implements IRoomSettingsCtrlOwner
   {
       
      
      private var var_640:IWindowContainer;
      
      private var var_958:ITextWindow;
      
      private var var_198:RoomSettingsCtrl;
      
      private var var_1167:IContainerButtonWindow;
      
      private var _window:IWindowContainer;
      
      private var var_465:Timer;
      
      private var var_1170:ITextWindow;
      
      private var var_338:IWindowContainer;
      
      private var var_1855:IWindowContainer;
      
      private var var_1854:ITextWindow;
      
      private var var_782:IWindowContainer;
      
      private var var_1403:IButtonWindow;
      
      private var _ownerName:ITextWindow;
      
      private var var_718:ITextWindow;
      
      private var var_1405:IWindowContainer;
      
      private var var_1165:IWindowContainer;
      
      private var var_781:ITextWindow;
      
      private var var_959:ITextFieldWindow;
      
      private var var_295:IWindowContainer;
      
      private var var_780:ITextWindow;
      
      private var var_1404:IButtonWindow;
      
      private var var_957:ITextWindow;
      
      private var var_2262:int;
      
      private var var_1164:IContainerButtonWindow;
      
      private var var_783:IWindowContainer;
      
      private var var_1169:ITextWindow;
      
      private var var_1166:IContainerButtonWindow;
      
      private var var_1407:ITextWindow;
      
      private var var_1406:IButtonWindow;
      
      private var var_933:TagRenderer;
      
      private var var_1857:ITextWindow;
      
      private var var_337:RoomEventViewCtrl;
      
      private var _navigator:HabboNavigator;
      
      private var var_639:ITextWindow;
      
      private var var_256:RoomThumbnailCtrl;
      
      private var var_1168:IContainerButtonWindow;
      
      private var var_1856:IWindowContainer;
      
      private var var_255:IWindowContainer;
      
      public function RoomInfoViewCtrl(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_337 = new RoomEventViewCtrl(_navigator);
         var_198 = new RoomSettingsCtrl(_navigator,this,true);
         var_256 = new RoomThumbnailCtrl(_navigator);
         var_933 = new TagRenderer(_navigator);
         _navigator.roomSettingsCtrls.push(this.var_198);
         var_465 = new Timer(6000,1);
         var_465.addEventListener(TimerEvent.TIMER,hideInfo);
      }
      
      public function backToRoomSettings() : void
      {
         this.var_198.active = true;
         this.var_337.active = false;
         this.var_256.active = false;
         this.reload();
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      private function refreshEventButtons(param1:RoomEventData) : void
      {
         if(false)
         {
            return;
         }
         var_1403.visible = param1 == null && _navigator.data.currentRoomOwner;
         var_1406.visible = param1 != null && (_navigator.data.currentRoomOwner || _navigator.data.eventMod);
         var_1405.visible = Util.hasVisibleChildren(var_1405);
      }
      
      private function refreshRoomDetails(param1:GuestRoomData, param2:Boolean) : void
      {
         if(param1 == null || false || false)
         {
            return;
         }
         var_718.text = param1.roomName;
         var_718.height = NaN;
         _ownerName.text = param1.ownerName;
         var_781.text = param1.description;
         var_933.refreshTags(var_338,param1.tags);
         var_781.visible = false;
         if(param1.description != "")
         {
            var_781.height = NaN;
            var_781.visible = true;
         }
         var _loc3_:* = _navigator.data.currentRoomRating == -1;
         _navigator.refreshButton(var_338,"thumb_up",_loc3_,onThumbUp,0);
         _navigator.refreshButton(var_338,"thumb_down",_loc3_,onThumbDown,0);
         var_1854.visible = _loc3_;
         var_780.visible = !_loc3_;
         var_1407.visible = !_loc3_;
         var_1407.text = "" + _navigator.data.currentRoomRating;
         _navigator.refreshButton(var_338,"home",param2,null,0);
         _navigator.refreshButton(var_338,"favourite",!param2 && _navigator.data.isCurrentRoomFavourite(),null,0);
         Util.moveChildrenToColumn(var_338,["room_name","owner_name_cont","tags","room_desc","rating_cont"],var_718.y,0);
         var_338.visible = true;
         var_338.height = Util.getLowestPoint(var_338);
      }
      
      private function getButtonsMinHeight() : int
      {
         return !!_navigator.data.currentRoomOwner ? 0 : 21;
      }
      
      private function hideInfo(param1:Event) : void
      {
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_447,HabboToolbarIconEnum.ROOMINFO,_window,false));
      }
      
      private function onThumbUp(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         _navigator.send(new RateFlatMessageComposer(1));
      }
      
      private function getRoomInfoMinHeight() : int
      {
         return 37;
      }
      
      public function onAddFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         if(_navigator.data.isFavouritesFull())
         {
            _loc3_ = new SimpleAlertView(_navigator,"${navigator.favouritesfull.title}","${navigator.favouritesfull.body}");
            _loc3_.show();
         }
         else
         {
            _navigator.send(new AddFavouriteRoomMessageComposer(_navigator.data.enteredGuestRoom.flatId));
         }
      }
      
      private function refreshRoomButtons(param1:Boolean) : void
      {
         if(_navigator.data.enteredGuestRoom == null || false || false)
         {
            return;
         }
         var_1404.visible = _navigator.data.canEditRoomSettings;
         var _loc2_:Boolean = _navigator.data.isCurrentRoomFavourite();
         var_1167.visible = _navigator.data.canAddFavourite && !_loc2_;
         var_1168.visible = _navigator.data.canAddFavourite && _loc2_;
         var_1164.visible = _navigator.data.canEditRoomSettings && !param1;
         var_1166.visible = _navigator.data.canEditRoomSettings && param1;
         var_1165.visible = Util.hasVisibleChildren(var_1165);
      }
      
      public function open(param1:Boolean) : void
      {
         this.var_465.reset();
         this.var_337.active = false;
         this.var_198.active = false;
         this.var_256.active = false;
         if(param1)
         {
            this.startRoomSettingsEdit(_navigator.data.enteredGuestRoom.flatId);
         }
         refresh();
         _window.visible = true;
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_47,HabboToolbarIconEnum.ROOMINFO,_window,false));
         _window.parent.activate();
         _window.activate();
         if(!param1)
         {
            this.var_465.start();
         }
      }
      
      public function toggle() : void
      {
         this.var_465.reset();
         this.var_337.active = false;
         this.var_198.active = false;
         this.var_256.active = false;
         refresh();
         if(true)
         {
            _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_47,HabboToolbarIconEnum.ROOMINFO,_window,false));
            _window.parent.activate();
         }
         else
         {
            _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_447,HabboToolbarIconEnum.ROOMINFO,_window,false));
         }
      }
      
      private function refreshRoom() : void
      {
         Util.hideChildren(var_295);
         var_295.findChildByName("close").visible = true;
         var _loc1_:GuestRoomData = _navigator.data.enteredGuestRoom;
         var _loc2_:Boolean = _navigator.data.settings != null && _loc1_ != null && _loc1_.flatId == _navigator.data.settings.homeRoomId;
         refreshRoomDetails(_loc1_,_loc2_);
         refreshPublicSpaceDetails(_navigator.data.enteredPublicSpace);
         refreshRoomButtons(_loc2_);
         this.var_198.refresh(var_295);
         this.var_256.refresh(var_295);
         Util.moveChildrenToColumn(var_295,["room_details","room_buttons"],0,2);
         var_295.height = Util.getLowestPoint(var_295);
         var_295.visible = true;
         Logger.log("XORP: undefined, undefined, undefined, undefined, undefined");
      }
      
      private function onCloseButtonClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         hideInfo(null);
      }
      
      private function onEmbedSrcClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var_959.setSelection(0,var_959.text.length);
      }
      
      private function getEmbedData() : String
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(_navigator.data.enteredGuestRoom != null)
         {
            _loc1_ = "private";
            _loc2_ = "" + _navigator.data.enteredGuestRoom.flatId;
         }
         else
         {
            _loc1_ = "public";
            _loc2_ = "" + _navigator.data.publicSpaceNodeId;
            Logger.log("Node id is: " + _loc2_);
         }
         var _loc3_:String = _navigator.configuration.getKey("user.hash","");
         _navigator.registerParameter("navigator.embed.src","roomType",_loc1_);
         _navigator.registerParameter("navigator.embed.src","embedCode",_loc3_);
         _navigator.registerParameter("navigator.embed.src","roomId",_loc2_);
         return _navigator.getText("navigator.embed.src");
      }
      
      private function onThumbDown(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         _navigator.send(new RateFlatMessageComposer(-1));
      }
      
      private function refreshEvent() : void
      {
         Util.hideChildren(var_255);
         var _loc1_:RoomEventData = _navigator.data.roomEventData;
         refreshEventDetails(_loc1_);
         refreshEventButtons(_loc1_);
         this.var_337.refresh(var_255);
         if(Util.hasVisibleChildren(var_255) && !this.var_256.active)
         {
            Util.moveChildrenToColumn(var_255,["event_details","event_buttons"],0,2);
            var_255.height = Util.getLowestPoint(var_255);
            var_255.visible = true;
         }
         else
         {
            var_255.visible = false;
         }
         Logger.log("EVENT: undefined, undefined");
      }
      
      public function startEventEdit() : void
      {
         this.var_465.reset();
         this.var_337.active = true;
         this.var_198.active = false;
         this.var_256.active = false;
         this.reload();
      }
      
      private function getEventInfoMinHeight() : int
      {
         return 18;
      }
      
      public function onRemoveFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         _navigator.send(new DeleteFavouriteRoomMessageComposer(_navigator.data.enteredGuestRoom.flatId));
      }
      
      private function onHover(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            return;
         }
         var_465.reset();
      }
      
      private function refreshPublicSpaceDetails(param1:PublicRoomShortData) : void
      {
         if(param1 == null || false || false)
         {
            return;
         }
         var_958.text = _navigator.getPublicSpaceName(param1.unitPropertySet,param1.worldId);
         var_958.height = NaN;
         var_1170.text = _navigator.getPublicSpaceDesc(param1.unitPropertySet,param1.worldId);
         var_1170.height = NaN;
         Util.moveChildrenToColumn(var_640,["public_space_name","public_space_desc"],var_958.y,0);
         var_640.visible = true;
         var_640.height = Math.max(86,Util.getLowestPoint(var_640));
      }
      
      public function reload() : void
      {
         if(_window != null && false)
         {
            refresh();
         }
      }
      
      private function find(param1:String) : IWindow
      {
         var _loc2_:IWindow = _window.findChildByName(param1);
         if(_loc2_ == null)
         {
            throw new Error("Window element with name: " + param1 + " cannot be found!");
         }
         return _loc2_;
      }
      
      private function refreshEmbed() : void
      {
         var _loc1_:* = _navigator.configuration.getKey("embed.showInRoomInfo","false") == "true";
         if(_loc1_ && true && true && true)
         {
            var_783.visible = true;
            var_959.text = this.getEmbedData();
         }
         else
         {
            var_783.visible = false;
         }
      }
      
      public function startRoomSettingsEdit(param1:int) : void
      {
         this.var_465.reset();
         this.var_198.load(param1);
         this.var_198.active = true;
         this.var_337.active = false;
         this.var_256.active = false;
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function startThumbnailEdit() : void
      {
         this.var_465.reset();
         this.var_198.active = false;
         this.var_337.active = false;
         this.var_256.active = true;
         this.reload();
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_THUMBS));
      }
      
      private function prepareWindow() : void
      {
         if(_window != null)
         {
            return;
         }
         _window = IWindowContainer(_navigator.getXmlWindow("iro_room_details"));
         _window.setParamFlag(HabboWindowParam.const_67,false);
         _window.setParamFlag(HabboWindowParam.const_1248,true);
         var_295 = IWindowContainer(find("room_info"));
         var_338 = IWindowContainer(find("room_details"));
         var_640 = IWindowContainer(find("public_space_details"));
         var_1856 = IWindowContainer(find("owner_name_cont"));
         var_1855 = IWindowContainer(find("rating_cont"));
         var_1165 = IWindowContainer(find("room_buttons"));
         var_718 = ITextWindow(find("room_name"));
         var_958 = ITextWindow(find("public_space_name"));
         _ownerName = ITextWindow(find("owner_name"));
         var_781 = ITextWindow(find("room_desc"));
         var_1170 = ITextWindow(find("public_space_desc"));
         var_957 = ITextWindow(find("owner_caption"));
         var_780 = ITextWindow(find("rating_caption"));
         var_1854 = ITextWindow(find("rate_caption"));
         var_1407 = ITextWindow(find("rating_txt"));
         var_255 = IWindowContainer(find("event_info"));
         var_782 = IWindowContainer(find("event_details"));
         var_1405 = IWindowContainer(find("event_buttons"));
         var_1857 = ITextWindow(find("event_name"));
         var_639 = ITextWindow(find("event_desc"));
         var_1167 = IContainerButtonWindow(find("add_favourite_button"));
         var_1168 = IContainerButtonWindow(find("rem_favourite_button"));
         var_1164 = IContainerButtonWindow(find("make_home_button"));
         var_1166 = IContainerButtonWindow(find("unmake_home_button"));
         var_1404 = IButtonWindow(find("room_settings_button"));
         var_1403 = IButtonWindow(find("create_event_button"));
         var_1406 = IButtonWindow(find("edit_event_button"));
         var_783 = IWindowContainer(find("embed_info"));
         var_1169 = ITextWindow(find("embed_info_txt"));
         var_959 = ITextFieldWindow(find("embed_src_txt"));
         Util.setProcDirectly(var_1167,onAddFavouriteClick);
         Util.setProcDirectly(var_1168,onRemoveFavouriteClick);
         Util.setProcDirectly(var_1404,onRoomSettingsClick);
         Util.setProcDirectly(var_1164,onMakeHomeClick);
         Util.setProcDirectly(var_1166,onUnmakeHomeClick);
         Util.setProcDirectly(var_1403,onEventSettingsClick);
         Util.setProcDirectly(var_1406,onEventSettingsClick);
         Util.setProcDirectly(var_959,onEmbedSrcClick);
         _navigator.refreshButton(var_1167,"favourite",true,null,0);
         _navigator.refreshButton(var_1168,"favourite",true,null,0);
         _navigator.refreshButton(var_1164,"home",true,null,0);
         _navigator.refreshButton(var_1166,"home",true,null,0);
         _window.findChildByName("close").procedure = onCloseButtonClick;
         Util.setProcDirectly(var_295,onHover);
         Util.setProcDirectly(var_255,onHover);
         var_957.width = var_957.textWidth;
         Util.moveChildrenToRow(var_1856,["owner_caption","owner_name"],var_957.x,var_957.y,3);
         var_780.width = var_780.textWidth;
         Util.moveChildrenToRow(var_1855,["rating_caption","rating_txt"],var_780.x,var_780.y,3);
         var_1169.height = NaN;
         Util.moveChildrenToColumn(var_783,["embed_info_txt","embed_src_txt"],var_1169.y,2);
         var_783.height = Util.getLowestPoint(var_783) + 5;
         var_2262 = NaN;
      }
      
      private function refreshEventDetails(param1:RoomEventData) : void
      {
         if(param1 == null || false)
         {
            return;
         }
         var_1857.text = param1.eventName;
         var_639.text = param1.eventDescription;
         var_933.refreshTags(var_782,[_navigator.getText("roomevent_type_" + param1.eventType),param1.tags[0],param1.tags[1]]);
         var_639.visible = false;
         if(param1.eventDescription != "")
         {
            var_639.height = NaN;
            var_639.y = Util.getLowestPoint(var_782) + 2;
            var_639.visible = true;
         }
         var_782.visible = true;
         var_782.height = Util.getLowestPoint(var_782);
      }
      
      private function refresh() : void
      {
         prepareWindow();
         refreshRoom();
         refreshEvent();
         refreshEmbed();
         Util.moveChildrenToColumn(this._window,["room_info","event_info","embed_info"],0,2);
         _window.height = Util.getLowestPoint(_window);
         _window.y = _window.desktop.height - 0 - 5;
         Logger.log("MAIN: undefined, undefined, undefined");
      }
      
      private function onRoomSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = _navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         startRoomSettingsEdit(_loc3_.flatId);
      }
      
      private function onUnmakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("CLEARING HOME ROOM:");
         _navigator.send(new UpdateNavigatorSettingsMessageComposer(0));
      }
      
      private function onEventSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.roomEventData == null)
         {
            if(_navigator.data.currentRoomOwner)
            {
               _navigator.send(new CanCreateEventMessageComposer());
            }
         }
         else
         {
            startEventEdit();
         }
      }
      
      public function roomSettingsRefreshNeeded() : void
      {
         refresh();
      }
      
      public function close() : void
      {
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_844,HabboToolbarIconEnum.ROOMINFO,_window,false));
         if(_window == null)
         {
            return;
         }
         this._window.visible = false;
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_CLOSED));
      }
      
      private function onMakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = _navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         Logger.log("SETTING HOME ROOM TO: " + _loc3_.flatId);
         _navigator.send(new UpdateNavigatorSettingsMessageComposer(_loc3_.flatId));
      }
   }
}
