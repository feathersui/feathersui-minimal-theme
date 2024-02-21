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
class MinimalButtonSkin extends ProgrammaticSkin {
	public function new(theme:BaseMinimalTheme) {
		super();

		_back = theme.getBackSkin();
		addChild(_back);

		_face = theme.getFaceSkin();
		addChild(_face);

		_upFilters = [theme.getShadow(1.0, false)];
		_downFilters = [theme.getShadow(1.0, true)];
	}

	private var _back:BaseGraphicsPathSkin;
	private var _face:BaseGraphicsPathSkin;

	private var _upFilters:Array<BitmapFilter>;
	private var _downFilters:Array<BitmapFilter>;

	override private function update():Void {
		_face.uiContext = uiContext;
		_face.stateContext = stateContext;

		var selected = (uiContext is IToggle) ? (cast uiContext : IToggle).selected : false;
		if (stateContext != null) {
			_face.filters = switch (stateContext.currentState) {
				case ButtonState.DOWN:
					_downFilters;
				default: selected ? _downFilters : _upFilters;
			};
		} else {
			_face.filters = _upFilters;
		}

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
