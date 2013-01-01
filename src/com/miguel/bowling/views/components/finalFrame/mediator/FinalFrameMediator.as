package com.miguel.bowling.views.components.finalFrame.mediator
{
	import com.miguel.bowling.events.FrameGameEvent;
	import com.miguel.bowling.events.GameEvent;
	import com.miguel.bowling.views.components.finalFrame.FinalFrameGame;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class FinalFrameMediator extends Mediator
	{
		public function FinalFrameMediator()
		{
			super();
		}
		
		[Inject]public var view:FinalFrameGame;
		
		override public function onRegister():void
		{
			this.eventMap.mapListener(eventDispatcher, GameEvent.NEW_GAME, newGameHandler);
			
			this.eventMap.mapListener(eventDispatcher, FrameGameEvent.UPDATE_FRAME_EXTRA,updateFrameExtraHandler);
			this.eventMap.mapListener(eventDispatcher, FrameGameEvent.UPDATE_FRAME_TOTAL, updateFrameTotalHandler);
			this.eventMap.mapListener(eventDispatcher, FrameGameEvent.UPDATE_FRAME_FIRST, updateFrameFirstHandler);
			this.eventMap.mapListener(eventDispatcher, FrameGameEvent.UPDATE_FRAME_SECOND,updateFrameSecondHandler);
		}
		
		private function updateFrameExtraHandler(event:FrameGameEvent):void
		{
			if (event.frameGame == view.frameGameVO)
				view.updateExtra();
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