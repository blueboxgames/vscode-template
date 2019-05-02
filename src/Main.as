package {
import com.mycompany.mygame.Game;

import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.display3D.Context3DProfile;
import flash.display3D.Context3DRenderMode;
import flash.events.Event;
import flash.geom.Rectangle;
import flash.ui.Multitouch;
import flash.ui.MultitouchInputMode;

import starling.core.Starling;

/**
* ...
* @author Mansour Djawadi
*/

public class Main extends Sprite 
{
	private var starling:Starling;
	public function Main() 
	{
		this.stage.scaleMode = StageScaleMode.NO_SCALE;
		this.stage.align = StageAlign.TOP_LEFT;
		
		// touch or gesture?
		Multitouch.inputMode = MultitouchInputMode.NONE;

		this.loaderInfo.addEventListener(Event.COMPLETE, loaderInfo_completeHandler);
	}

	private function loaderInfo_completeHandler(e:Event):void 
	{
		this.loaderInfo.removeEventListener(Event.COMPLETE, loaderInfo_completeHandler);
		
		var viewPort:Rectangle = new Rectangle(0, 0, stage.fullScreenWidth, stage.fullScreenHeight);
		this.starling = new Starling(Game, this.stage, viewPort, null, Context3DRenderMode.AUTO, Context3DProfile.BASELINE_EXTENDED);
		this.starling.addEventListener("rootCreated", starling_rootCreatedHandler);
		this.starling.supportHighResolutions = true;
		this.starling.skipUnchangedFrames = true;
		this.starling.showStats = true;
		this.starling.start();
		this.starling.stage.stageWidth = 240;
		this.starling.stage.stageHeight = 480;
	}

	protected function starling_rootCreatedHandler(e:*):void 
	{
		this.stage.addEventListener(Event.DEACTIVATE, stage_deactivateHandler, false, 0, true);
	}

	protected function stage_deactivateHandler(event:Event):void
	{
		this.starling.stop(true);
		this.stage.frameRate = 0;
		this.stage.addEventListener(Event.ACTIVATE, stage_activateHandler, false, 0, true);
	}
	protected function stage_activateHandler(event:Event):void
	{
		this.stage.removeEventListener(Event.ACTIVATE, stage_activateHandler);
		this.stage.frameRate = 60;
		this.starling.start();
	}
}	
}