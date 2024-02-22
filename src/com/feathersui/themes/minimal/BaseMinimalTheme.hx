/*
	feathersui-minimal-theme
	Copyright 2024 Bowler Hat LLC. All Rights Reserved.

	This program is free software. You can redistribute and/or modify it in
	accordance with the terms of the accompanying license agreement.
 */

package com.feathersui.themes.minimal;

import feathers.skins.RectangleSkin;
import com.feathersui.themes.minimal.skins.MinimalRectangleSkin;
import feathers.style.IDarkModeTheme;
import feathers.events.StyleProviderEvent;
import feathers.controls.ToggleButtonState;
import feathers.controls.ButtonState;
import feathers.skins.BaseGraphicsPathSkin;
import openfl.filters.DropShadowFilter;
import openfl.text.TextFormatAlign;
import openfl.text.TextFormat;
import feathers.themes.ClassVariantTheme;

/**
	"Minimal" theme, based on the design of MinimalComps by Keith Peters (also
	known as BIT-101).
**/
class BaseMinimalTheme extends ClassVariantTheme implements IDarkModeTheme {
	private static final DARK_BACKGROUND = 0x444444;
	private static final DARK_BUTTON_FACE = 0x666666;
	private static final DARK_BUTTON_DOWN = 0x222222;
	private static final DARK_BUTTON_SELECTED = 0x111111;
	private static final DARK_INPUT_TEXT = 0xBBBBBB;
	private static final DARK_LABEL_TEXT = 0xCCCCCC;
	private static final DARK_PANEL = 0x666666;
	private static final DARK_PROGRESS_BAR = 0x666666;
	private static final DARK_TEXT_BACKGROUND = 0x555555;
	private static final DARK_LIST_DEFAULT = 0x444444;
	private static final DARK_LIST_ALTERNATE = 0x393939;
	private static final DARK_LIST_SELECTED = 0x666666;
	private static final DARK_LIST_ROLLOVER = 0x777777;
	private static final DARK_LIST_HEADING = 0x393939;
	private static final DARK_DROPSHADOW = 0x000000;
	private static final DARK_DANGER_TEXT = 0xFF6666;
	private static final DARK_SECONDARY_LABEL_TEXT = 0xAAAAAA;
	private static final DARK_CONTAINER = 0x4F4F4F;
	private static final DARK_INPUT_TEXT_DISABLED = 0x999999;
	private static final DARK_LABEL_TEXT_DISABLED = 0x999999;
	private static final DARK_PROMPT_TEXT = 0xAAAAAA;

	private static final LIGHT_BACKGROUND = 0xCCCCCC;
	private static final LIGHT_BUTTON_FACE = 0xFFFFFF;
	private static final LIGHT_BUTTON_DOWN = 0xEEEEEE;
	private static final LIGHT_BUTTON_SELECTED = 0xDDDDDD;
	private static final LIGHT_INPUT_TEXT = 0x333333;
	private static final LIGHT_LABEL_TEXT = 0x666666;
	private static final LIGHT_PANEL = 0xF3F3F3;
	private static final LIGHT_PROGRESS_BAR = 0xFFFFFF;
	private static final LIGHT_TEXT_BACKGROUND = 0xFFFFFF;
	private static final LIGHT_LIST_DEFAULT = 0xFFFFFF;
	private static final LIGHT_LIST_ALTERNATE = 0xF3F3F3;
	private static final LIGHT_LIST_SELECTED = 0xCCCCCC;
	private static final LIGHT_LIST_ROLLOVER = 0xDDDDDD;
	private static final LIGHT_LIST_HEADING = 0xE3E3E3;
	private static final LIGHT_DROPSHADOW = 0x000000;
	private static final LIGHT_DANGER_TEXT = 0xFF3333;
	private static final LIGHT_SECONDARY_LABEL_TEXT = 0x7F7F7F;
	private static final LIGHT_CONTAINER = 0xEBEBEB;
	private static final LIGHT_INPUT_TEXT_DISABLED = 0xAAAAAA;
	private static final LIGHT_LABEL_TEXT_DISABLED = 0x999999;
	private static final LIGHT_PROMPT_TEXT = 0x7F7F7F;

	private var textBackgroundColor:UInt;
	private var backgroundColor:UInt;
	private var buttonFaceColor:UInt;
	private var buttonDownColor:UInt;
	private var buttonSelectedColor:UInt;
	private var inputTextColor:UInt;
	private var inputTextDisabledColor:UInt;
	private var labelTextColor:UInt;
	private var labelTextDisabledColor:UInt;
	private var promptTextColor:UInt;
	private var dangerTextColor:UInt;
	private var dropShadowColor:UInt;
	private var panelColor:UInt;
	private var progressBarColor:UInt;
	private var listDefaultColor:UInt;
	private var listAlternateColor:UInt;
	private var listHeadingColor:UInt;
	private var listSelectedColor:UInt;
	private var listRollOverColor:UInt;
	private var secondaryLabelTextColor:UInt;
	private var containerColor:UInt;

	private var embedFonts:Bool = false;
	private var fontName:String = "PF Ronda Seven";
	private var fontSize:Int = 8;
	private var headingFontSize:Int = 9;
	private var detailFontSize:Int = 7;

	private var _darkMode:Bool = false;

	@:bindable("stylesChange")
	public var darkMode(get, set):Bool;

	private function get_darkMode():Bool {
		return this._darkMode;
	}

	private function set_darkMode(value:Bool):Bool {
		if (_darkMode == value) {
			return _darkMode;
		}
		_darkMode = value;
		refreshStyle();
		StyleProviderEvent.dispatch(this.styleProvider, StyleProviderEvent.STYLES_CHANGE);
		return _darkMode;
	}

	private function new(darkMode:Bool = false) {
		super();
		_darkMode = darkMode;
		refreshStyle();
	}

	private function refreshStyle():Void {
		if (_darkMode) {
			textBackgroundColor = DARK_TEXT_BACKGROUND;
			backgroundColor = DARK_BACKGROUND;
			buttonFaceColor = DARK_BUTTON_FACE;
			buttonDownColor = DARK_BUTTON_DOWN;
			buttonSelectedColor = DARK_BUTTON_SELECTED;
			inputTextColor = DARK_INPUT_TEXT;
			inputTextDisabledColor = DARK_INPUT_TEXT_DISABLED;
			labelTextColor = DARK_LABEL_TEXT;
			labelTextDisabledColor = DARK_LABEL_TEXT_DISABLED;
			promptTextColor = DARK_PROMPT_TEXT;
			dangerTextColor = DARK_DANGER_TEXT;
			dropShadowColor = DARK_DROPSHADOW;
			panelColor = DARK_PANEL;
			progressBarColor = DARK_PROGRESS_BAR;
			listDefaultColor = DARK_LIST_DEFAULT;
			listAlternateColor = DARK_LIST_ALTERNATE;
			listHeadingColor = DARK_LIST_HEADING;
			listSelectedColor = DARK_LIST_SELECTED;
			listRollOverColor = DARK_LIST_ROLLOVER;
			secondaryLabelTextColor = DARK_SECONDARY_LABEL_TEXT;
			containerColor = DARK_CONTAINER;
		} else {
			textBackgroundColor = LIGHT_TEXT_BACKGROUND;
			backgroundColor = LIGHT_BACKGROUND;
			buttonFaceColor = LIGHT_BUTTON_FACE;
			buttonDownColor = LIGHT_BUTTON_DOWN;
			buttonSelectedColor = LIGHT_BUTTON_SELECTED;
			inputTextColor = LIGHT_INPUT_TEXT;
			inputTextDisabledColor = LIGHT_INPUT_TEXT_DISABLED;
			labelTextColor = LIGHT_LABEL_TEXT;
			labelTextDisabledColor = LIGHT_LABEL_TEXT_DISABLED;
			promptTextColor = LIGHT_PROMPT_TEXT;
			dangerTextColor = LIGHT_DANGER_TEXT;
			dropShadowColor = LIGHT_DROPSHADOW;
			panelColor = LIGHT_PANEL;
			progressBarColor = LIGHT_PROGRESS_BAR;
			listDefaultColor = LIGHT_LIST_DEFAULT;
			listAlternateColor = LIGHT_LIST_ALTERNATE;
			listHeadingColor = LIGHT_LIST_HEADING;
			listSelectedColor = LIGHT_LIST_SELECTED;
			listRollOverColor = LIGHT_LIST_ROLLOVER;
			secondaryLabelTextColor = LIGHT_SECONDARY_LABEL_TEXT;
			containerColor = LIGHT_CONTAINER;
		}
	}

	private function getTextFormat(?fontName:String, ?fontSize:Int, ?color:UInt, ?align:TextFormatAlign):TextFormat {
		return new TextFormat(fontName != null ? fontName : this.fontName, fontSize != null ? fontSize : this.fontSize,
			color != null ? color : labelTextColor, null, null, null, null, null, align != null ? align : null);
	}

	private function getDisabledTextFormat(?fontName:String, ?fontSize:Int, ?color:UInt, ?align:TextFormatAlign):TextFormat {
		return new TextFormat(fontName != null ? fontName : this.fontName, fontSize != null ? fontSize : this.fontSize,
			color != null ? color : labelTextDisabledColor);
	}

	private function getShadow(dist:Float, knockout:Bool = false):DropShadowFilter {
		#if !flash
		// this gets OpenFL rendering a bit more closely to Flash
		dist *= 1.5;
		#end
		return new DropShadowFilter(dist, 45, dropShadowColor, 1, dist, dist, 0.3, 1, knockout);
	}

	private function getBackSkin(?skinClass:Class<BaseGraphicsPathSkin>, ?color:UInt):BaseGraphicsPathSkin {
		if (skinClass == null) {
			skinClass = MinimalRectangleSkin;
		}
		var back:BaseGraphicsPathSkin = Type.createInstance(skinClass, []);
		back.fill = SolidColor(color != null ? color : backgroundColor);
		back.border = None;
		back.filters = [getShadow(2.0, true)];
		return back;
	}

	private function getFaceSkin(?skinClass:Class<BaseGraphicsPathSkin>, includeSelectedStyles:Bool = true):BaseGraphicsPathSkin {
		if (skinClass == null) {
			skinClass = MinimalRectangleSkin;
		}
		var face:BaseGraphicsPathSkin = Type.createInstance(skinClass, []);
		face.fill = SolidColor(buttonFaceColor);
		if (includeSelectedStyles) {
			face.selectedFill = SolidColor(buttonSelectedColor);
		}
		face.setFillForState(ButtonState.DOWN, SolidColor(buttonDownColor));
		face.setFillForState(ToggleButtonState.DOWN(false), SolidColor(buttonDownColor));
		if (includeSelectedStyles) {
			face.setFillForState(ToggleButtonState.DOWN(true), SolidColor(buttonDownColor));
		}
		face.border = None;
		face.filters = [getShadow(1.0)];
		return face;
	}

	private function getFocusRectSkin(?skinClass:Class<BaseGraphicsPathSkin>, ?color:UInt):BaseGraphicsPathSkin {
		if (skinClass == null) {
			skinClass = RectangleSkin;
		}
		var skin:BaseGraphicsPathSkin = Type.createInstance(skinClass, []);
		skin.fill = None;
		skin.border = SolidColor(1.0, backgroundColor);
		return skin;
	}
}
