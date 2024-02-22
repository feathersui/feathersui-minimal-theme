/*
	feathersui-minimal-theme
	Copyright 2024 Bowler Hat LLC. All Rights Reserved.

	This program is free software. You can redistribute and/or modify it in
	accordance with the terms of the accompanying license agreement.
 */

package com.feathersui.themes.minimal.skins;

#if (feathersui >= "1.1.0")
import feathers.skins.IIndeterminateSkin;
import feathers.skins.ProgrammaticSkin;
import feathers.utils.MathUtil;
import openfl.geom.Point;

@:access(com.feathersui.themes.minimal.BaseMinimalTheme)
class MinimalActivitySkin extends ProgrammaticSkin implements IIndeterminateSkin {
	private static final SYMBOL_COUNT = 4;
	private static final DEFAULT_SIZE = 16;

	public function new(theme:BaseMinimalTheme) {
		super();
		_theme = theme;
	}

	private var _theme:BaseMinimalTheme;

	private var _indeterminatePosition:Float = 0.0;

	public var indeterminatePosition(get, set):Float;

	public function get_indeterminatePosition():Float {
		return this._indeterminatePosition;
	}

	public function set_indeterminatePosition(value:Float):Float {
		if (this._indeterminatePosition == value) {
			return this._indeterminatePosition;
		}
		this._indeterminatePosition = value;
		setInvalid(DATA);
		return this._indeterminatePosition;
	}

	override private function update():Void {
		var dataInvalid = isInvalid(DATA);
		var sizeInvalid = isInvalid(SIZE);

		sizeInvalid = measure() || sizeInvalid;

		if (dataInvalid || sizeInvalid) {
			drawSkin();
		}
	}

	private function measure():Bool {
		var needsWidth = explicitWidth == null;
		var needsHeight = explicitHeight == null;
		if (!needsWidth && !needsHeight) {
			return false;
		}

		var newWidth = this.explicitWidth;
		if (needsWidth) {
			if (needsHeight) {
				newWidth = DEFAULT_SIZE;
			} else {
				newWidth = this.explicitHeight;
			}
		}

		var newHeight = this.explicitHeight;
		if (needsHeight) {
			if (needsHeight) {
				newHeight = DEFAULT_SIZE;
			} else {
				newHeight = this.explicitWidth;
			}
		}
		return saveMeasurements(newWidth, newHeight);
	}

	private function drawSkin():Void {
		graphics.clear();

		var radius = Math.min(this.actualWidth, this.actualHeight) / 2.0;
		var centerX = this.actualWidth / 2.0;
		var centerY = this.actualHeight / 2.0;

		var degreesPerSegment = 360.0 / SYMBOL_COUNT;
		var nearestAngle = 45.0 + MathUtil.roundToNearest(this._indeterminatePosition * 360.0, degreesPerSegment);

		removeChildren();

		graphics.beginFill(0xff00ff, 0.0);
		graphics.drawRect(0.0, 0.0, actualWidth, actualHeight);
		graphics.endFill();
		for (i in 0...SYMBOL_COUNT) {
			var point = Point.polar(radius - 2.0, (-i * 2.0 * Math.PI / SYMBOL_COUNT) + nearestAngle * Math.PI / 180.0);

			var ratio = i / SYMBOL_COUNT;
			var currentAlpha = 1.0 - (1.0 * ratio);

			graphics.beginFill(_theme.labelTextColor, currentAlpha);
			graphics.drawRect(centerX + point.x - 3.0, centerY + point.y - 3.0, 6.0, 6.0);
			graphics.endFill();
		}
	}
}
#end
