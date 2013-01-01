package com.miguel.bowling.model
{
	import com.miguel.bowling.events.FrameGameEvent;
	import com.miguel.bowling.events.GameEvent;
	import com.miguel.bowling.model.vo.FinalFrameVO;
	import com.miguel.bowling.model.vo.FrameVO;
	import com.miguel.bowling.model.vo.GameVO;
	import com.miguel.bowling.setup.SetupGame;
	
	import org.robotlegs.mvcs.Actor;
	
	public class BowlingModel extends Actor
	{
		public function BowlingModel()
		{
			super();
		}
		
		private var lastFrameSet:uint = SetupGame.MAX_NUM_PLAYS - 1;
		
		private var _gameFrame:uint = 0;
		public function get gameFrame():uint
		{
			return _gameFrame;
		}

		public function set gameFrame(value:uint):void
		{
			_gameFrame = value;
		}

		
		private var _gameModel:GameVO;
		public function get gameModel():GameVO
		{
			return _gameModel;
		}
		
		public function newGame():void
		{
			_gameModel = new GameVO();
			_gameFrame = 0;
		}
		
		public function newPlay(pins:uint):void
		{
			var frame:FrameVO = gameModel.game[gameFrame];
			var beforeFrame:FrameVO;
			var totalBefore:uint = 0;
			
			if (gameFrame > 0)
			{
				updateStrikeSpareFrame(pins, true);
				updateStrikeSpareFrame(pins,false);
				//Must be after this calculation because 
				//of the total calculation
				beforeFrame = gameModel.game[gameFrame -1];
				totalBefore = beforeFrame.total;
			}
			
			playFrame(frame, pins, totalBefore);
			
			if (frame is FinalFrameVO && (frame.strike || frame.spare) && FinalFrameVO(frame).extraHand >= 0 ) 
			{
				frame.extraPointsBalls = 0;
				updateTotal(frame, 0, totalBefore);
				endGame();
			}
			else if (frame is FinalFrameVO && frame.secondHand >= 0 && !frame.spare && !frame.strike)
			{
				endGame();
			}
		}
		
		
		private function updateStrikeSpareFrame(pins:uint, strike:Boolean):void
		{
			var frame:FrameVO;
			var beforeFrame:FrameVO;
			var totalBefore:uint = 0
			var option:String = strike ? "strike" : "spare";
			var len:uint = strike ? SetupGame.STRIKE_BALLS : SetupGame.SPARE_BALLS;
			
			for (var i:int=gameFrame-1; i>=gameFrame-len && i >=0; i--)
			{
				frame = gameModel.game[i];
				
				if (frame && frame[option]===true && frame.extraPointsBalls > 0)
				{
					frame.extraPointsBalls -=1;
					
					if (i > 0 && frame.extraPointsBalls === 0)
					{
						beforeFrame = gameModel.game[i-1];
						totalBefore = beforeFrame.extraPointsBalls === 0 ? beforeFrame.total : 0;
					}
					
					updateTotal(frame, pins, totalBefore);
				}
			}
		}
		
		private function playFrame(frame:FrameVO, pins:uint, totalBefore:uint):void
		{
			var firstHandPlayed:Boolean = frame.firstHand < 0;
			
			updateHand(frame, pins, firstHandPlayed);
			
			if ( (frame.strike && firstHandPlayed) || !firstHandPlayed )
				nextGameFrame();
			
			if (!frame.strike && !frame.spare && !firstHandPlayed)
			{
				updateTotal(frame, 0, totalBefore);
			}
		}
		
		private function updateHand(frame:FrameVO, pinsPlay:uint, firstHand:Boolean):void
		{
			if (firstHand)
			{
				frame.firstHand = pinsPlay;
				frame.strike = pinsPlay == 10;
				
				dispatch( new FrameGameEvent(FrameGameEvent.UPDATE_FRAME_FIRST, frame) );
			}
			else if ( frame is FinalFrameVO && (frame.strike || frame.spare) && frame.secondHand >= 0 )
			{
				var finalFrame:FinalFrameVO = frame as FinalFrameVO;
				finalFrame.extraHand = pinsPlay;
				dispatch( new FrameGameEvent(FrameGameEvent.UPDATE_FRAME_EXTRA, frame) );
			}
			else
			{
				frame.secondHand = pinsPlay;
				frame.spare = frame.firstHand + pinsPlay == 10;
				
				dispatch( new FrameGameEvent(FrameGameEvent.UPDATE_FRAME_SECOND, frame) );
			}
			
			frame.total += pinsPlay;
		}
		
		private function updateTotal(frame:FrameVO, pins:uint, totalBefore:uint = 0):void
		{
			frame.total += pins;
			
			if (frame.extraPointsBalls ===0)
			{
				frame.total += totalBefore;	
				dispatch( new FrameGameEvent(FrameGameEvent.UPDATE_FRAME_TOTAL, frame) );
			}
		}
		
		private function nextGameFrame():void
		{
			if (gameFrame!=lastFrameSet)
				gameFrame += 1;
		}
		
		private function endGame():void
		{
			dispatch( new GameEvent(GameEvent.END_GAME) );
		}
		
	}
}