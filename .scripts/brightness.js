#!/bin/node

var fs = require('fs');
var exec = require('child_process').exec;

var args = process.argv.slice(2)

var max = fs.readFileSync('/sys/class/backlight/gmux_backlight/max_brightness', { encoding: 'utf8' });
var brightness = fs.readFileSync('/sys/class/backlight/gmux_backlight/brightness', { encoding: 'utf8' });

if (!args[0] || parseInt(args[0]) !== parseInt(args[0])) {
  console.log('Usage: brightness [+|-]<percentage>');
  process.exit(1)
} else {
  const delta = Number(args[0]) / 100
  const result = Math.max(0.01, Math.min(brightness / max + delta, 1))
  const b = Math.floor(result * max)
  console.log(b)
  process.exit(0)
}
