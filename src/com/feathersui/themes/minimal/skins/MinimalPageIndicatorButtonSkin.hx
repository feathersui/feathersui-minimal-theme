/*
	feathersui-minimal-theme
	Copyright 2024 Bowler Hat LLC. All Rights Reserved.

	This program is free software. You can redistribute and/or modify it in
	accordance with the terms of the accompanying license agreement.
 */

package com.feathersui.themes.minimal.skins;

import feathers.controls.ButtonState;
import feathers.controls.IToggle;
import feathers.skins.BaseGraphicsPathSkin;
import feathers.skins.ProgrammaticSkin;
import openfl.filters.BitmapFilter;

@:access(com.feathersui.themes.minimal.BaseMinimalTheme)
class MinimalPageIndicatorButtonSkin extends ProgrammaticSkin {
	public function new(theme:BaseMinimalTheme) {
		super();

		_back = theme.getBackSkin();
		addChild(_back);

		_face = theme.getFaceSkin();
		_face.selectedFill = null;
		addChild(_face);

		_face.filters = [theme.getShadow(1.0, false)];
	}

	private var _back:BaseGraphicsPathSkin;
	private var _face:BaseGraphicsPathSkin;

	private var _filters:Array<BitmapFilter>;

	override private function update():Void {
		_face.uiContext = uiContext;
		_back.uiContext = uiContext;

		_back.x = 0.0;
		_back.y = 0.0;
		_back.width = actualWidth;
		_back.height = actualHeight;
		_face.x = 1.0;
		_face.y = 1.0;
		_face.width = actualWidth - 2.0;
		_face.height = actualHeight - 2.0;
	}
}
