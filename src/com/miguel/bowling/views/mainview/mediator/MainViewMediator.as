package com.miguel.bowling.views.mainview.mediator
{
	import com.miguel.bowling.events.GameEvent;
	import com.miguel.bowling.views.mainview.MainView;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class MainViewMediator extends Mediator
	{
		public function MainViewMediator()
		{
			super();
		}
		
		[Inject]
		public var view:MainView;
		
		override public function onRegister():void
		{
			this.eventMap.mapListener(view, GameEvent.NEW_GAME, view_newGameHandler);
		}
		
		private function view_newGameHandler(event:GameEvent):void
		{
			dispatch(event);
		}
	}
}