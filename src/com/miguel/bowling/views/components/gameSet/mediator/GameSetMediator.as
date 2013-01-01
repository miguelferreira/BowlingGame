package com.miguel.bowling.views.components.gameSet.mediator
{
	import com.miguel.bowling.events.GameEvent;
	import com.miguel.bowling.views.components.gameSet.GameSet;
	
	import org.robotlegs.core.IMediator;
	import org.robotlegs.mvcs.Mediator;
	
	public class GameSetMediator extends Mediator implements IMediator
	{
		public function GameSetMediator()
		{
			super();
		}
		
		[Inject]
		public var view:GameSet;
		
		override public function onRegister():void
		{
			this.eventMap.mapListener(eventDispatcher, GameEvent.NEW_GAME_READY, newGameReadyHandler);
			
			this.eventDispatcher.dispatchEvent( new GameEvent( GameEvent.GAME_SET_VIEW_READY)  );
		}
		
		private function newGameReadyHandler(event:GameEvent):void
		{
			view.newGame(event.newGame);
		}
		
	}
}