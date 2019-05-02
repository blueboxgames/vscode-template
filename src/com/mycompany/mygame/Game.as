package com.mycompany.mygame {

import com.mycompany.mygame.screens.FirstScreen;
import com.mycompany.mygame.screens.HomeScreen;
import com.mycompany.mygame.utils.Localizations;

import feathers.controls.Drawers;
import feathers.controls.StackScreenNavigator;
import feathers.controls.StackScreenNavigatorItem;
import feathers.core.IFeathersControl;
import feathers.motion.Cover;
import feathers.motion.Reveal;
import feathers.themes.MetalWorksMobileTheme;

import starling.events.Event;
import starling.utils.AssetManager;

/**
 * ...
 * @author Mansour Djawadi
 */

public class Game extends Drawers
{

	static public const HOME_SCREEN:String = "homeScreen";
	static public const FIRST_SCREEN:String = "firstScreen";
	private var navigator:StackScreenNavigator;

	public function Game(content:IFeathersControl = null)
	{
		new MetalWorksMobileTheme();
		super(content);
	}

	override protected function initialize():void
	{
		super.initialize();
		// this.stage.color = 0x3382E7;
		
		this.navigator = new StackScreenNavigator();
		this.content = this.navigator;

		this.addScreen(HOME_SCREEN,		HomeScreen);
		this.addScreen(FIRST_SCREEN,	FirstScreen,	Cover.createCoverLeftTransition(), Reveal.createRevealRightTransition());

		Localizations.instance.addEventListener(Event.CHANGE, localizations_changeHandler);
		Localizations.instance.changeLocale("fa_IR", new AssetManager());
	}

	private function addScreen(screenType:String, screenClass:Object, pushTranstion:Function = null, popTranstion:Function = null) : void
	{
		var item:StackScreenNavigatorItem = new StackScreenNavigatorItem(screenClass);
		if( pushTranstion != null )
			item.pushTransition = pushTranstion;
		if( popTranstion != null )
			item.popTransition = popTranstion;
		item.addPopEvent(Event.COMPLETE);
		item.setScreenIDForPushEvent(FIRST_SCREEN, FIRST_SCREEN);
		this.navigator.addScreen(screenType, item);
	}

	protected function localizations_changeHandler():void
	{
		this.navigator.rootScreenID = HOME_SCREEN;
	}
}
}