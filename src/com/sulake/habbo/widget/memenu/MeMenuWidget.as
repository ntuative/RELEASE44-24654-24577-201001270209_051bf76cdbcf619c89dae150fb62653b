package com.sulake.habbo.widget.memenu
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetAvatarActionUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetAvatarEditorUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetCreditBalanceUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetDanceUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetFrameUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetHabboClubUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomObjectUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetSettingsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetToolbarClickedUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetTutorialEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEffectsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetWaveUpdateEvent;
   import com.sulake.habbo.widget.memenu.enum.HabboMeMenuTrackingEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetRequestWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetSelectOutfitMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetToolbarMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.external.ExternalInterface;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class MeMenuWidget extends RoomWidgetBase
   {
      
      public static const const_580:String = "me_menu_settings_view";
      
      private static const const_744:int = 10;
      
      public static const const_662:String = "me_menu_effects_view";
      
      public static const const_121:String = "me_menu_top_view";
      
      public static const const_1334:String = "me_menu_rooms_view";
      
      public static const const_919:String = "me_menu_dance_moves_view";
      
      public static const const_250:String = "me_menu_my_clothes_view";
       
      
      private var var_1958:Boolean = false;
      
      private var _isAnimating:Boolean = false;
      
      private var _eventDispatcher:IEventDispatcher;
      
      private var var_1436:int = 0;
      
      private var var_1956:int = 0;
      
      private var var_1960:Boolean = false;
      
      private var var_267:Boolean = false;
      
      private var var_1957:int = 0;
      
      private var var_1878:Number = 0;
      
      private var _mainContainer:IWindowContainer;
      
      private var var_555:Boolean = false;
      
      private var var_103:ClubPromoView;
      
      private var _config:IHabboConfigurationManager;
      
      private var var_1201:int = 0;
      
      private var var_1959:Boolean = false;
      
      private var var_978:Point;
      
      private var var_42:IMeMenuView;
      
      public function MeMenuWidget(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboLocalizationManager, param4:IEventDispatcher, param5:IHabboConfigurationManager)
      {
         super(param1,param2,param3);
         _config = param5;
         var_978 = new Point(0,0);
         _eventDispatcher = param4;
         if(param5 != null && false)
         {
            var_1959 = param5.getKey("client.news.embed.enabled","false") == "true";
         }
         changeView(const_121);
         hide();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetWaveUpdateEvent.const_658,onWaveEvent);
         param1.addEventListener(RoomWidgetDanceUpdateEvent.const_536,onDanceEvent);
         param1.addEventListener(RoomWidgetUpdateEffectsUpdateEvent.const_694,onUpdateEffects);
         param1.addEventListener(RoomWidgetToolbarClickedUpdateEvent.const_696,onToolbarClicked);
         param1.addEventListener(RoomWidgetFrameUpdateEvent.const_285,onUpdate);
         param1.addEventListener(RoomWidgetAvatarEditorUpdateEvent.const_531,onAvatarEditorClosed);
         param1.addEventListener(RoomWidgetAvatarEditorUpdateEvent.const_341,onShowAvatarEditorClubPromo);
         param1.addEventListener(RoomWidgetAvatarEditorUpdateEvent.const_874,onHideAvatarEditorClubPromo);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_186,onAvatarDeselected);
         param1.addEventListener(RoomWidgetHabboClubUpdateEvent.const_210,onHabboClubEvent);
         param1.addEventListener(RoomWidgetAvatarActionUpdateEvent.const_615,onAvatarActionEvent);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_201,onUserInfo);
         param1.addEventListener(RoomWidgetSettingsUpdateEvent.const_314,onSettingsUpdate);
         param1.addEventListener(RoomWidgetTutorialEvent.const_101,onTutorialEvent);
         param1.addEventListener(RoomWidgetTutorialEvent.const_353,onTutorialEvent);
         param1.addEventListener(RoomWidgetCreditBalanceUpdateEvent.const_156,onCreditBalance);
         super.registerUpdateEvents(param1);
      }
      
      private function onUpdate(param1:Event = null) : void
      {
         if(!_isAnimating)
         {
            return;
         }
      }
      
      override public function get mainWindow() : IWindow
      {
         return _mainContainer;
      }
      
      public function get hasEffectOn() : Boolean
      {
         return var_555;
      }
      
      private function onSettingsUpdate(param1:RoomWidgetSettingsUpdateEvent) : void
      {
         if(!var_267)
         {
            return;
         }
         if(var_42.window.name == const_580)
         {
            (var_42 as MeMenuSettingsView).updateSettings(param1);
         }
      }
      
      public function get isHabboClubActive() : Boolean
      {
         return var_1201 > 0;
      }
      
      private function onWaveEvent(param1:RoomWidgetWaveUpdateEvent) : void
      {
         Logger.log("[MeMenuWidget] Wave Event received");
      }
      
      private function onCreditBalance(param1:RoomWidgetCreditBalanceUpdateEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var_1436 = param1.balance;
         localizations.registerParameter("widget.memenu.credits","credits",var_1436.toString());
      }
      
      private function onUserInfo(param1:RoomWidgetUserInfoUpdateEvent) : void
      {
         var _loc2_:* = null;
         if(!(var_267 && var_42.window.name == const_250))
         {
            _loc2_ = new RoomWidgetRequestWidgetMessage(RoomWidgetRequestWidgetMessage.const_542);
            if(messageListener != null)
            {
               messageListener.processWidgetMessage(_loc2_);
            }
         }
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetWaveUpdateEvent.const_658,onWaveEvent);
         param1.removeEventListener(RoomWidgetDanceUpdateEvent.const_536,onDanceEvent);
         param1.removeEventListener(RoomWidgetUpdateEffectsUpdateEvent.const_694,onUpdateEffects);
         param1.removeEventListener(RoomWidgetToolbarClickedUpdateEvent.const_696,onToolbarClicked);
         param1.removeEventListener(RoomWidgetFrameUpdateEvent.const_285,onUpdate);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_186,onAvatarDeselected);
         param1.removeEventListener(RoomWidgetHabboClubUpdateEvent.const_210,onHabboClubEvent);
         param1.removeEventListener(RoomWidgetAvatarActionUpdateEvent.const_615,onAvatarActionEvent);
         param1.removeEventListener(RoomWidgetAvatarEditorUpdateEvent.const_531,onAvatarEditorClosed);
         param1.removeEventListener(RoomWidgetAvatarEditorUpdateEvent.const_341,onShowAvatarEditorClubPromo);
         param1.removeEventListener(RoomWidgetAvatarEditorUpdateEvent.const_874,onHideAvatarEditorClubPromo);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_201,onUserInfo);
         param1.removeEventListener(RoomWidgetSettingsUpdateEvent.const_314,onSettingsUpdate);
         param1.removeEventListener(RoomWidgetTutorialEvent.const_353,onTutorialEvent);
         param1.removeEventListener(RoomWidgetTutorialEvent.const_101,onTutorialEvent);
         param1.removeEventListener(RoomWidgetCreditBalanceUpdateEvent.const_156,onCreditBalance);
      }
      
      override public function dispose() : void
      {
         hide();
         _eventDispatcher = null;
         if(var_42 != null)
         {
            var_42.dispose();
            var_42 = null;
         }
         super.dispose();
      }
      
      public function get allowHabboClubDances() : Boolean
      {
         return var_1958;
      }
      
      public function changeToOutfit(param1:int) : void
      {
         var_1878 = new Date().valueOf();
         this.messageListener.processWidgetMessage(new RoomWidgetSelectOutfitMessage(param1));
      }
      
      private function onHideAvatarEditorClubPromo(param1:RoomWidgetAvatarEditorUpdateEvent) : void
      {
         if(var_103 != null)
         {
            var_103.dispose();
            var_103 = null;
         }
         updateSize();
      }
      
      public function get isDancing() : Boolean
      {
         return var_1960;
      }
      
      public function get creditBalance() : int
      {
         return var_1436;
      }
      
      private function onTutorialEvent(param1:RoomWidgetTutorialEvent) : void
      {
         switch(param1.type)
         {
            case RoomWidgetTutorialEvent.const_353:
               Logger.log("* MeMenuWidget: onHighlightClothesIcon " + var_267 + " view: " + var_42.window.name);
               if(var_267 != true || var_42.window.name != const_121)
               {
                  return;
               }
               (var_42 as MeMenuMainView).setIconAssets("clothes_icon",const_121,"clothes_highlighter_blue");
               break;
            case RoomWidgetTutorialEvent.const_101:
               hide();
         }
      }
      
      public function canChangeOutfit() : Boolean
      {
         var _loc1_:Number = new Date().valueOf();
         return _loc1_ - var_1878 > 5000;
      }
      
      public function get habboClubPeriods() : int
      {
         return var_1956;
      }
      
      private function onAvatarActionEvent(param1:RoomWidgetAvatarActionUpdateEvent) : void
      {
         switch(param1.actionType)
         {
            case RoomWidgetAvatarActionUpdateEvent.EFFECT_ACTIVE:
               var_555 = true;
               break;
            case RoomWidgetAvatarActionUpdateEvent.EFFECT_INACTIVE:
               var_555 = false;
               break;
            default:
               trace("MeMenuWidget: unknown avatar action event: " + param1.actionType);
         }
      }
      
      private function onHabboClubEvent(param1:RoomWidgetHabboClubUpdateEvent) : void
      {
         var _loc2_:* = var_1201 > 0;
         var_1201 = param1.daysLeft;
         var_1956 = param1.periodsLeft;
         var_1957 = param1.pastPeriods;
         var_1958 = param1.allowClubDances;
         if(_loc2_ != param1.daysLeft > 0)
         {
            if(var_42 != null)
            {
               changeView(var_42.window.name);
            }
         }
      }
      
      public function set isDancing(param1:Boolean) : void
      {
         var_1960 = param1;
      }
      
      private function onAvatarDeselected(param1:Event) : void
      {
         if(var_42 != null && var_42.window.name != const_250)
         {
            hide();
         }
      }
      
      private function onShowAvatarEditorClubPromo(param1:RoomWidgetAvatarEditorUpdateEvent) : void
      {
         var _loc2_:* = null;
         if(var_42 != null && var_42.window.name == const_250)
         {
            if(param1.promoMode == RoomWidgetAvatarEditorUpdateEvent.const_988)
            {
               var_103 = new ClubPromoView(this,param1.promoImageUrl,ClubPromoView.const_1331);
            }
            else
            {
               var_103 = new ClubPromoView(this,param1.promoImageUrl,ClubPromoView.const_409);
            }
            _loc2_ = _mainContainer.getChildByName(var_42.window.name);
            if(_loc2_ != null)
            {
               var_103.window.x = _loc2_.width + const_744;
               _mainContainer.addChild(var_103.window);
               _mainContainer.width = var_103.window.x + var_103.window.width;
            }
         }
      }
      
      private function onUpdateEffects(param1:RoomWidgetUpdateEffectsUpdateEvent) : void
      {
         var _loc2_:* = null;
         var_555 = false;
         for each(_loc2_ in param1.effects)
         {
            if(_loc2_.isInUse)
            {
               var_555 = true;
            }
         }
         if(var_42 != null && var_42.window.name == const_662)
         {
            (var_42 as MeMenuEffectsView).updateEffects(param1.effects);
         }
      }
      
      public function get habboClubPastPeriods() : int
      {
         return var_1957;
      }
      
      public function get habboClubDays() : int
      {
         return var_1201;
      }
      
      public function get mainContainer() : IWindowContainer
      {
         if(_mainContainer == null)
         {
            _mainContainer = windowManager.createWindow("me_menu_main_container","",HabboWindowType.const_1174,HabboWindowStyle.const_807,HabboWindowParam.const_40,new Rectangle(0,0,170,260)) as IWindowContainer;
            _mainContainer.tags.push("room_widget_me_menu");
         }
         return _mainContainer;
      }
      
      private function onToolbarClicked(param1:RoomWidgetToolbarClickedUpdateEvent) : void
      {
         switch(param1.iconType)
         {
            case RoomWidgetToolbarClickedUpdateEvent.ICON_TYPE_ME_MENU:
               var_267 = !var_267;
               break;
            case RoomWidgetToolbarClickedUpdateEvent.ICON_TYPE_ROOM_INFO:
               var_267 = false;
               break;
            default:
               return;
         }
         if(var_267)
         {
            show();
         }
         else
         {
            hide();
         }
      }
      
      private function onDanceEvent(param1:RoomWidgetDanceUpdateEvent) : void
      {
         Logger.log("[MeMenuWidget] Dance Event received, style: " + param1.style);
      }
      
      public function hide(param1:RoomWidgetRoomObjectUpdateEvent = null) : void
      {
         var _loc2_:RoomWidgetToolbarMessage = new RoomWidgetToolbarMessage(RoomWidgetToolbarMessage.const_499);
         _loc2_.window = _mainContainer.parent as IWindowContainer;
         if(messageListener != null)
         {
            messageListener.processWidgetMessage(_loc2_);
         }
         if(var_42 != null)
         {
            _mainContainer.removeChild(var_42.window);
            var_42.dispose();
            var_42 = null;
         }
         var_267 = false;
         _eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_CLOSE));
      }
      
      private function onAvatarEditorClosed(param1:RoomWidgetAvatarEditorUpdateEvent) : void
      {
         if(var_42 != null && var_42.window.name == const_250)
         {
            if(var_103 != null)
            {
               var_103.dispose();
               var_103 = null;
            }
            changeView(const_121);
         }
      }
      
      public function get isNewsEnabled() : Boolean
      {
         return var_1959;
      }
      
      public function changeView(param1:String) : void
      {
         var _loc2_:* = null;
         if(var_103 != null)
         {
            var_103.dispose();
            var_103 = null;
         }
         switch(param1)
         {
            case const_121:
               _loc2_ = new MeMenuMainView();
               _eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_DEFAULT));
               break;
            case const_662:
               _loc2_ = new MeMenuEffectsView();
               _eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_EFFECTS));
               break;
            case const_919:
               _loc2_ = new MeMenuDanceView();
               _eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_DANCE));
               break;
            case const_250:
               _loc2_ = new MeMenuClothesView();
               break;
            case const_1334:
               _loc2_ = new MeMenuRoomsView();
               break;
            case const_580:
               _loc2_ = new MeMenuSettingsView();
               break;
            default:
               Logger.log("Me Menu Change view: unknown view: " + param1);
         }
         if(_loc2_ != null)
         {
            if(var_42 != null)
            {
               _mainContainer.removeChild(var_42.window);
               var_42.dispose();
               var_42 = null;
            }
            var_42 = _loc2_;
            var_42.init(this,param1);
         }
         updateSize();
      }
      
      public function updateSize() : void
      {
         if(var_42 != null)
         {
            var_978.x = var_42.window.width + 10;
            var_978.y = var_42.window.height;
            var_42.window.x = 5;
            var_42.window.y = 0;
            _mainContainer.width = var_978.x;
            _mainContainer.height = var_978.y;
            if(var_103 != null)
            {
               _mainContainer.width = var_103.window.x + var_103.window.width + const_744;
            }
         }
      }
      
      public function get config() : IHabboConfigurationManager
      {
         return _config;
      }
      
      private function show() : void
      {
         changeView(const_121);
         var _loc1_:RoomWidgetToolbarMessage = new RoomWidgetToolbarMessage(RoomWidgetToolbarMessage.const_512);
         _loc1_.window = _mainContainer.parent as IWindowContainer;
         if(messageListener != null)
         {
            messageListener.processWidgetMessage(_loc1_);
         }
         var_267 = true;
      }
   }
}
