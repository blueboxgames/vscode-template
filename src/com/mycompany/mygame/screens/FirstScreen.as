package com.mycompany.mygame.screens {

import com.mycompany.mygame.utils.Localizations;

import feathers.controls.Button;
import feathers.controls.Screen;
import feathers.layout.AnchorLayout;
import feathers.layout.AnchorLayoutData;

import starling.events.Event;

/**
 * ...
 * @author Mansour Djawadi
 */

public class FirstScreen extends Screen 
{
	public function FirstScreen() 
	{
		super();
	}

	override protected function initialize() : void 
	{
		super.initialize();
		
		this.layout = new AnchorLayout();
		
		var backButton:Button = new Button();
		backButton.label = Localizations.instance.get("back_button_label");
		backButton.layoutData = new AnchorLayoutData(32, 32, 32, 32);
		backButton.addEventListener(Event.TRIGGERED, this.button_triggeredHandler);
		this.addChild(backButton);
	}

	protected function button_triggeredHandler(e:Event) : void 
	{
		this.dispatchEventWith(Event.COMPLETE);
	}
}
}