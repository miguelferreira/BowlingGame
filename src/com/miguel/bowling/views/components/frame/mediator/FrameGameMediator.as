package com.miguel.bowling.views.components.frame.mediator
{
	import com.miguel.bowling.events.FrameGameEvent;
	import com.miguel.bowling.events.GameEvent;
	import com.miguel.bowling.views.components.frame.FrameGame;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class FrameGameMediator extends Mediator
	{
		public function FrameGameMediator()
		{
			super();
		}
		
		[Inject]
		public var view:FrameGame;
		
		override public function onRegister():void
		{
			this.eventMap.mapListener(eventDispatcher, GameEvent.NEW_GAME, newGameHandler);
			
			this.eventMap.mapListener(eventDispatcher, FrameGameEvent.UPDATE_FRAME_TOTAL, updateFrameTotalHandler);
			this.eventMap.mapListener(eventDispatcher, FrameGameEvent.UPDATE_FRAME_FIRST, updateFrameFirstHandler);
			this.eventMap.mapListener(eventDispatcher, FrameGameEvent.UPDATE_FRAME_SECOND,updateFrameSecondHandler);
		}
		
		private function newGameHandler(event:GameEvent):void
		{
			view.newGame();
		}
		
		private function updateFrameTotalHandler(event:FrameGameEvent):void
		{
			if (event.frameGame == view.frameGameVO)
				view.updateTotal();
		}
		
		private function updateFrameFirstHandler(event:FrameGameEvent):void
		{
			if (event.frameGame == view.frameGameVO)
				view.updateFirst();
		}
		
		private function updateFrameSecondHandler(event:FrameGameEvent):void
		{
			if (event.frameGame == view.frameGameVO)
				view.updateSecond();
		}
	}
}