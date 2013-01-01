package com.miguel.bowling.model.vo
{
	public class FrameVO
	{
		public var firstHand:int= -1;
		public var secondHand:int = -1;
		public var total:int = 0;
		
		private var _strike:Boolean;
		private var _spare:Boolean;
		
		public var extraPointsBalls:uint = 0;

		public function get spare():Boolean
		{
			return _spare;
		}

		public function set spare(value:Boolean):void
		{
			_spare = value;
			
			if (_spare)
				extraPointsBalls = 1;
		}

		public function get strike():Boolean
		{
			return _strike;
		}

		public function set strike(value:Boolean):void
		{
			_strike = value;
			
			if (_strike)
				extraPointsBalls = 2;
		}
		
		public function compare(frame:FrameVO):Boolean
		{
			return this.firstHand == frame.firstHand 
				&& this.secondHand == frame.secondHand 
				&& this.total == frame.total 
				&& this.spare == frame.spare 
				&& this.strike == frame.strike;
		}

	}
}