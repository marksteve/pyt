var WIDTH = 375
var HEIGHT = 627

var game = new Phaser.Game({
  width: WIDTH,
  height: HEIGHT,
  renderer: Phaser.AUTO,
  parent: '',
  state: {
     init: init,
     preload: preload,
     create: create,
     update: update,
  },
  transparent: false,
  antialias: true,
  backgroundColor: '#ffffcc',
})

var cursors

function init() {
  game.scale.scaleMode = Phaser.ScaleManager.SHOW_ALL
  game.scale.pageAlignVertically = true
  game.scale.pageAlignHorizontally = true
  cursors = game.input.keyboard.createCursorKeys()
}

function preload() {
  game.load.image('level-1/head', 'level-1/head.png')
  game.load.image('level-1/body', 'level-1/body.png')
  game.load.image('level-1/limb', 'level-1/limb.png')
}

var head, body, larm, rarm, lleg, rleg

function create() {
  game.physics.startSystem(Phaser.Physics.ARCADE)
  head = game.add.image(WIDTH / 2, 200, 'level-1/head')
  head.anchor.set(0.5, 0.8)
  body = game.add.image(WIDTH / 2, 200, 'level-1/body')
  body.anchor.set(0.5, 0)
  larm = game.add.image(WIDTH / 2 - 15, 215, 'level-1/limb')
  larm.anchor.set(1, 0.5)
  rarm = game.add.image(WIDTH / 2 + 15, 215, 'level-1/limb')
  rarm.anchor.set(0, 0.5)
  lleg = game.add.image(WIDTH / 2 - 15, 270, 'level-1/limb')
  lleg.anchor.set(1, 0.5)
  rleg = game.add.image(WIDTH / 2 + 15, 270, 'level-1/limb')
  rleg.anchor.set(0, 0.5)
}

function update() {
   head.angle = 5 * Math.sin(game.time.now / 100)
   larm.angle = 15 * Math.cos(game.time.now / 200)
   rarm.angle = 15 * Math.sin(game.time.now / 200)
   lleg.angle = -60 + 15 * Math.sin(game.time.now / 200)
   rleg.angle = 60 - 15 * Math.cos(game.time.now / 200)
}


