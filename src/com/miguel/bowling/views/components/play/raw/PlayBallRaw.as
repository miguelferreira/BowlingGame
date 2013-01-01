package com.miguel.bowling.views.components.play.raw
{
	import com.miguel.bowling.events.GameEvent;
	import com.miguel.bowling.helper.BowlingNumber;
	import com.miguel.bowling.model.vo.PlayVO;
	import com.miguel.bowling.setup.SetupGame;
	
	import flash.events.MouseEvent;
	
	import spark.components.Button;
	import spark.components.Group;
	import spark.components.Label;
	
	public class PlayBallRaw extends Group
	{
		public function PlayBallRaw()
		{
			super();
		}
		
		private var firstPlay:Boolean = true;
		
		public var pinsTakedDownLabel:Label;
		public var trowBallButton:Button;
		
		private var _pins:uint = 0;
		public function get pins():uint
		{
			return _pins;
		}
		
		public function newGame():void
		{
			this.enabled = true;
		}
		
		public function endGame():void
		{
			this.enabled = false;
		}
		
		private function setpins(value:uint):void
		{
			_pins = value;
			pinsTakedDownLabel.text = _pins.toString();
			
			var playBall:PlayVO = new PlayVO();
				playBall.pinsPlay = _pins;
			
				firstPlay= _pins == SetupGame.MAX_NUM_PINS? true: !firstPlay;
			this.dispatchEvent( new GameEvent(GameEvent.NEW_PLAY, playBall));
		}
		
		override protected function childrenCreated():void
		{
			super.childrenCreated();
			
			addListeners();
		}
		
		private function addListeners():void
		{
			trowBallButton.addEventListener(MouseEvent.CLICK, trowBallButton_clickHandler);
		}
		
		protected function trowBallButton_clickHandler(event:MouseEvent):void
		{
			if (firstPlay)
				setpins(BowlingNumber.getNumberOfPinsDown(SetupGame.MAX_NUM_PINS));
			else
				setpins(BowlingNumber.getNumberOfPinsDown(SetupGame.MAX_NUM_PINS - _pins));
		}
		
	}
}