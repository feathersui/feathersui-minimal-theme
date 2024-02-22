/*
	feathersui-minimal-theme
	Copyright 2024 Bowler Hat LLC. All Rights Reserved.

	This program is free software. You can redistribute and/or modify it in
	accordance with the terms of the accompanying license agreement.
 */

package com.feathersui.themes.minimal.skins;

import feathers.controls.IToggle;
import feathers.skins.BaseGraphicsPathSkin;
import feathers.skins.ProgrammaticSkin;

@:access(com.feathersui.themes.minimal.BaseMinimalTheme)
class MinimalToggleIconSkin extends ProgrammaticSkin {
	public function new(theme:BaseMinimalTheme, ?skinClass:Class<BaseGraphicsPathSkin>) {
		super();

		_back = theme.getBackSkin(skinClass);
		addChild(_back);

		_face = theme.getFaceSkin(skinClass, false);
		addChild(_face);
	}

	public var padding:Float = 2.0;

	private var _back:BaseGraphicsPathSkin;
	private var _face:BaseGraphicsPathSkin;

	override private function update():Void {
		_back.uiContext = uiContext;
		_back.stateContext = stateContext;
		_face.uiContext = uiContext;
		_face.stateContext = stateContext;

		_back.x = 0.0;
		_back.y = 0.0;
		_back.width = actualWidth;
		_back.height = actualHeight;
		_face.x = padding;
		_face.y = padding;
		_face.width = actualWidth - (2.0 * padding);
		_face.height = actualHeight - (2.0 * padding);
		_face.visible = (uiContext is IToggle) ? (cast uiContext : IToggle).selected : false;
	}
}
