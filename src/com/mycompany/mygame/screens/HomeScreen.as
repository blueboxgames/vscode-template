package com.mycompany.mygame.screens
{
import com.gerantech.extensions.NativeAbilities;
import com.mycompany.mygame.Game;
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

public class HomeScreen extends Screen
{

	public function HomeScreen()
	{
		super();
	}

	override protected function initialize() : void 
	{
		super.initialize();
		this.layout = new AnchorLayout();
		
		var changeLocaleButton:Button = new Button();
		changeLocaleButton.label = Localizations.instance.get("change_locale_button_label");
		changeLocaleButton.layoutData = new AnchorLayoutData(NaN, NaN, NaN, NaN, 0, -50);
		changeLocaleButton.addEventListener(Event.TRIGGERED, this.changeLocaleButton_triggeredHandler);
		this.addChild(changeLocaleButton);
		
		var nextScreenutton:Button = new Button();
		nextScreenutton.label = Localizations.instance.get("next_button_label");
		nextScreenutton.layoutData = new AnchorLayoutData(NaN, NaN, NaN, NaN, 0, 0);
		nextScreenutton.addEventListener(Event.TRIGGERED, this.nextScreenButton_triggeredHandler);
		this.addChild(nextScreenutton);

		var toastButton:Button = new Button();
		toastButton.label = Localizations.instance.get("toast_button_label");
		toastButton.layoutData = new AnchorLayoutData(NaN, NaN, NaN, NaN, 0, 50);
		toastButton.addEventListener(Event.TRIGGERED, this.toastButton_triggeredHandler);
		this.addChild(toastButton);
	}

	protected function changeLocaleButton_triggeredHandler(e:Event) : void 
	{
		Localizations.instance.changeLocale(Localizations.instance.locale == "en_US" ? "fa_IR" : "en_US");
	}
	protected function nextScreenButton_triggeredHandler(e:Event) : void 
	{
		this.dispatchEventWith(Game.FIRST_SCREEN);
	}
	protected function toastButton_triggeredHandler(e:Event) : void 
	{
		NativeAbilities.instance.showToast("Hello android native abilities!", 2);
	}
}
}