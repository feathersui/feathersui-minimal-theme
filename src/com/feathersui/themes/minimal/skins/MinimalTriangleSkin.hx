/*
	feathersui-minimal-theme
	Copyright 2024 Bowler Hat LLC. All Rights Reserved.

	This program is free software. You can redistribute and/or modify it in
	accordance with the terms of the accompanying license agreement.
 */

package com.feathersui.themes.minimal.skins;

import feathers.graphics.LineStyle;
import feathers.graphics.FillStyle;
import feathers.skins.TriangleSkin;

class MinimalTriangleSkin extends TriangleSkin {
	public function new(?fill:FillStyle, ?border:LineStyle) {
		super(fill, border);
	}

	override private function update():Void {
		if (uiContext != null) {
			alpha = uiContext.enabled ? 1.0 : 0.5;
		} else {
			alpha = 1.0;
		}
		super.update();
	}
}
