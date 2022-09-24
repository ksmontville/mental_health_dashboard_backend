<template>
  <div class="dashboard bg-wrapper bg-gradient">

    <div class="dashNav container-fluid p-2 mt-2 mb-2">
      <DashboardNavbar />
    </div>

    <div class="container-fluid canvas-wrapper" ref="container" id="canvasContainer">
      <div class="btn-toolbar toolbar bg-gradient p-3 mb-3">
          <div class="input-group mb-3">
            <input ref= "imgInput" accept="image/*" type="file" class="form-control" id="imgUpload" v-on:change="">
            <label class="input-group-text" for="" @click="drawImg">Upload</label>
          </div>
        <div class="btn-group" role="group" aria-label="Toolbar buttons">
          <button class="btn btn-info me-1 text-decoration-line-through">[ Undo ]</button>
          <button class="btn btn-info me-1 text-decoration-line-through">[ Redo ]</button>
          <button class="btn btn-info me-1" @click="clear">[ Clear ]</button>
          <button class="btn btn-info me-1" @tap="click" @click="edit">[ Edit ]</button>
        </div>
      </div>

      <v-stage v-if="isMobile" ref="stage" :config="stageConfig">
        <v-layer ref="layer">
          <v-rect ref="canvas" :config="canvasConfig" @tap="click" @touchmove="touch" @touchstart="toggleTouchStart" @touchend="toggleTouchStart"/>
          <v-image @tap="click" ref="imgUploaded" :config="standby === false ? {image: imgUploaded.value} : null"/>
          <v-transformer ref="transformer"/>
        </v-layer>
      </v-stage>

      <v-stage v-else ref="stage" :config="stageConfigLarge">
        <v-layer ref="layer">
          <v-rect ref="canvas" :config="canvasConfig" @click="click" @mousemove="draw" @mousedown="toggleMouseIsDown" @mouseup="toggleMouseIsDown"/>
          <v-image @click="click" ref="imgUploaded" :config="standby === false ? {image: imgUploaded.value} : null"/>
          <v-transformer ref="transformer"/>
        </v-layer>
      </v-stage>
    </div>
  </div>
</template>

<script>

import {onMounted, ref} from "vue";
import Konva from "konva";

export default {
  name: "GratitudeBoard",

  setup() {
    const isMobile = ref()
    const stage = ref()
    const stageConfig = {
      name: 'stage',
      width: window.innerWidth,
      height: window.innerHeight,
    }
    const stageConfigLarge = {
      name: 'stage',
      width: window.innerWidth,
      height: window.innerHeight,
    }

    const layer= ref()
    const canvas = ref()
    const canvasConfig = {
      name: 'canvas',
      width: stageConfig.width,
      height: stageConfig.height,
      fill: 'white',
    }

    const imgInput = ref()
    const imgUploaded = ref()
    const standby = ref(true)

    const transformer = ref()

    const mouseX = ref()
    const mouseY = ref()
    const mouseIsDown = ref(false)

    const touchX = ref()
    const touchY = ref()
    const touchStart = ref(false)

    detectBrowser()

    function detectBrowser() {
      isMobile.value = /Android|webOS|iPhone|iPad|iPod|BlackBerry|BB|PlayBook|IEMobile|Windows Phone|Kindle|Silk|Opera Mini/i.test(navigator.userAgent);
    }

    function getStageNode() {
      return stage.value.getNode()
    }

    function getLayerNode() {
      return layer.value.getNode()
    }

    function getTransformerNode() {
      return transformer.value.getNode()
    }

    function clear() {
      const children = getLayerNode().children

      for(const child of children.slice(1, children.length)) {
          child.remove()
      }
    }

    function edit() {
      const shape = getStageNode().find('.myImage')
      getTransformerNode().nodes([shape[0]])
      console.log(shape[0])
    }

    function draw() {
      const mousePos = getStageNode().getPointerPosition()

      const dot = new Konva.Circle({
        x: mousePos.x,
        y: mousePos.y,
        radius: 5,
        fill: 'black',
      })

      if(mouseIsDown.value) {
        getLayerNode().add(dot)
      }
    }

    function touch() {
      const touchPos = getStageNode().getPointerPosition()

      const dot = new Konva.Circle({
        x: touchPos.x,
        y: touchPos.y,
        radius: 5,
        fill: 'black'
      })

      getLayerNode().preventDefault()
      if(touchStart.value) {
        getLayerNode().add(dot)
      }
    }

   function drawImg() {
    const file = imgInput.value.files[0]
    const reader = new FileReader()
    const newImage = new window.Image()

    reader.readAsDataURL(file)
      reader.onload = () => {
        newImage.src = reader.result

        imgUploaded.value = new Konva.Image({
          image: newImage,
          name: 'myImage',
          x: 100,
          y: 100,
          width: 100,
          height: 100,
          draggable: true,
          listening: true,
        })
        console.log(imgUploaded.value)
        getLayerNode().add(imgUploaded.value)
        getTransformerNode().nodes([imgUploaded.value])
       }
        standby.value = false
   }

    function toggleMouseIsDown(event) {
      event.type === 'mousedown' ? mouseIsDown.value = true : mouseIsDown.value = false
    }

    function toggleTouchStart(TouchEvent) {
      TouchEvent.type === 'touchstart' ? touchStart.value = true : touchStart.value = false
    }

    function click(event) {
      const shape = getStageNode().find('.myImage')
      if(event.target.name() === 'canvas') {
        getTransformerNode().nodes([])
      }
      else if (event.target.name() === shape[0].name()) {
        console.log(event.type)
        getTransformerNode().nodes([shape[0]])
      }

    }

    return {
    isMobile, stage, layer, canvas, stageConfig, stageConfigLarge, imgInput, standby, mouseIsDown, mouseX, mouseY, touchStart, touchX, touchY,
    canvasConfig, imgUploaded, transformer,
    draw, toggleMouseIsDown, touch, toggleTouchStart, clear, drawImg, click, edit,
      }
    },
  }


</script>

<style scoped>

</style>