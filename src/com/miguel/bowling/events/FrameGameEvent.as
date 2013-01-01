package com.miguel.bowling.events
{
	import com.miguel.bowling.model.vo.FrameVO;
	
	import flash.events.Event;
	
	
	public class FrameGameEvent extends Event
	{
		public static const UPDATE_FRAME_TOTAL:String 	= "UPDATE_FRAME_TOTAL";
		public static const UPDATE_FRAME_FIRST:String 	= "UPDATE_FRAME_FIRST";
		public static const UPDATE_FRAME_SECOND:String 	= "UPDATE_FRAME_SECOND";
		public static const UPDATE_FRAME_EXTRA:String	= "UPDATE_FRAME_EXTRA";
		
		public var frameGame:FrameVO;
		
		public function FrameGameEvent(type:String,frame:FrameVO)
		{
			this.frameGame = frame;
			super(type, false, false);
		}
		
		override public function clone():Event
		{
			return new FrameGameEvent(type, frameGame);	
		}
	}
}