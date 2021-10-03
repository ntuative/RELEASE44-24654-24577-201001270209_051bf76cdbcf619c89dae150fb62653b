package com.sulake.habbo.navigator.mainview
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.ICoreUpdateReceiver;
   import com.sulake.core.utils.ErrorReportStorage;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.ISelectableWindow;
   import com.sulake.core.window.components.ITabButtonWindow;
   import com.sulake.core.window.components.ITabContextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.outgoing.navigator.GetOfficialRoomsMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.GetPopularRoomTagsMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.LatestEventsSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.MyFavouriteRoomsSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.MyFriendsRoomsSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.MyRoomHistorySearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.MyRoomsSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.PopularRoomsSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RoomTagSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RoomTextSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RoomsWhereMyFriendsAreSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RoomsWithHighestScoreSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.session.QuitMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.IViewCtrl;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.domain.Tab;
   import com.sulake.habbo.navigator.domain.Tabs;
   import com.sulake.habbo.navigator.events.HabboNavigatorTrackingEvent;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class MainViewCtrl implements ICoreUpdateReceiver
   {
      
      public static const const_545:int = 2;
      
      public static const const_946:int = 4;
      
      private static const const_482:int = 2;
      
      private static const const_746:int = 1;
      
      public static const const_1510:int = 3;
      
      private static const const_1066:int = 4;
      
      private static const const_477:int = 22;
      
      public static const const_462:int = 1;
      
      private static const const_745:int = 3;
       
      
      private var var_1967:int = 0;
      
      private var var_1207:IRegionWindow;
      
      private var var_391:int;
      
      private var var_1209:Boolean = true;
      
      private var var_1441:GuestRoomListCtrl;
      
      private var var_28:IFrameWindow;
      
      private var var_505:Timer;
      
      private var var_268:IWindowContainer;
      
      private var var_201:IWindowContainer;
      
      private var var_226:IWindowContainer;
      
      private var var_11:IWindow;
      
      private var var_1206:Boolean;
      
      private var var_1966:OfficialRoomListCtrl;
      
      private var var_35:IWindowContainer;
      
      private var var_1442:PopularTagsListCtrl;
      
      private var _navigator:HabboNavigator;
      
      private var var_1208:int = 0;
      
      private var var_235:ITabContextWindow;
      
      public function MainViewCtrl(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_1442 = new PopularTagsListCtrl(_navigator);
         var_1441 = new GuestRoomListCtrl(_navigator);
         var_1966 = new OfficialRoomListCtrl(_navigator);
         var_505 = new Timer(300,1);
         var_505.addEventListener(TimerEvent.TIMER,onResizeTimer);
      }
      
      private function getSearchMsg(param1:int, param2:String) : IMessageComposer
      {
         if(param1 == Tabs.const_497)
         {
            return new MyFavouriteRoomsSearchMessageComposer();
         }
         if(param1 == Tabs.const_493)
         {
            return new MyFriendsRoomsSearchMessageComposer();
         }
         if(param1 == Tabs.const_636)
         {
            return new MyRoomHistorySearchMessageComposer();
         }
         if(param1 == Tabs.const_205)
         {
            return new MyRoomsSearchMessageComposer();
         }
         if(param1 == Tabs.const_303)
         {
            return new PopularRoomsSearchMessageComposer(param2);
         }
         if(param1 == Tabs.const_502)
         {
            return new RoomsWhereMyFriendsAreSearchMessageComposer();
         }
         if(param1 == Tabs.const_665)
         {
            return new RoomsWithHighestScoreSearchMessageComposer();
         }
         if(param1 == Tabs.const_311)
         {
            return new RoomTagSearchMessageComposer(param2);
         }
         if(param1 == Tabs.const_204)
         {
            return new RoomTextSearchMessageComposer(param2);
         }
         if(param1 == Tabs.const_406)
         {
            return new LatestEventsSearchMessageComposer(param2);
         }
         Logger.log("No message for searchType: " + param1);
         return null;
      }
      
      private function prepare() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var_28 = IFrameWindow(_navigator.getXmlWindow("grs_main_window"));
         var_235 = ITabContextWindow(var_28.findChildByName("tab_context"));
         var_35 = IWindowContainer(var_28.findChildByName("tab_content"));
         var_226 = IWindowContainer(var_28.findChildByName("custom_content"));
         var_201 = IWindowContainer(var_28.findChildByName("list_content"));
         var_268 = IWindowContainer(var_28.findChildByName("custom_footer"));
         var_11 = var_28.findChildByName("loading_text");
         var _loc1_:IWindow = var_28.findChildByTag("close");
         _loc1_.procedure = onWindowClose;
         var_1207 = IRegionWindow(var_28.findChildByName("to_hotel_view"));
         var_1207.procedure = onHotelView;
         refreshToHotelViewButton(false);
         var_28.procedure = onWindow;
         for each(_loc2_ in _navigator.tabs.tabs)
         {
            _loc3_ = var_235.getTabItemByID(_loc2_.id);
            _loc3_.setParamFlag(HabboWindowParam.const_39,true);
            _loc3_.procedure = onTabClick;
            _loc2_.button = _loc3_;
         }
         var_28.scaler.setParamFlag(HabboWindowParam.const_685,false);
         var_28.scaler.setParamFlag(HabboWindowParam.const_1156,true);
      }
      
      public function get mainWindow() : IFrameWindow
      {
         return var_28;
      }
      
      private function onTabClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_53)
         {
            return;
         }
         var _loc3_:int = param2.id;
         if(var_1206)
         {
            var_1206 = false;
            return;
         }
         var _loc4_:Tab = _navigator.tabs.getTab(_loc3_);
         _loc4_.sendSearchRequest();
         switch(_loc4_.id)
         {
            case Tabs.const_287:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_EVENTS));
               break;
            case Tabs.const_238:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_ME));
               break;
            case Tabs.const_316:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_OFFICIAL));
               break;
            case Tabs.const_236:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_ROOMS));
               break;
            case Tabs.const_217:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCH));
         }
      }
      
      private function refreshScrollbar(param1:IViewCtrl) : void
      {
         if(param1.content == null || !param1.content.visible)
         {
            return;
         }
         var _loc2_:IItemListWindow = IItemListWindow(param1.content.findChildByName("item_list"));
         var _loc3_:IWindow = param1.content.findChildByName("scroller");
         var _loc4_:* = _loc2_.scrollableRegion.height > _loc2_.height;
         if(_loc3_.visible)
         {
            if(_loc4_)
            {
               return;
            }
            _loc3_.visible = false;
            _loc2_.width += const_477;
         }
         else
         {
            if(!_loc4_)
            {
               return;
            }
            _loc3_.visible = true;
            _loc2_.width -= const_477;
         }
      }
      
      private function onWindowClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Close window");
         this.close();
      }
      
      private function sendTrackingEvent(param1:int) : void
      {
         switch(param1)
         {
            case Tabs.const_406:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_LATEST_EVENTS));
               break;
            case Tabs.const_497:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_FAVOURITES));
               break;
            case Tabs.const_493:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_FRIENDS_ROOMS));
               break;
            case Tabs.const_636:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_HISTORY));
               break;
            case Tabs.const_205:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_ROOMS));
               break;
            case Tabs.const_693:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_OFFICIALROOMS));
               break;
            case Tabs.const_303:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_POPULAR_ROOMS));
               break;
            case Tabs.const_502:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_ROOMS_WHERE_MY_FRIENDS_ARE));
               break;
            case Tabs.const_665:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_ROOMS_WITH_HIGHEST_SCORE));
               break;
            case Tabs.const_311:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_TAG_SEARCH));
               break;
            case Tabs.const_204:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_TEXT_SEARCH));
         }
      }
      
      private function refreshList(param1:Boolean, param2:Boolean, param3:IViewCtrl, param4:String) : void
      {
         var _loc5_:* = null;
         if(!param2)
         {
            return;
         }
         if(param3.content == null)
         {
            _loc5_ = var_201.getChildByName(param4);
            param3.content = IWindowContainer(_loc5_);
         }
         if(param1)
         {
            param3.refresh();
         }
         param3.content.visible = true;
      }
      
      public function isOpen() : Boolean
      {
         return var_28 != null && false;
      }
      
      private function refreshListContent(param1:Boolean) : void
      {
         Util.hideChildren(var_201);
         refreshGuestRooms(param1,_navigator.data.guestRoomSearchArrived);
         refreshPopularTags(param1,_navigator.data.popularTagsArrived);
         refreshOfficialRooms(param1,_navigator.data.officialRoomsArrived);
      }
      
      private function onResizeTimer(param1:TimerEvent) : void
      {
         refreshScrollbar(var_1442);
         refreshScrollbar(var_1441);
      }
      
      public function get disposed() : Boolean
      {
         return false;
      }
      
      public function stretchNewEntryIfNeeded(param1:IViewCtrl, param2:IWindowContainer) : void
      {
         var _loc3_:IWindow = param1.content.findChildByName("scroller");
         if(_loc3_.visible)
         {
            return;
         }
         param2.width += const_477;
      }
      
      public function startSearch(param1:int, param2:int, param3:String = "-1", param4:int = 1) : void
      {
         var _loc5_:Tab = _navigator.tabs.getSelected();
         _navigator.tabs.setSelectedTab(param1);
         var _loc6_:Tab = _navigator.tabs.getSelected();
         ErrorReportStorage.addDebugData("StartSearch","Start search " + _loc5_.id + " => " + _loc6_.id);
         this.var_1209 = _loc5_ != _loc6_;
         if(_loc5_ != _loc6_)
         {
            _loc6_.tabPageDecorator.tabSelected();
         }
         _navigator.data.startLoading();
         if(param4 == const_462)
         {
            _navigator.send(getSearchMsg(param2,param3));
         }
         else if(param4 == const_545)
         {
            _navigator.send(new GetPopularRoomTagsMessageComposer());
         }
         else
         {
            _navigator.send(new GetOfficialRoomsMessageComposer());
         }
         if(!isOpen())
         {
            open();
            this.var_391 = const_482;
            this.var_201.blend = 0;
            if(this.var_226.visible)
            {
               this.var_226.blend = 0;
               this.var_268.blend = 0;
            }
         }
         else
         {
            this.var_391 = const_746;
         }
         this.var_1208 = 0;
         _navigator.registerUpdateReceiver(this,2);
         sendTrackingEvent(param2);
      }
      
      private function refreshCustomContent() : void
      {
         Util.hideChildren(var_226);
         var _loc1_:Tab = _navigator.tabs.getSelected();
         _loc1_.tabPageDecorator.refreshCustomContent(var_226);
         if(Util.hasVisibleChildren(var_226))
         {
            var_226.visible = true;
         }
         else
         {
            var_226.visible = false;
            var_226.blend = 1;
         }
      }
      
      public function dispose() : void
      {
      }
      
      private function onWindow(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_43 || param2 != var_28)
         {
            return;
         }
         if(!this.var_505.running)
         {
            this.var_505.reset();
            this.var_505.start();
         }
      }
      
      private function refreshOfficialRooms(param1:Boolean, param2:Boolean) : void
      {
         refreshList(param1,param2,var_1966,"official_rooms");
      }
      
      private function refreshPopularTags(param1:Boolean, param2:Boolean) : void
      {
         refreshList(param1,param2,var_1442,"popular_tags");
      }
      
      private function refreshGuestRooms(param1:Boolean, param2:Boolean) : void
      {
         refreshList(param1,param2,var_1441,"guest_rooms");
      }
      
      private function refreshTab() : void
      {
         var _loc1_:Tab = _navigator.tabs.getSelected();
         var _loc2_:ISelectableWindow = var_235.selector.getSelected();
         if(_loc1_.button != _loc2_)
         {
            var_1206 = true;
            var_235.selector.setSelected(_loc1_.button);
         }
      }
      
      public function onNavigatorToolBarIconClick() : Boolean
      {
         if(isOpen())
         {
            close();
            return false;
         }
         var _loc1_:Tab = _navigator.tabs.getSelected();
         _loc1_.tabPageDecorator.navigatorOpenedWhileInTab();
         return true;
      }
      
      public function open() : void
      {
         var _loc1_:Boolean = false;
         if(this.var_28 == null)
         {
            prepare();
            _loc1_ = true;
         }
         refresh();
         var_28.visible = true;
         var_28.activate();
         if(_loc1_)
         {
            _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_47,HabboToolbarIconEnum.NAVIGATOR,var_28));
         }
      }
      
      private function refreshFooter() : void
      {
         Util.hideChildren(var_268);
         var _loc1_:Tab = _navigator.tabs.getSelected();
         _loc1_.tabPageDecorator.refreshFooter(var_268);
         if(Util.hasVisibleChildren(var_268))
         {
            var_268.visible = true;
         }
         else
         {
            var_268.visible = false;
         }
      }
      
      public function reloadRoomList(param1:int) : Boolean
      {
         ErrorReportStorage.addDebugData("MainViewCtrl","Reloading RoomList");
         if(this.isOpen() && this._navigator.data.guestRoomSearchResults != null && this._navigator.data.guestRoomSearchResults.searchType == param1)
         {
            startSearch(_navigator.tabs.getSelected().id,param1,"");
            return true;
         }
         return false;
      }
      
      private function onHotelView(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            refreshToHotelViewButton(true);
         }
         else if(param1.type == WindowMouseEvent.const_29)
         {
            refreshToHotelViewButton(false);
         }
         else if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            _navigator.send(new QuitMessageComposer());
         }
      }
      
      public function refresh() : void
      {
         if(var_28 == null)
         {
            return;
         }
         refreshTab();
         refreshCustomContent();
         refreshListContent(true);
         refreshFooter();
         var_226.height = Util.getLowestPoint(var_226);
         var_268.height = Util.getLowestPoint(var_268);
         var _loc1_:int = 0;
         Util.moveChildrenToColumn(var_35,["custom_content","list_content"],var_226.y,8);
         var_201.height = var_201.height + _loc1_ - 0 - 0 + var_1967;
         Util.moveChildrenToColumn(var_35,["list_content","custom_footer"],var_201.y,8);
         var_1967 = var_268.height;
         onResizeTimer(null);
      }
      
      public function update(param1:uint) : void
      {
         var _loc3_:Number = NaN;
         if(this.var_201 == null)
         {
            return;
         }
         var _loc2_:Number = param1 / 150;
         if(var_391 == const_746)
         {
            _loc3_ = Math.min(1,Math.max(0,this.var_201.blend - _loc2_));
            this.var_201.blend = _loc3_;
            this.var_226.blend = !!var_1209 ? Number(_loc3_) : Number(1);
            this.var_268.blend = !!var_1209 ? Number(_loc3_) : Number(1);
            if(_loc3_ == 0)
            {
               var_391 = const_482;
            }
         }
         else if(var_391 == const_482)
         {
            if(var_1208 % 10 == 1)
            {
               var_11.visible = true;
            }
            ++var_1208;
            if(!_navigator.data.isLoading())
            {
               var_391 = const_745;
            }
         }
         else if(var_391 == const_745)
         {
            this.refresh();
            var_391 = const_1066;
         }
         else
         {
            var_11.visible = false;
            _loc3_ = Math.min(1,Math.max(0,this.var_201.blend + _loc2_));
            this.var_201.blend = _loc3_;
            this.var_226.blend = !!var_1209 ? Number(_loc3_) : Number(1);
            this.var_268.blend = !!var_1209 ? Number(_loc3_) : Number(1);
            if(false)
            {
               _navigator.removeUpdateReceiver(this);
            }
         }
      }
      
      private function refreshToHotelViewButton(param1:Boolean) : void
      {
         _navigator.refreshButton(var_1207,"icon_hotelview",!param1,null,0);
         _navigator.refreshButton(var_1207,"icon_hotelview_reactive",param1,null,0);
      }
      
      public function close() : void
      {
         if(var_28 != null)
         {
            var_28.visible = false;
         }
      }
   }
}
