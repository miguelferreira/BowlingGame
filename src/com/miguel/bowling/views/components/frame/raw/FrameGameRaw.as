package com.miguel.bowling.views.components.frame.raw
{
	import com.miguel.bowling.model.vo.FrameVO;
	
	import spark.components.BorderContainer;
	import spark.components.Label;
	
	public class FrameGameRaw extends BorderContainer
	{
		public function FrameGameRaw()
		{
			super();
		}
		
		public var firstPlay:Label;
		public var secondPlay:Label;
		public var total:Label;
		
		private var _frameGameVO:FrameVO = new FrameVO();
		public function get frameGameVO():FrameVO
		{
			return _frameGameVO;
		}

		public function set frameGameVO(value:FrameVO):void
		{
			_frameGameVO = value;
		}

		public function updateTotal():void
		{
			total.text = frameGameVO.total.toString();
		}
		
		public function updateFirst():void
		{
			firstPlay.text = frameGameVO.firstHand.toString();
		}
		
		public function updateSecond():void
		{
			secondPlay.text = frameGameVO.secondHand.toString();
		}
		
		public function newGame():void
		{
			firstPlay.text 	= "";
			secondPlay.text = "";
			total.text 		= "";
		}
	}
}