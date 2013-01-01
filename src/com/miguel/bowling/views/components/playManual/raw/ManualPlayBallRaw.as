package com.miguel.bowling.views.components.playManual.raw
{
	import com.miguel.bowling.events.GameEvent;
	import com.miguel.bowling.model.vo.PlayVO;
	import com.miguel.bowling.setup.SetupGame;
	
	import flash.events.MouseEvent;
	
	import spark.components.Button;
	import spark.components.Group;
	import spark.components.TextInput;
	
	public class ManualPlayBallRaw extends Group
	{
		public function ManualPlayBallRaw()
		{
			super();
		}
		
		private var firstPlay:Boolean = true;
		
		public var pinsTakedDownText:TextInput;
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
			var pinsAux:Number = Number(pinsTakedDownText.text);
			
			if ( validatePlay(pinsAux) )
				setpins(pinsAux);
		}
		
		private function validatePlay(pinsAux:Number):Boolean
		{
			if (!pinsAux) return false;
			
			if ( firstPlay)
				return pinsAux >= 0 && pinsAux <= SetupGame.MAX_NUM_PINS;
			else
				return pinsAux >= 0 && pinsAux <= SetupGame.MAX_NUM_PINS - _pins;
		}
		
	}
}